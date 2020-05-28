":1 Coffeescript
autocmd FileType coffee setlocal foldmethod=marker foldmarker=#\:,endfold

autocmd BufEnter * if &filetype == 'coffee' |nmap <F9>       :w<CR>:       !coffee "%" --nodejs               <CR>| endif
autocmd BufEnter * if &filetype == 'coffee' |nmap <F5>       :w<CR>:       !coffee -c -b -p "%" > "%:r.min.js"<CR>| endif
autocmd BufEnter * if &filetype == 'coffee' |nmap <C-s>      :w<CR>:silent !coffee -c -b -p "%" > "%:r.min.js"<CR>| endif
autocmd BufEnter * if &filetype == 'coffee' |imap <C-s> <ESC>:w<CR>:silent !coffee -c -b -p "%" > "%:r.min.js"<CR>| endif

" Show line in 80th column
autocmd BufEnter * if &filetype == 'coffee' |let &colorcolumn=join(range(81,81),",") | endif

":1 Javascript
autocmd FileType javascript setlocal foldmethod=marker foldmarker=\/\/\:,\/\/\ endfold autoindent

autocmd BufEnter * if &filetype == 'javascript' |nmap <F5> :w<CR>:!time node "%" <CR>| endif

":1 Java
autocmd FileType java setlocal foldmethod=syntax
autocmd FileType java setlocal shiftwidth=4
autocmd FileType java setlocal tabstop=4


":1 Vim (Vimscript)
autocmd FileType vim setlocal foldmethod=marker foldmarker=\"\:,\"\ endfold

":1 Typescript
autocmd FileType typescript nmap <leader>s :ALEOrganizeImports<CR>

":1 C
autocmd FileType c setlocal foldmethod=marker foldmarker=\/\/\:,\/\/\ endfold

":1 CSS
autocmd FileType css setlocal foldmethod=marker foldmarker=\*\:,\*\ endfold

":1 Less
autocmd FileType less setlocal foldmethod=marker foldmarker=\/\/:,\"\ endfold

":1 Vue
autocmd FileType vue setlocal foldmethod=marker foldmarker=\<\!\-\-\ \:,\<\!\-\-\ \endfold

":1 Dart
autocmd FileType dart nnoremap <leader>f :DartFmt<cr>

":1 Dart
autocmd FileType dart nnoremap <leader>f :DartFmt<cr>

":1 Python
autocmd FileType python nmap <leader>s :Isort<CR>

":1 Java
autocmd FileType java nmap <leader>s :call CocAction('runCommand', 'editor.action.organizeImport')<CR>

":1 Tab configuration for filetypes
" no tab use. tab = 4 space
autocmd FileType python,sh,typescript,gdscript3
  \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" no tab use. tab = 2 space
autocmd FileType css,vim,javascript,stylus,yaml,coffee,htmljinja
  \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" endfold