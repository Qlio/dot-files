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
function! TypeScriptFoldText()
  let text = getline(v:foldstart)
  if text =~# "= () => [({].?"
    return text[:-10]
  endif
  if text =~# "= [({]$"
    return text[:-4]
  endif
  if text =~# "[({]$"
    return text[:-2]
  endif
  return text
endfunction
autocmd FileType typescript setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldtext=TypeScriptFoldText()
autocmd FileType typescript,typescriptreact UltiSnipsAddFiletypes typescript

":1 Terraform
function! TerraformFoldText()
  const splittedLineList = split(getline(v:foldstart), ' ')[:-2]
  let type = splittedLineList[0]
  let lineList = splittedLineList[1:]
  return type . " " . join(lineList, ' ')
endfunction
autocmd FileType terraform setlocal foldmethod=expr foldexpr=(getline(v:lnum+1)=~'^\\l'?'<1':1) foldtext=TerraformFoldText()

":1 C
autocmd FileType c setlocal foldmethod=marker foldmarker=\/\/\:,\/\/\ endfold

":1 CSS, SASS, SCSS
autocmd FileType css,scss,sass setlocal foldmethod=marker foldmarker=\*\:,\*\ endfold
autocmd FileType scss,sass setlocal foldmethod=marker foldmarker=\/\/:,\/\/\ endfold

":1 Less
autocmd FileType less setlocal foldmethod=marker foldmarker=\/\/:,\"\ endfold

":1 Vue, HTML
autocmd FileType vue,html setlocal foldmethod=marker foldmarker=\<\!\-\-\ \:,\<\!\-\-\ \endfold

":1 Python
autocmd FileType python nmap <leader>s :PyrightOrganizeImports<CR>

":1 Tab configuration for filetypes
" no tab use. tab = 4 space
autocmd FileType python,sh,gdscript3,javascript,javascriptreact,lua,solidity
  \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" no tab use. tab = 2 space
autocmd FileType css,vim,stylus,yaml,coffee,htmljinja,sh,typescript
  \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

":1 emmet
autocmd FileType html,css,typescriptreact EmmetInstall
