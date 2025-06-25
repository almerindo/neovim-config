local wk = require("which-key")

wk.setup {
  -- Qualquer configuração específica do which-key
  notify = false,  -- Desativa as notificações de verificação de saúde
  preset = "modern",  -- Define o estilo de apresentação
}

-- Mapeamentos para o prefixo <leader>
wk.register({
  m = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
  n = { ":bnext<CR>", "Next Buffer" },
  b = { ":bprevious<CR>", "Previous Buffer" },
  t = {
    name = "Terminal",  -- Nome do grupo para Terminal
    f = { "<cmd>:ToggleTerm direction=float<cr>", "Float Terminal" },
    h = { "<cmd>:ToggleTerm direction=horizontal<cr>", "Horizontal Terminal" },
    v = { "<cmd>:ToggleTerm direction=vertical<cr>", "Vertical Terminal" },
  },
  f = {
    name = "Format",  -- Nome do grupo para formatação
    -- Use the newer vim.lsp.buf.format API
    f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format File" },
  },
  c = {
    r = { "<cmd>Lein! with-profiles +dev repl :headless<cr>", "Clojure REPL Dev" },
    e = { "<cmd>Lein! with-profiles +flutter,+catalyst-start repl :headless<cr>", "Clojure REPL Flutter/Catalyst" },
  },
}, { prefix = "<leader>" })

-- Mapeamentos para o prefixo <LocalLeader>
wk.register({
  f = {
    name = "telescope",  -- nome do grupo para telescope
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "help tags" },
    n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "notifications" },
  },
}, { prefix = "<localleader>" })

wk.register({
  [">)"] = { "<Plug>(sexp_slurp_forward)", "Slurp Right" },
  ["<)"] = { "<Plug>(sexp_barf_forward)", "Barf Right" },
  [">("] = { "<Plug>(sexp_slurp_backward)", "Slurp Left" },
  ["<("] = { "<Plug>(sexp_barf_backward)", "Barf Left" },
}, { mode = "n" })

