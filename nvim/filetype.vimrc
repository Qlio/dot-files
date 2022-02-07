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

":1 CSS, SASS, SCSS
autocmd FileType css,scss,sass setlocal foldmethod=marker foldmarker=\*\:,\*\ endfold
autocmd FileType scss,sass setlocal foldmethod=marker foldmarker=\/\/:,\/\/\ endfold

":1 Less
autocmd FileType less setlocal foldmethod=marker foldmarker=\/\/:,\"\ endfold

":1 Vue, HTML
autocmd FileType vue,html setlocal foldmethod=marker foldmarker=\<\!\-\-\ \:,\<\!\-\-\ \endfold

":1 Dart
autocmd FileType dart nnoremap <leader>f :DartFmt<cr>

":1 Dart
autocmd FileType dart nnoremap <leader>f :DartFmt<cr>

":1 Python
autocmd FileType python nmap <leader>s :PyrightOrganizeImports<CR>

":1 Tab configuration for filetypes
" no tab use. tab = 4 space
autocmd FileType python,sh,typescript,gdscript3,javascript,javascriptreact,lua
  \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" no tab use. tab = 2 space
autocmd FileType css,vim,stylus,yaml,coffee,htmljinja,sh
  \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
