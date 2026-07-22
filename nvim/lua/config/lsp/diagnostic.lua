-- Diagnostics. On 0.11+ signs are configured through vim.diagnostic.config
-- rather than vim.fn.sign_define, and handler borders through the `float` key.
-- Icons are written as \u{} escapes rather than literal glyphs so they survive
-- copy/paste and editors that mangle private-use codepoints.
-- Requires a Nerd Font (v3+) in the terminal; see README.
vim.diagnostic.config({
  virtual_text = { prefix = '\u{f444}' }, --
  severity_sort = true,
  float = { border = 'rounded', source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '\u{f057} ', --
      [vim.diagnostic.severity.WARN] = '\u{f071} ', --
      [vim.diagnostic.severity.HINT] = '\u{f0eb} ', --
      [vim.diagnostic.severity.INFO] = '\u{f05a} ', --
    },
  },
})

-- Rounded borders for hover and signature help windows
vim.o.winborder = 'rounded'
