require('nvim-treesitter.configs').setup({
  modules = {},

  auto_install = true,
  sync_install = false,
  ignore_install = {},

  ensure_installed = {
    'bash',
    'c_sharp',
    'css',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    },
  },
})

-- Bracket colouring. Replaces p00f/nvim-ts-rainbow, which is archived.
require('rainbow-delimiters.setup').setup({})
