set nocompatible			" Turn off 'vi' behave

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
call plug#end()

" Automatically start NerdTree on startup 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Automatically set scala filetype for sbt files
au BufRead,BufNewFile *.sbt set filetype=scala

set tabstop=4				" Number of tabs spaces when reading /t
set softtabstop=4			" Number of spaces entered when hitting the TAB button

set number					" Show line number
set wildmenu				" Visual autocomplete for command menu
set showmatch				" Highlights matching [{()}]
set incsearch				" Search as characters are entered
set hlsearch				" Highlights search matches


" colorscheme atom-dark		" My prefered color scheme
