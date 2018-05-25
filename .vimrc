"----------Plugins----------"
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
call plug#end()

"ADD Fuzzy Finder"
set rtp+=~/.fzf

"----------Basic configs----------"
retab
set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8
set ruler
set showmatch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autowriteall
set textwidth=79
set autoindent
set visualbell
set smartindent
set fileformat=unix
set backspace=indent,eol,start
set complete=.,w,b,u
set hlsearch
set incsearch
"set backupdir = ~/.vim/tmp
set nobackup
set nowritebackup

"-- LEADER is here --""
let mapleader = ','

"----------Special Configs----------"
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set history=50
set showcmd
set incsearch

" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Enableing mouse
if has('mouse')
    set mouse=a
endif

" GVIM configs
set guifont=Monaco\ 14
if has('gui_running')
    set lines=999 columns=999
endif

"----------Plugins Configs----------"
" Airline configs
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1

" GitGutter configs
let g:gitgutter_max_signs = 500

" Syntax configs
set t_CO=256
set background=dark
colorscheme rupza
set number
set laststatus=2
let g:NERDTreeHijackNetrw = 0

" Pymode configs
let g:pymode_python = 'python3'

" Jedi configs --None necessary
"let g:jedi#popup_on_dot = 0
"autocmd FileType python setlocal completeopt-=preview

"-------------Split Management---------------"
set splitbelow                      " set split below to the current one
set splitright                      " set vertical split right to the current one

"-------------Shortcut Mapping---------------"
" Basic shortcuts
:map <M-s> :w<kEnter>
:imap <M-s> <Esc>:w<kEnter>i
:map <M-w> :wq<kEnter>
:imap <M-s> <Esc>:wq<kEnter>

" Python3 dedicated shortcut
nmap <Leader><F5> :!clear;python3 %<CR>
nmap <Leader><F6> :!clear;autopep8 --in-place --aggressive --aggressive %<CR>

" We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader>/ :nohlsearch<cr>

"make NERDTree easier to toggle
nmap <Leader>e :NERDTreeToggle<cr>

"Git-Gutter-Shortcut"
:command GGT GitGutterToggle
:command GGH GitGutterLineHighlightsToggle

"shortcuts for Up/Down"
nnoremap Dw gg<cr>
nnoremap dw Gg<cr>

"shortcuts for Tab/Split toggles"
nnoremap gg gt<cr>
nnoremap ff gT<cr>
nnoremap ww <C-W>w

"shortcut for Replace all
 nnoremap <leader>r yiw:%s/\<<C-r>"\>//g<left><left>

"shortcuts for Git mappings (No fugitive.vim!)
nnoremap <leader>gc :w \| !git commit %<cr>
nnoremap <leader>gd :!git diff<cr>
nnoremap <leader>gp :!git push<cr>
nnoremap <leader>gP :!git pull<cr>

"shortcuts for pasting (if ctrl-shift-v doesn't work in term)
"nmap <leader>p :setlocal paste! paste?<cr>

"search ctags
nmap  <Leader>f :tag<space> 

" tabularize plugin for auto alignment
nmap <Leader>a :Tabularize /
vmap <Leader>a :Tabularize /

"------Open NerdTree on startup(if no args)------"
autocmd VimEnter * if !argc() | NERDTree | endif
