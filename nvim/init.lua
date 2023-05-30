require("qlio")

vim.cmd [[colorscheme nightfly]]

vim.api.nvim_create_autocmd("BufWritePre", { command = ':%s/\\s\\+$//e' })
