":1 Plugs
call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'

Plug 'mattn/emmet-vim'
Plug 'fisadev/vim-isort'

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

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
nmap <C-t> :tabnew<CR>
map <M-1> 1gk
map <M-2> 2gk
map <M-3> 3gk
map <M-4> 4gk

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

":1 NERDTree
map <silent><F2> :NERDTreeToggle<CR>

let g:NERDTreeMapOpenVSplit='a'
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeWinPos='right'
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=2

let g:NERDTreeBookmarksFile = $HOME . '/.config/nvim/.nerdtree-bookmarks'

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


":1 Plugins
" Features
let g:vimwiki_list = [{'path': '~/.config/vimwiki', 'path_html': '~/.config/vimwiki'}]

let g:user_emmet_leader_key=','

let g:vim_isort_python_version = 'python3'
let g:vim_isort_config_overrides = {'line_length': 120}
let g:vue_disable_pre_processors = 0

":1 Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['filename', 'modified']],
      \   'right': [['lineinfo', 'percent'], ['percent'], ['readonly'], ['lsp_diagnostics_errors'], ['lsp_diagnostics_warnings'], ['lsp_diagnostics_hints']]
      \ },
      \ 'component_expand': {
      \   'filename': 'LightlineFileName',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \ },
      \ 'component_function': {
      \   'lsp_diagnostics_hints': 'LightlineLspHints',
      \   'lsp_diagnostics_warnings': 'LightlineLspWarnings',
      \   'lsp_diagnostics_errors': 'LightlineLspErrors',
      \ },
      \ }

function! LightlineFileName() abort
  return expand('%')
endfunction

function! LightlineLspHints() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.='💡:'
    let sl.=luaeval("vim.lsp.diagnostic.get_count(0, [[Hint]])")
  endif
  return sl
endfunction

function! LightlineLspWarnings() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.=' :'
    let sl.=luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]])")
  endif
  return sl
endfunction

function! LightlineLspErrors() abort
  let sl = ''
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    let sl.=':'
    let sl.=luaeval("vim.lsp.diagnostic.get_count(0, [[Error]])")
  endif
  return sl
endfunction

":1 Standard (frozen) configurations
syntax on                              " Enable syntax hightlight
filetype off                           " Disable file type detection
filetype plugin on                     " Enable plugins
filetype indent on                     " Enable indent

" set completeopt=menuone,noselect       " Auto complete popup
set laststatus=2                       " Always have status line
set clipboard=unnamed                  " Clipboard
set background=dark                    " Always use dark background
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

":1 Automatic commands
" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Filetype
autocmd FileType python setlocal foldmethod=syntax foldtext=PythonFoldText()

" Tab
autocmd TabEnter * silent! :execute 'cd' g:NERDTree.ForCurrentTab().getRoot().path.str()

so $HOME/.config/nvim/dvorak.vimrc
so $HOME/.config/nvim/filetype.vimrc
