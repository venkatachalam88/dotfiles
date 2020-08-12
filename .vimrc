" Don't try to be vi compatible
set nocompatible


" Helps force plugins to load correctly when it is turned back on below
filetype off

" Vim-Plug plugin manager
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-plug'
	Plug 'protesilaos/prot16-vim'
	Plug 'dracula/vim'
	Plug 'altercation/vim-colors-solarized'
	Plug 'arcticicestudio/nord-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'preservim/nerdtree'
	Plug 'vim-syntastic/syntastic'
	Plug 'preservim/nerdcommenter'
	Plug 'majutsushi/tagbar'
	Plug 'ycm-core/YouCompleteMe'
	Plug 'itchyny/lightline.vim'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" No Backup files
set nobackup
set nowritebackup

" Color scheme (terminal)
set t_Co=256
set background=dark
colorscheme nord

"Lighline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
