lua require('qlio')

nnoremap <m-p> :lua require('telescope.builtin').fd()<cr>
nnoremap <m-g> :lua require('telescope.builtin').live_grep()<cr>
nnoremap <m-b> :lua require('telescope.builtin').buffers({ sort_lastused = true })<cr>

nnoremap <leader>df :lua require('qlio.telescope').search_dotfiles()<CR>
