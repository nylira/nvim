"----------------------------------------------------------------------
" Bundle Management: Vundle
"----------------------------------------------------------------------

set nocompatible
call plug#begin('~/.vim/plugged')

" plugins 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-unimpaired'
Plug 'danro/rename.vim'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-arpeggio'
Plug 'ap/vim-buftabline'
Plug 'altercation/vim-colors-solarized'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" language support
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'gkz/vim-ls'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'posva/vim-vue'

" javascript
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'

" Add plugins to &runtimepath
call plug#end()

"----------------------------------------------------------------------
" Color Scheme
"----------------------------------------------------------------------

set t_Co=256
syntax enable
set background=dark
colorscheme solarized

"----------------------------------------------------------------------
" Settings: General
"----------------------------------------------------------------------

set exrc
set hidden                      " switch buffers w/o saving
set fileencodings=utf-8
set scrolloff=999
set cursorline
set history=1001                " remember more 
set undolevels=1000             " undo all the things
set visualbell                  " don't beep
set noerrorbells                " don't beep
set backspace=indent,eol,start  " fix backspace

let &showbreak=repeat(' ', 2)   " make long lines slightly indented

set clipboard=unnamed

set autoread                    " automatically reload files

"----------------------------------------------------------------------
" Settings: Spaces & Tabs
"----------------------------------------------------------------------

set tabstop=2            " number of visual spaces per tab
set softtabstop=2        " number of spaces in tab when editing
set shiftwidth=2
set expandtab            " tabs are spaces

"----------------------------------------------------------------------
" Settings: UI Config
"----------------------------------------------------------------------

set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to (speed boost)
set ttyfast
set showmatch           " highlight matching [{()}]

"----------------------------------------------------------------------
" Settings: Searching
"----------------------------------------------------------------------

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nmap <silent> ,/ :nohlsearch<CR>    " clear highlighted text

"----------------------------------------------------------------------
" Settings: Bindings
"----------------------------------------------------------------------

nnoremap ; :

set pastetoggle=<F3>

" edit splits easier
map <C-\> :vsplit<cr>
map <C-_> :split<cr>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"----------------------------------------------------------------------
" Settings: Buffers
"----------------------------------------------------------------------

map gt :bn<cr>
map gT :bn<cr>

"----------------------------------------------------------------------
" Settings: File Types
"----------------------------------------------------------------------

" Makefile - tab instead of space"
autocmd FileType make setlocal noexpandtab

"----------------------------------------------------------------------
" Settings: Backup
"----------------------------------------------------------------------

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"----------------------------------------------------------------------
" Settings: neomake
"----------------------------------------------------------------------

let g:neomake_open_list=2
let g:neomake_jsx_enabled_makers = ['standard']
let g:neomake_javascript_enabled_makers = ['standard']

autocmd! BufWritePost * Neomake

"----------------------------------------------------------------------
" Settings: delimitMate
"----------------------------------------------------------------------

let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 1
let delimitMate_smart_quotes = 1
let delimitMate_balance_matchpairs = 1

"----------------------------------------------------------------------
" Settings: NERDTree
"----------------------------------------------------------------------

nnoremap <F2> :NERDTreeToggle<CR>

" open the old buffer instead a new one
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif   

"----------------------------------------------------------------------
" Settings: CtrlP (ctrlp)
"----------------------------------------------------------------------

let g:ctrlp_map = '<F1>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"----------------------------------------------------------------------
" Settings: Bindings!
"----------------------------------------------------------------------

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

"----------------------------------------------------------------------
" Settings: plasticboy/vim-markdown
"----------------------------------------------------------------------

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings = 1

"----------------------------------------------------------------------
" Settings: search visually
"----------------------------------------------------------------------

vnoremap // y/<C-R>"<CR>

"----------------------------------------------------------------------
" Settings: vim-go 
"----------------------------------------------------------------------

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"----------------------------------------------------------------------
" Settings: arpeggio
"----------------------------------------------------------------------

call arpeggio#map('i', '', 0, 'jk', '<Esc>')

"----------------------------------------------------------------------
" Settings: nerdtree
"----------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>

"----------------------------------------------------------------------
" Settings: buftabline
"----------------------------------------------------------------------

let g:buftabline_numbers = 1

" use movement keys over long lines easier
onoremap <silent> j gj
onoremap <silent> k gk

"----------------------------------------------------------------------
" Settings: jsx
"----------------------------------------------------------------------
let g:jsx_ext_required = 0

"----------------------------------------------------------------------
" Settings: deoplete
"----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1