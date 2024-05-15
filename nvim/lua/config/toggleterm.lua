require('toggleterm').setup {
  size = 120,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "double",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
