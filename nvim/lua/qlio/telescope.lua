local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
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
        }
    },
}

local M = {}
M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = '< VimRC >',
        cwd = '$HOME/.config/',
    })
end

M.git_branches = function()
    require('telescope.builtin').git_branches({
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end
return M
