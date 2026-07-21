-- Leader keys are set in init.lua, before lazy.nvim loads.
-- Most <leader>/<localleader> mappings live in lua/config/which-key.lua so they
-- get descriptions in the which-key popup. This file holds the rest.

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<cr>', opts)

-- Keep the cursor centred when jumping through search results
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Move selected lines up/down in visual mode
map('v', 'J', ":m '>+1<cr>gv=gv", opts)
map('v', 'K', ":m '<-2<cr>gv=gv", opts)

-- Keep the yanked register when pasting over a selection
map('x', '<leader>p', '"_dP', opts)

-- Escape terminal mode
map('t', '<Esc><Esc>', [[<C-\><C-n>]], opts)
