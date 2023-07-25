-- Disabling netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.termguicolors = true

-- Tab Configuration
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.lazyredraw = true                 -- Do not redraw screen in the middle of a macro. Makes them complete faster.
vim.opt.ignorecase = true                 -- Searches are case insensitive
vim.opt.smartcase = true                  -- Searches with a capital characters are case sensitive.
vim.opt.undofile = true                   -- Persistent undo
vim.opt.swapfile = false                  -- Fuck swapfiles
vim.opt.fillchars:append({ fold = " " })  -- Make foldtext more clean
