inoremap <silent><expr> <c-space> compe#complete()
inoremap <silent><expr> <cr>      compe#confirm('<cr>')
inoremap <silent><expr> <c-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <c-d>     compe#scroll({ 'delta': -4 })
