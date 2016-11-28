" ~/.vimrc
" Author: Rodrigo Valle
"
" hi yes, welcome to my vimrc

set nocompatible
filetype plugin indent on
syntax enable

" VIM-PLUG
" See https://github.com/junegunn/vim-plug for more details
" Tip: Make sure you use single quotes

call plug#begin('~/.vim/plugged')

" syntax highlighting
"Plug 'justinmk/vim-syntax-extra'       " better syntax highlighting for C
"Plug 'octol/vim-cpp-enhanced-highlight' " better syntax highlighting for C/C++

" colorschemes
Plug 'whatyouhide/vim-gotham'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'cdmedia/itg_flat_vim'
Plug 'chriskempson/base16-vim'

" utilities
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'

" Add plugins to &runtimepath
call plug#end()

" COLORSCHEME
colorscheme gruvbox
hi Normal ctermbg=NONE
  "required for transparency

" TAGBAR
nmap <F8> :TagbarToggle<CR>

" STATUS LINE
" bug with some powerline symbols not showing, possibly related to font size in urxvt/gvim
set encoding=utf-8
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['%p%%  ', g:airline_symbols.linenr, ' %l:', ' %c '])
let g:airline_extensions = ['branch', 'tagbar']

" VIMTEX
let maplocalleader = ','
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'

" GUI
if has('gui_running')
    set guifont=SourceCodePro\ 6.5
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
	set linespace=1
	set guiheadroom=0

	"colorscheme PaperColor
	"set background=light
    colorscheme gruvbox
endif

" MISC CONFIGURATION
set number
set textwidth=100
set colorcolumn=81
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set list lcs=trail:·,precedes:«,extends:»,eol:¬,tab:\|\ 
set noerrorbells
set nowrap
set hlsearch
set scrolloff=10
