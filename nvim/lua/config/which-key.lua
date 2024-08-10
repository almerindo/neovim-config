local wk = require("which-key")

wk.setup {
  -- Qualquer configuração específica do which-key
}

-- Mapeamentos para o prefixo <leader>
wk.register({
  m = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
  n = { ":bnext<CR>", "Next Buffer" },
  t = {
    name = "Terminal",  -- Nome do grupo para Terminal
    f = { "<cmd>:ToggleTerm direction=float<cr>", "Float Terminal" },
    h = { "<cmd>:ToggleTerm direction=horizontal<cr>", "Horizontal Terminal" },
    v = { "<cmd>:ToggleTerm direction=vertical<cr>", "Vertical Terminal" },
  },
  f = {
    name = "Format",  -- Nome do grupo para formatação
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format File" },
  },
  c = {
    r = { "<cmd>Lein! with-profiles +dev repl :headless<cr>", "Clojure REPL Dev" },
    e = { "<cmd>Lein! with-profiles +flutter,+catalyst-start repl :headless<cr>", "Clojure REPL Flutter/Catalyst" },
  },
}, { prefix = "<leader>" })

-- Mapeamentos para o prefixo <LocalLeader>
wk.register({
  f = {
    name = "Telescope",  -- Nome do grupo para Telescope
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" },
  },
}, { prefix = "<LocalLeader>" })

