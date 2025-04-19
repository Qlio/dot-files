-- Dvorak
vim.keymap.set('', 'd', 'h')
vim.keymap.set('', 'h', 'j')
vim.keymap.set('', 't', 'k')
vim.keymap.set('', 'n', 'l')
vim.keymap.set('', 'j', 'd')
vim.keymap.set('', 'k', 't')
vim.keymap.set('', 'l', 'n')
vim.keymap.set('', 'L', 'N')
vim.keymap.set('', 'H', '6<Down>')
vim.keymap.set('', 'T', '6<Up>')

vim.keymap.set({'n', 'v'}, 'gh', 'gj')
vim.keymap.set({'n', 'v'}, 'gt', 'gk')

vim.g.mapleader = ","
vim.keymap.set('', 's', ':')
vim.keymap.set('', 'S', ':')
vim.keymap.set('', '-', '$')
vim.keymap.set('', '_', '^')

-- Ctrl + s
vim.keymap.set('n', '<C-s>', ':w! <bar> syntax sync fromstart<CR>')
vim.keymap.set('i', '<C-s>', '<ESC>:w! <bar> syntax sync fromstart<CR>')

-- Window movement
vim.keymap.set('', '<leader>d', '<C-w><LEFT>')
vim.keymap.set('', '<leader>n', '<C-w><RIGHT>')
vim.keymap.set('', '<leader>t', '<C-w><UP>')
vim.keymap.set('', '<leader>h', '<C-w><DOWN>')

vim.keymap.set('', '<c-d>', '<c-d>zz')
vim.keymap.set('', '<c-u>', '<c-u>zz')

vim.keymap.set('', '>', '>>')
vim.keymap.set('', '<', '<<')
vim.keymap.set('', '<leader>d', '"+d')
vim.keymap.set('', '<leader>D', '"+D')
vim.keymap.set('', '<leader>y', '"+y')
vim.keymap.set('', '<leader>Y', '"+Y')

vim.keymap.set('', '<leader>r', ':set wrap!<CR>')

vim.keymap.set('', '<space>', 'za')
vim.keymap.set('', '<cr>', 'za')

vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "solidity",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>p", ":!forge fmt % > /dev/null 2>&1<CR><CR>", { noremap = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>p", ":!terraform fmt %<CR><CR>", { noremap = true, silent = true })
  end,
})
