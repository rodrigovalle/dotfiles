" ~/.vimrc
" hi yes, welcome to my vimrc
" Author: Rodrigo Valle

set nocompatible
filetype plugin indent on
syntax enable


" VIM-PLUG
" See https://github.com/junegunn/vim-plug for more details
" Tip: Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" syntax highlighting
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'justinmk/vim-syntax-extra'        " better syntax highlighting for C
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
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'Rip-Rip/clang_complete'
"Plug 'scrooloose/syntastic'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Add plugins to &runtimepath
call plug#end()


" COLORSCHEME ----------------------------------------------------------------
" http://github.com/morhetz/gruvbox/wiki/Configuration
set background=dark
set termguicolors
let g:gruvbox_bold=0
let g:gruvbox_italic=0
let g:gruvbox_underline=0
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
let g:gruvbox_hls_cursor='orange'
let g:gruvbox_number_column='bg2'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_color_column='bg1'
let g:gruvbox_vert_split='bg2'
let g:gruvbox_italicize_comments=0
let g:gruvbox_italicize_strings=0
let g:gruvbox_italicize_strings=0
let g:gruvbox_invert_selection=1
let g:gruvbox_invert_signs=0
let g:gruvbox_invert_indent_guides=1
let g:gruvbox_invert_tabline=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=0
colorscheme gruvbox

"set invisible chars to color bg2
hi NonText      cterm=none gui=none guifg=#504945
hi StatusLine   cterm=none gui=none guifg=#a89984 guibg=#282828
hi StatusLineNC cterm=none gui=none guifg=#a89984 guibg=#282828
hi Cursor       guifg=#a89984
hi iCursor      guifg=#a89984
"hi vertsplit    ctermfg=238 ctermbg=235
"hi Search       ctermfg=15  ctermbg=58
"hi ColorColumn              ctermbg=236 guibg=#454545
"hi Default      ctermfg=1
"hi clear SignColumn
"hi SignColumn            ctermbg=235
"hi GitGutterAdd          ctermbg=235 ctermfg=245
"hi GitGutterChange       ctermbg=235 ctermfg=245
"hi GitGutterDelete       ctermbg=235 ctermfg=245
"hi GitGutterChangeDelete ctermbg=235 ctermfg=245
"hi EndOfBuffer           ctermfg=237 ctermbg=235


" STATUS LINE ----------------------------------------------------------------
" bug with some powerline symbols not showing,
" possibly related to font size in urxvt/gvim
"set statusline=%=%P\ %f\ %m

set statusline=%=
set statusline+=%R "readonly
set statusline+=\ \ %t "filename
set statusline+=%m "modified
set statusline+=\ \ %y "filetype
set statusline+="   %{fugitive#head()}
set statusline+=\ \ %P "percentage
"set statusline+=\ %3p%% "percentage

set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode
"set encoding=utf-8
"let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_section_z =
"  airline#section#create(['%p%%  ', g:airline_symbols.linenr, ' %l:', ' %c '])
"let g:airline_extensions = ['branch', 'tagbar']


" OMNICOMPLETE ---------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window)
set completeopt=menu,menuone
set pumheight=20

"let g:clang_close_preview=1


" ALE ------------------------------------------------------------------------
let g:ale_cpp_clangtidy_executable='vagrant ssh -- clang-tidy'

let g:ale_cpp_clangtidy_checks=[
\ '*',
\ '-llvm-header-guard',
\ '-google-runtime-references',
\ '-readability-implicit-bool-cast',
\ '-google-readability-todo'
\]
let g:ale_cpp_clangtidy_options='-std=c++11'
let g:ale_python_pylint_options='--disable=C0103'


" GOYO -----------------------------------------------------------------------
let g:goyo_linenr = 1
function! s:goyo_enter()
  hi NonText guifg=#282828
endfunction

function! s:goyo_leave()
  hi NonText guifg=#504945
  " goyo screws with the status line format for some reason
  hi StatusLine   cterm=none gui=none
  hi StatusLineNC cterm=none gui=none
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" PANDOC/INDENTLINE ----------------------------------------------------------
"disable annoying conceal thing
let g:pandoc#syntax#conceal#use = 0
"let g:indentLine_setConceal = 0


" TAGBAR ---------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>


" VIMTEX ---------------------------------------------------------------------
let maplocalleader = ','
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'


" GUI ------------------------------------------------------------------------
if has('gui_running')
  set guifont=Droid\ Sans\ Mono\ 9
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set linespace=0
  set guiheadroom=0

  " start Goyo
  "autocmd VimEnter * Goyo
endif


" HOTKEYS --------------------------------------------------------------------
" Allow saving of files with sudo when I forget to start vim with sudo
cmap w!! w !sudo sponge %


" MISC CONFIGURATION ---------------------------------------------------------
set number
set colorcolumn=81
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set list lcs=trail:·,precedes:«,extends:»,eol:¬,tab:\|\ 
"set list lcs=precedes:«,extends:»,eol:¬,tab:¦\ 
set noerrorbells
set hlsearch
set nowrap
set scrolloff=5
"set cursorline
set showcmd   " show command in bottom bar
set wildmenu  " visual autocomplete
set lazyredraw
set showmatch " highlight matching [{()}]

set textwidth=80
set formatoptions=nb1croqlt

" https://dougblack.io/words/a-good-vimrc.html
" searching
set incsearch " search as characters are entered
set hlsearch  " highlight matches

" folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default

set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
