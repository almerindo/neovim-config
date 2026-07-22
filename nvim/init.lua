-- Leader keys must be set before lazy.nvim loads, so plugin keymaps resolve correctly
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('options')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  ui = { border = 'rounded' },
  change_detection = { notify = false },
  -- No plugin here needs luarocks; disabling it avoids a hererocks health error.
  rocks = { enabled = false },
})

require('mappings')
