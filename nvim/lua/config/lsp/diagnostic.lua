-- Diagnostics. On 0.11+ signs are configured through vim.diagnostic.config
-- rather than vim.fn.sign_define, and handler borders through the `float` key.
vim.diagnostic.config({
  virtual_text = { prefix = '' },
  severity_sort = true,
  float = { border = 'rounded', source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
})

-- Rounded borders for hover and signature help windows
vim.o.winborder = 'rounded'
