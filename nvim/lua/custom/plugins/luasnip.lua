return {
  {
    'davidgranstrom/scnvim',
    -- event = 'VimEnter',
    config = function()
      local scnvim = require('scnvim')  -- Import scnvim
      local map = scnvim.map            -- Import map
      local map_expr = scnvim.map_expr  -- Import map_expr

      scnvim.setup{
        ensure_installed = true,
        keymaps = {
          ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
          ['<C-e>'] = {
            map('editor.send_block', {'i', 'n'}),
            map('editor.send_selection', 'x'),
          },
          ['<CR>'] = map('postwin.toggle'),
          ['<M-CR>'] = map('postwin.toggle', 'i'),
          ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
          ['<C-k>'] = map('signature.show', {'n', 'i'}),
          ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
          ['<leader>st'] = map('sclang.start'),
          ['<leader>sk'] = map('sclang.recompile'),
          ['<F1>'] = map_expr('s.boot'),
          ['<F2>'] = map_expr('s.meter'),
        },
        editor = {
          highlight = {
            color = 'IncSearch',
          },
        },
        postwin = {
          float = {
            enabled = false,
          },
        },
        extensions = {
          tmux = {
            path = vim.fn.tempname(),
            horizontal = false,
            size = '35%',
            cmd = 'tail',
            args = { '-F', '$1' }
          },
        },
      }
      scnvim.load_extension 'tmux'
    end
  },
}
