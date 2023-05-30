local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<c-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<c-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<c-c>'] = cmp.mapping.complete(),
    })
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)
lsp.setup()
