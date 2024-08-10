local wk = require('which-key')

wk.setup {
  -- Adicione qualquer configuração específica do which-key aqui
}

wk.register({
  ["<leader>"] = {
    m = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
    t = {
      name = "Terminal",
      f = { "<cmd>:ToggleTerm direction=float<cr>", "Float Terminal" },
      h = { "<cmd>:ToggleTerm direction=horizontal<cr>", "Horizontal Terminal" },
      v = { "<cmd>:ToggleTerm direction=vertical<cr>", "Vertical Terminal" },
    },
    n = { ":bnext<CR>", "Next Buffer" }, -- Adiciona mapeamento para o próximo buffer
  },
  ["<LocalLeader>"] = {
    f = {
      name = "Telescope",
      f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
      g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
      b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
      h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
      n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" },
    },
  },
  c = {
    r = { "<cmd>Lein! with-profiles +dev repl :headless<cr>", "Clojure REPL Dev" },
    e = { "<cmd>Lein! with-profiles +flutter,+catalyst-start repl :headless<cr>", "Clojure REPL Flutter/Catalyst" },
  },
  f = {
    name = "Format",
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "File" },
  },
}, { prefix = "<leader>" })
