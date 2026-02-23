-- cue_yaml.lua
-- Append YAML list items with: date, file(abs), time(hms), seconds, name
local mp = require "mp"
local utils = require "mp.utils"

-- ===== Config =====
local LOG_PATH = mp.command_native({ "expand-path", "~/.local/share/mpv/cues.yaml" })

-- Terminal emulator command to run interactive fzf.
-- Examples:
--   {"xterm", "-e"}  (default)
--   {"st", "-e"}
--   {"foot", "-e"}
--   {"alacritty", "-e"}
local FZF_TERM = { "foot", "-e" }

-- fzf flags: --print-query lets you type a new name or select existing.
local FZF_ARGS = {
  "fzf",
  "--print-query",
  "--prompt=Cue name> ",
  "--height=40%",
  "--border",
}

-- Use local time instead of UTC by removing the leading "!".
local function iso_now_utc()
  return os.date("!%Y-%m-%dT%H:%M:%SZ")
end

-- ===== Helpers =====
local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function yaml_quote(s)
  -- conservative double-quoted YAML scalar
  if s == nil then return '""' end
  s = tostring(s)
  s = s:gsub("\\", "\\\\")
  s = s:gsub("\"", "\\\"")
  s = s:gsub("\n", "\\n")
  return "\"" .. s .. "\""
end

local function fmt_hms_msec(sec)
  if not sec then return "??:??:??.???" end
  local ms = math.floor((sec - math.floor(sec)) * 1000 + 0.5)
  sec = math.floor(sec)
  local h = math.floor(sec / 3600)
  local m = math.floor((sec % 3600) / 60)
  local s = sec % 60
  return string.format("%02d:%02d:%02d.%03d", h, m, s, ms)
end

local function is_url(p)
  return p:match("^[a-zA-Z][a-zA-Z0-9+.-]*://") ~= nil
end

local function abs_path()
  local p = mp.get_property("path") or mp.get_property("filename") or "<unknown>"
  if p == "<unknown>" or is_url(p) then
    return p
  end

  -- If already absolute, keep it; else join with working-directory.
  local wd = mp.get_property("working-directory") or "."
  local candidate = p
  if not p:match("^/") then
    candidate = utils.join_path(wd, p)
  end

  -- Try to normalize via realpath (best-effort).
  -- Alpine/busybox may have realpath; if not, we just use candidate.
  local rp = utils.subprocess({ args = { "realpath", "-m", candidate } })
  if rp and rp.status == 0 and rp.stdout and trim(rp.stdout) ~= "" then
    return trim(rp.stdout)
  end
  return candidate
end

local function mkdir_parent(path)
  local dir = utils.split_path(path)
  if dir and dir ~= "" then
    mp.command_native({ "mkdir", dir })
  end
end

local function append_text(path, text)
  mkdir_parent(path)
  local f, err = io.open(path, "a")
  if not f then
    mp.msg.error("cue_yaml: cannot open log file: " .. tostring(err))
    mp.osd_message("cue_yaml: failed to write log", 2)
    return false
  end
  f:write(text)
  f:close()
  return true
end

local function read_file(path)
  local f = io.open(path, "r")
  if not f then return nil end
  local s = f:read("*a")
  f:close()
  return s
end

local function existing_names_from_yaml(path)
  local s = read_file(path)
  if not s then return {} end
  local seen, out = {}, {}
  for name in s:gmatch("\n%s*name:%s*([^\n]+)") do
    name = trim(name)
    -- strip surrounding quotes if present (simple)
    name = name:gsub('^"(.*)"$', "%1"):gsub("^'(.*)'$", "%1")
    if name ~= "" and not seen[name] then
      seen[name] = true
      table.insert(out, name)
    end
  end
  table.sort(out)
  return out
end

local function tmp_path(prefix)
  local pid = tostring(mp.get_property_number("pid") or 0)
  return "/tmp/" .. prefix .. "." .. pid .. "." .. tostring(math.random(100000, 999999))
end

local function choose_name_via_fzf(existing)
  -- Write choices to a temp file, spawn terminal+fzf, read selection from temp output.
  local choices_path = tmp_path("mpv-cue-choices")
  local out_path = tmp_path("mpv-cue-out")

  do
    local f = io.open(choices_path, "w")
    if not f then return nil end
    for _, n in ipairs(existing) do
      f:write(n .. "\n")
    end
    f:close()
  end

  -- Build shell command: cat choices | fzf ... > out
  local function shell_escape(s)
    return "'" .. tostring(s):gsub("'", "'\\''") .. "'"
  end

  local fzf_cmd = "cat " .. shell_escape(choices_path)
  for _, a in ipairs(FZF_ARGS) do
    fzf_cmd = fzf_cmd .. " " .. shell_escape(a)
  end
  fzf_cmd = fzf_cmd .. " > " .. shell_escape(out_path)

  local run_args = {}
  for _, a in ipairs(FZF_TERM) do table.insert(run_args, a) end
  table.insert(run_args, "sh")
  table.insert(run_args, "-c")
  table.insert(run_args, fzf_cmd)

  mp.command_native({ "run", unpack(run_args) })

  -- Poll for output file to appear (short, bounded; user will drive fzf).
  -- mpv is single-threaded; we poll with a timer.
  local waited = 0
  local t
  t = mp.add_periodic_timer(0.2, function()
    waited = waited + 0.2
    local s = read_file(out_path)
    if s then
      t:kill()
      os.remove(choices_path)
      os.remove(out_path)

      s = trim(s)
      if s == "" then
        mp.osd_message("Cue: cancelled", 1.2)
        return
      end

      -- fzf --print-query outputs:
      --   line1 = query
      --   line2 = selection (optional)
      local lines = {}
      for line in s:gmatch("([^\n]*)\n?") do
        if line ~= "" then table.insert(lines, line) end
      end
      local query = lines[1] or ""
      local sel = lines[2] or ""
      local name = (sel ~= "" and sel) or query
      name = trim(name)
      if name == "" then
        mp.osd_message("Cue: empty name", 1.2)
        return
      end
      mp.commandv("script-message", "cue-yaml-log-with-name", name)
    elseif waited > 120 then
      -- hard stop after 2 minutes if something went sideways
      t:kill()
      os.remove(choices_path)
      os.remove(out_path)
      mp.osd_message("Cue: fzf timeout", 2)
    end
  end)
end

local function log_yaml(name)
  local pos = mp.get_property_number("time-pos")
  local file = abs_path()

  local item =
    "- date: " .. yaml_quote(iso_now_utc()) .. "\n" ..
    "  file: " .. yaml_quote(file) .. "\n" ..
    "  time: " .. yaml_quote(fmt_hms_msec(pos)) .. "\n" ..
    "  seconds: " .. tostring(pos or 0) .. "\n" ..
    "  name: " .. yaml_quote(name or "") .. "\n"

  local ok = append_text(LOG_PATH, item)
  if ok then
    mp.osd_message("Cue logged: " .. (name or "") .. " @ " .. fmt_hms_msec(pos), 1.5)
  end
end

-- Public entry points
mp.register_script_message("cue-yaml-log", function()
  -- default: name via fzf
  local names = existing_names_from_yaml(LOG_PATH)
  choose_name_via_fzf(names)
end)

mp.register_script_message("cue-yaml-log-with-name", function(name)
  log_yaml(name)
end)
