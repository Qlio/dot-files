lua require('qlio')

nnoremap <c-p>     :lua require('telescope.builtin').fd()<cr>
nnoremap <c-g>     :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b :lua require('telescope.builtin').buffers({ sort_lastused = true })<cr>

nnoremap <leader>df :lua require('qlio.telescope').search_dotfiles()<CR>
