-- TypeScript
require'lspconfig'.tsserver.setup{
  on_attach = function()
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
}

-- Python
-- require'lspconfig'.pyright.setup{
--   on_attach = function()
--     vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   end
-- }
