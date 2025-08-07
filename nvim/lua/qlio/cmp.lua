local cmp = require'cmp'

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({}),
    sources = cmp.config.sources(
        {{ name = 'nvim_lsp' }},
        {{ name = 'buffer' }}
    ),
    completion = {
        autocomplete = false
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
