syntax on					" Enable sytax processing
colorscheme atom-dark		" My prefered color scheme

set tabstop=4				" Number of tabs spaces when reading /t
set softtabstop=4			" Number of spaces entered when hitting the TAB button

set number					" Show line number
set wildmenu				" Visual autocomplete for command menu
set showmatch				" Highlights matching [{()}]
set incsearch				" Search as characters are entered
set hlsearch				" Highlights search matches

set nocompatible			" Turn off 'vi' behave

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Automatically start NerdTree on startup 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Automatically close NerdTree when no tabs opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
