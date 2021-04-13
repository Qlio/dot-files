-- TypeScript
require'lspconfig'.tsserver.setup{
  on_attach = function()
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
}


vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    virtual_text = false,
  }
)


-- Python
-- require'lspconfig'.pyright.setup{
--   on_attach = function()
--     vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   end
-- }
