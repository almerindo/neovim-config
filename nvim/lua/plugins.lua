-- Plugin specs for lazy.nvim
return {
  -- Theme --------------------------------------------------------------------
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000, -- load before everything else so highlights are set early
    config = function()
      require('config.onedark')
    end,
  },

  -- UI -----------------------------------------------------------------------
  {
    'rcarriga/nvim-notify',
    config = function()
      require('config.notify')
      vim.notify = require('notify')
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.lualine')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.tree')
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('config.which-key')
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('config.toggleterm')
    end,
  },

  -- Fuzzy finder -------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('config.telescope')
    end,
  },

  -- Syntax -------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    -- Pinned to master: the `main` branch is a rewrite with a different API,
    -- and lua/config/treesitter.lua uses the `nvim-treesitter.configs` API.
    branch = 'master',
    build = ':TSUpdate',
    dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
    config = function()
      require('config.treesitter')
    end,
  },

  -- Editing ------------------------------------------------------------------
  'tpope/vim-surround',    -- surround parentheses
  'tpope/vim-repeat',      -- make `.` work with plugin maps
  'tpope/vim-commentary',  -- gcc to comment out a line
  'mg979/vim-visual-multi', -- multi-cursor

  -- Git ----------------------------------------------------------------------
  { 'airblade/vim-gitgutter', branch = 'main' },
  'tpope/vim-fugitive',

  -- LSP + completion ---------------------------------------------------------
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('config.lsp.setup')
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('config.lsp.completion')
    end,
  },

  -- Formatting ---------------------------------------------------------------
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
      require('config.lsp.conform')
    end,
  },

  -- .NET ---------------------------------------------------------------------
  {
    'seblyng/roslyn.nvim',
    ft = { 'cs' },
    opts = {
      filewatching = 'auto',
    },
  },

  -- Claude Code --------------------------------------------------------------
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    opts = {
      terminal_cmd = vim.fn.expand('~/.local/bin/claude'),
    },
    keys = {
      { '<leader>a', nil, desc = 'AI/Claude Code' },
      { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send selection to Claude' },
      { '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', ft = { 'NvimTree' }, desc = 'Add file to Claude' },
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
  },

  -- Markdown -----------------------------------------------------------------
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
}
