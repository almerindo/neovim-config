-- Servers installed and managed through mason.
-- `roslyn` (C#) is handled separately by seblyng/roslyn.nvim, so it is not listed here.
local servers = {
  'vtsls', -- TypeScript / JavaScript
  'eslint',
  'lua_ls',
}

require('mason').setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = '',
    },
  },
})

require('mason-lspconfig').setup({
  ensure_installed = servers,
  -- We call vim.lsp.enable() ourselves below, so mason must not auto-enable.
  automatic_enable = false,
})

local shared = require('config.lsp.options')

for _, server in ipairs(servers) do
  local opts = vim.tbl_deep_extend('force', {}, shared)

  -- Merge in server-specific settings when a module exists for it.
  local ok, server_config = pcall(require, 'config.lsp.servers.' .. server)
  if ok and type(server_config.setup) == 'function' then
    server_config.setup(opts)
  end

  vim.lsp.config(server, opts)
end

vim.lsp.enable(servers)

-- roslyn.nvim registers the `roslyn` config itself; attach our shared keymaps
-- and capabilities to it too.
vim.lsp.config('roslyn', shared)

require('config.lsp.diagnostic')
