":1 Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

":1 Plugin - Ultisnips
Plugin 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir = "~/.dotfiles/vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["~/.dotfiles/vim/UltiSnips"]

":1 Plugin - NERDTree
Bundle 'scrooloose/nerdtree'

" Fast toggle
map <F2> :NERDTreeToggle<CR>

" Common
let g:NERDTreeMapOpenVSplit = 'a'
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeQuitOnOpen = 1

let g:NERDTreeBookmarksFile = $HOME . '/.vim/.nerdtree-bookmarks'

let NERDTreeIgnore=[
      \'\.jar$',
      \'\.db$',
      \'AndroidStudioProjects',
      \'EffectiveAndroidUI',
      \'VirtualBox VMs',
      \'Desktop',
      \'Downloads',
      \'Dropbox',
      \'Documents',
      \'Pictures',
      \'Music',
      \'Movies',
      \]

":1 Plugin - ALE (Asynchronous Lint Engine)
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_python_flake8_args="--ignore=E501"

":1 Plugin - FZF
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

":1 Plugins
" Features
Bundle 'godlygeek/tabular'

Plugin 'posva/vim-vue'
Bundle 'hynek/vim-python-pep8-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'wavded/vim-stylus'

Plugin 'itchyny/lightline.vim'
" Lightline
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

":1 Standard (frozen) configurations
syntax on                              " Enable syntax hightlight
filetype off                           " Disable file type detection
filetype plugin on                     " Enable plugins
filetype indent on                     " Enable indent

set nocompatible                       " Enable VIM features
set number                             " Enable line numbers
set autoindent                         " Enable auto indent
set nobackup nowritebackup noswapfile  " Disable backup

set hlsearch                           " Highlight search result
set encoding=utf-8                     " Preferred encoding
set nobomb                             " Unicode without BOM (Byte Order Mark)
set fileformats=unix fileformat=unix   " Preferred filetype
set hidden                             " Undo history save when changing buffers
set wildmenu                           " Show autocomplete menus
set autoread                           " Auto update if changed outside of Vim
set noerrorbells novisualbell          " No sound on errors
set backspace=indent,eol,start         " Allow backspace in insert mode

":1 Configurations may change
set numberwidth=4                      " Line number width
set shellslash                         " Always use unix style slash /
set nojoinspaces                       " no insert two spaces in line join
set t_Co=256                           " (CLI only) Number of colors
set gdefault                           " Add the g flag to search/replace by default

" Easy fold toggle
nmap <Space> za
nmap <CR> za

" Easy fold toggle for enter key. (Exclude `quickfix` filetype)
autocmd BufEnter * if &filetype == 'qf' |unmap <CR>|    endif
autocmd BufEnter * if &filetype != 'qf' | nmap <CR> za| endif

":1 Aestetic customizations

" Tab Configuration
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Define list characters
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

" Define line break
set linebreak showbreak=…     " Wrap long line
set fillchars=vert:\|,fold:\  " Make foldtext more clean

" Recognize numbered list in text formatting
set formatoptions+=n

":1 Keyboard mapping
" Change the leader map
let mapleader = ','
let g:mapleader = ','
let maplocalleader = ','
let g:maplocalleader = ','

" Shortcut to rapidly toggle 'set wrap'
nmap <leader>r :set wrap!<CR>

" Easy indent
nmap > >>
nmap < <<

" Window move
nmap <leader>d <C-w><LEFT>
nmap <leader>n <C-w><RIGHT>
nmap <leader>t <C-w><UP>
nmap <leader>h <C-w><DOWN>

" Window tab settings
nnoremap gk gt
nmap <C-t> :tabnew<CR>

" for xterm
set <M-1>=1
set <M-2>=2
set <M-3>=3
set <M-4>=4

map <M-1> 1gk
map <M-2> 2gk
map <M-3> 3gk
map <M-4> 4gk

" UltiSnips
nmap <Leader>z :UltiSnipsEdit<CR>

" FZF
nmap <Leader>. :Files<CR>
nmap <Leader>b :Buffers<CR>

" Keymap switch
let g:current_keymap = ''
function! ToggleKeymap()
  if g:current_keymap == ''
    set keymap=mongolian-dvorak
    let g:current_keymap = 'mongolian-dvorak'
  else
    set keymap=""
    let g:current_keymap = ''
  endif
endfunction

imap <C-l> <ESC>:call ToggleKeymap()<CR>a
map <C-l> :call ToggleKeymap()<CR>

" Save file
" Need 'stty -ixon' command in shell (CLI).
" more: http://superuser.com/questions/227588/vim-command-line-imap-problem
autocmd BufEnter * nmap <C-s> :w! <bar> redraw!<CR>
autocmd BufEnter * imap <C-s> <ESC>:w! <bar> redraw!<CR>

" Close file
nmap <C-b> :close<CR>
imap <C-b> <ESC>:close<CR>

":1 Automatic commands
" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Filetype
autocmd FileType python setlocal foldmethod=syntax foldtext=PythonFoldText()

so $HOME/.vim/dvorak.vimrc
so $HOME/.vim/filetype.vimrc
