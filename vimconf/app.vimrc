":1 Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'

":1 Plugin - Ultisnips
Plugin 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.config/vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=['/home/qlio/.config/vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsJumpForwardTrigger="<tab>"

":1 Plugin - NERDTree
Bundle 'scrooloose/nerdtree'

map <silent><F2> :NERDTreeToggle<CR>

let g:NERDTreeMapOpenVSplit='a'
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeWinPos='right'
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=2

let g:NERDTreeBookmarksFile = $HOME . '/.vim/.nerdtree-bookmarks'

let NERDTreeIgnore=[
      \'\.jar$',
      \'\.db$',
      \'__pycache__$',
      \'node_modules',
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

let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_typescript_tsc_fname = ''
let g:ale_completion_tsserver_autoimport = 1
let g:ale_python_flake8_change_directory = 0
let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'python': ['flake8'],
      \ 'dart': ['language_server'],
      \ 'java': [],
      \ }
let g:ale_fixers = {
      \   'dart': ['dartfmt'],
      \}
let g:ale_dart_dartanalyzer_executable = 'dartanalyzer'
let g:ale_dart_dartfmt_options = '-l 120'


":1 Plugin - COC
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_node_path = '/usr/bin/node'

set hidden          " TextEdit might fail if hidden is not set.
set nobackup        " Some servers have issues with backup files, see #649.
set nowritebackup   " Some servers have issues with backup files, see #649.
set cmdheight=2     " Give more space for displaying messages.
set updatetime=300  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> <c-]> <Plug>(coc-definition)

":1 Plugin - FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

let g:fzf_layout = { 'down': '~20%' }
let $FZF_DEFAULT_COMMAND = 'fd --type f'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
":1 Plugins
" Features
Bundle 'godlygeek/tabular'
Plugin 'posva/vim-vue'
Bundle 'hynek/vim-python-pep8-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'wavded/vim-stylus'
Plugin 'leafgarland/typescript-vim'
Plugin 'wakatime/vim-wakatime'
Bundle 'christoomey/vim-sort-motion'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'vimwiki/vimwiki'

Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key=','

Plugin 'calviken/vim-gdscript3'

Plugin 'fisadev/vim-isort'
let g:vim_isort_python_version = 'python3'
let g:vim_isort_config_overrides = {'line_length': 120}
let g:vue_disable_pre_processors = 0

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
\   'filename': 'LightlineFileName',
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

function! LightlineFileName() abort
  return expand('%')
endfunction

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
set lazyredraw                         " Do not redraw screen in the middle of a macro. Makes them complete faster.
set ignorecase                         " Searches are case insensitive
set smartcase                          " Searches with a capital characters are case sensitive.
set undofile                           " Persistent undo

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
nmap <Leader>g :Rg<CR>

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
autocmd BufEnter * nmap <C-s> :w! <bar> syntax sync fromstart<CR>
autocmd BufEnter * imap <C-s> <ESC>:w! <bar> syntax sync fromstart<CR>

" Close file
nmap <C-b> :close<CR>
imap <C-b> <ESC>:close<CR>

":1 Automatic commands
" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Filetype
autocmd FileType python setlocal foldmethod=syntax foldtext=PythonFoldText()

" Tab
autocmd TabEnter * silent! :execute 'cd' g:NERDTree.ForCurrentTab().getRoot().path.str()

so $HOME/.vim/dvorak.vimrc
so $HOME/.vim/filetype.vimrc
