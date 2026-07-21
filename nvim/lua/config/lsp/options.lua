-- Shared options applied to every language server.
return {
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  on_attach = function(client, bufnr)
    local function buf_set_keymap(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    -- Note: Neovim 0.11+ already provides defaults for K, grn, gra, grr and gri.
    -- These explicit maps are kept alongside them for muscle memory.
    -- stylua: ignore start
    buf_set_keymap('n', 'gD',         vim.lsp.buf.declaration,     'Go to declaration')
    buf_set_keymap('n', 'gd',         vim.lsp.buf.definition,      'Go to definition')
    buf_set_keymap('n', 'K',          vim.lsp.buf.hover,           'Hover docs')
    buf_set_keymap('n', 'gi',         vim.lsp.buf.implementation,  'Go to implementation')
    buf_set_keymap('n', '<C-k>',      vim.lsp.buf.signature_help,  'Signature help')
    buf_set_keymap('n', '<leader>D',  vim.lsp.buf.type_definition, 'Type definition')
    buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename,          'Rename symbol')
    buf_set_keymap('n', '<F2>',       vim.lsp.buf.rename,          'Rename symbol')
    buf_set_keymap('n', 'gr',         vim.lsp.buf.references,      'References')
    buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action,     'Code action')
    buf_set_keymap('n', '<leader>q',  vim.diagnostic.setloclist,   'Diagnostics to loclist')

    buf_set_keymap('n', '<leader>e', function()
      vim.diagnostic.open_float({ border = 'rounded' })
    end, 'Show diagnostic')

    -- vim.diagnostic.goto_prev/goto_next were deprecated in 0.11 in favour of jump()
    buf_set_keymap('n', '[d', function()
      vim.diagnostic.jump({ count = -1, float = { border = 'rounded' } })
    end, 'Previous diagnostic')
    buf_set_keymap('n', ']d', function()
      vim.diagnostic.jump({ count = 1, float = { border = 'rounded' } })
    end, 'Next diagnostic')

    -- Format via conform.nvim, which falls back to the LSP when no formatter matches
    buf_set_keymap({ 'n', 'v' }, '<leader>ff', function()
      require('conform').format({ async = true, lsp_format = 'fallback' })
    end, 'Format file')
    -- stylua: ignore end

    -- Inlay hints (native since 0.10) — very useful for TypeScript
    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      buf_set_keymap('n', '<leader>ih', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
      end, 'Toggle inlay hints')
    end
  end,

  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
