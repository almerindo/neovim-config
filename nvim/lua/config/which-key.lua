local wk = require('which-key')

wk.setup({
  notify = false,
  preset = 'modern',
})

-- which-key v3 replaced wk.register() with the list-based wk.add()
wk.add({
  { '<leader>m', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
  { '<leader>n', '<cmd>bnext<cr>', desc = 'Next Buffer' },
  { '<leader>b', '<cmd>bprevious<cr>', desc = 'Previous Buffer' },

  { '<leader>t', group = 'Terminal' },
  { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Float Terminal' },
  { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Horizontal Terminal' },
  { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = 'Vertical Terminal' },

  { '<leader>f', group = 'Format' },
  {
    '<leader>ff',
    function()
      require('conform').format({ async = true, lsp_format = 'fallback' })
    end,
    desc = 'Format File',
  },

  -- <leader>a (Claude Code) is registered by the plugin spec in lua/plugins.lua

  { '<localleader>f', group = 'Telescope' },
  { '<localleader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
  { '<localleader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Live Grep' },
  { '<localleader>fb', function() require('telescope.builtin').buffers() end, desc = 'Buffers' },
  { '<localleader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Help Tags' },
  { '<localleader>fn', function() require('telescope').extensions.notify.notify() end, desc = 'Notifications' },
})
