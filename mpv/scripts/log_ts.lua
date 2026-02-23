-- log_ts.lua
-- Append: ISO time | media path | playback timestamp
local mp = require 'mp'
local utils = require 'mp.utils'

-- Set your log file path here (supports ~ via expand-path)
local LOG_PATH = mp.command_native({"expand-path", "~/.local/share/mpv/timestamps.log"})

local function iso_now()
  -- UTC ISO-8601; change "!%Y..." to "%Y..." if you prefer local time
  return os.date("!%Y-%m-%dT%H:%M:%SZ")
end

local function fmt_hms(sec)
  if not sec then return "??:??:??" end
  sec = math.floor(sec + 0.5)
  local h = math.floor(sec / 3600)
  local m = math.floor((sec % 3600) / 60)
  local s = sec % 60
  return string.format("%02d:%02d:%02d", h, m, s)
end

local function media_id()
  -- Prefer the original path/URL if available, fallback to filename
  return mp.get_property("path") or mp.get_property("filename") or "<unknown>"
end

local function append_line(line)
  local dir = utils.split_path(LOG_PATH)
  if dir and dir ~= "" then
    mp.command_native({ "mkdir", dir })
  end

  local f, err = io.open(LOG_PATH, "a")
  if not f then
    mp.msg.error("log_ts: cannot open log file: " .. tostring(err))
    mp.osd_message("log_ts: failed to write log", 2)
    return
  end
  f:write(line .. "\n")
  f:close()
end

local function log_mark()
  local pos = mp.get_property_number("time-pos")
  local line = string.format("%s | %s | %s",
    iso_now(),
    media_id(),
    fmt_hms(pos)
  )
  append_line(line)
  mp.osd_message("Logged: " .. fmt_hms(pos), 1.2)
end

-- Export a script-message so it can be bound from input.conf
mp.register_script_message("log-ts", log_mark)
