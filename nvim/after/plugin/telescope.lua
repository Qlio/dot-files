local actions = require('telescope.actions')
local fb_actions = require('telescope._extensions.file_browser.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')

require('telescope').setup {
    defaults = {
        file_sorter = sorters.get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        initial_mode = 'insert',

        file_previewer   = previewers.vim_buffer_cat.new,
        grep_previewer   = previewers.vim_buffer_vimgrep.new,
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },

        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
    },
    extensions = {
        file_browser = {
            theme = 'dropdown',
            auto_depth = true,
            collapse_dirs = true,
            hijack_netrw = true,
            initial_mode = 'normal',
            previewer = false,
            mappings = {
                i = {
                    ['<esc>'] = false,
                },
                n = {
                    ['/'] = function()
                        vim.api.nvim_input('a')
                    end,
                    ['t'] = function()
                        vim.api.nvim_input('k')
                    end,
                    ['h'] = function()
                        vim.api.nvim_input('j')
                    end,
                    ['u'] = fb_actions.goto_parent_dir,
                    ['f'] = fb_actions.toggle_hidden,
                    ['s'] = fb_actions.toggle_browser,
                },
            },
        },
    }
}

local file_browser = require("telescope").load_extension "file_browser"

-- Telescope
vim.keymap.set('', '<F2>', function()
    file_browser.file_browser({
        path = '%:p:h',
        select_buffer = true,
        hidden = {
            file_browser = false,
            folder_browser = false,
        },
        respect_gitignore = false,
        layout_config = {
            height = .9,
            width = .8,
        },
    })
end, { silent = true })
vim.keymap.set('n', '<m-p>', function ()
    builtin.find_files({
        find_command = {
            'fd', '--type', 'file', '--hidden', '--no-ignore-vcs', '--ignore-file=' .. os.getenv('HOME') .. '/.fdignore'
        }
    })
end, {})
-- vim.keymap.set('n', '<m-p>', builtin.fd, {})
vim.keymap.set('n', '<m-g>', builtin.live_grep, {})
vim.keymap.set('n', '<m-b>', function()
    builtin.buffers({ sort_lastused = true })
end)

vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
