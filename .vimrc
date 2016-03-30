" ~/.vimrc
" Author: Rodrigo Valle
"
" Tips:
" hi yes, welcome to my vimrc
" inspiration was drawn from:
" - https://github.com/execb5/.vim ; http://imgur.com/a/HJtVn

set nocompatible
filetype plugin indent on

" VIM-PLUG
" See https://github.com/junegunn/vim-plug for more details
" Tip: Make sure you use single quotes

call plug#begin('~/.vim/plugged')

" syntax highlighting
"Plug 'justinmk/vim-syntax-extra'       " better syntax highlighting for C
Plug 'octol/vim-cpp-enhanced-highlight' " better syntax highlighting for C/C++

" utilities
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" color schemes
Plug 'whatyouhide/vim-gotham'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'

" Add plugins to &runtimepath
call plug#end()

" TAGBAR
nmap <F8> :TagbarToggle<CR>

" STATUS LINE
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['%p%%  ', g:airline_symbols.linenr, ' %l:', ' %c '])
let g:airline#extensions#whitespace#enabled = 0

" GUI
if has('gui_running')
	" GUI colors
	set guifont=Inconsolata\ for\ Powerline\ 11
	set encoding=utf8
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif

" COLORSCHEME
colorscheme gotham

" MISC CONFIGURATION
set number
set textwidth=80
set list lcs=trail:·,precedes:«,extends:»,eol:¬,tab:\|\   "tab:»·,tab:▸\ 
set noerrorbells
set nowrap
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4

