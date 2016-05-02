" ~/.vimrc
" Author: Rodrigo Valle
"
" Tips:
" hi yes, welcome to my vimrc
" inspiration was drawn from:
" - https://github.com/execb5/.vim ; http://imgur.com/a/HJtVn

set nocompatible
filetype plugin indent on
syntax enable

" VIM-PLUG
" See https://github.com/junegunn/vim-plug for more details
" Tip: Make sure you use single quotes

call plug#begin('~/.vim/plugged')

" syntax highlighting
"Plug 'justinmk/vim-syntax-extra'       " better syntax highlighting for C
Plug 'octol/vim-cpp-enhanced-highlight' " better syntax highlighting for C/C++

" color schemes
Plug 'whatyouhide/vim-gotham'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'

" utilities
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Add plugins to &runtimepath
call plug#end()

" COLORSCHEME
colorscheme gotham

" TAGBAR
nmap <F8> :TagbarToggle<CR>

" STATUS LINE
" bug with some powerline symbols not showing, possibly related to font size in urxvt/gvim
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['%p%%  ', g:airline_symbols.linenr, ' %l:', ' %c '])
let g:airline#extensions#whitespace#enabled = 0

colorscheme gotham

" GUI
if has('gui_running')
	set guifont=Inconsolata\ for\ Powerline\ 12
	set encoding=utf8
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
	set linespace=1
	set guiheadroom=0
endif

" MISC CONFIGURATION
set number
set textwidth=80
"set list lcs=trail:·,precedes:«,extends:»,eol:¬,tab:\|\ 
set noerrorbells
set nowrap
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
