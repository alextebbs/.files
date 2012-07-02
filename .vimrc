" SETTINGS ////////////////////////////////////////////////////////////////////

set nocompatible            

set autoindent              " autoindent!
set tabstop=4               " tabs are 4 chars
set shiftwidth=4            " indenting is done in 4char increments
set expandtab               " tabs become spaces
set smarttab                " tabs are smart
set smartindent
set scrolljump=5            " jump down 5 lines when cursor hits bottom
set scrolloff=3             " keep 3 lines below cursor
set encoding=utf-8          " UTF-8, duh
set backspace=indent,eol,start
                            " allow backspace over everything
set t_Co=256
set ruler                   " always show current position
set wildmenu                " enable something that is awesome
set number                  " enable line numbers
set incsearch               " enable incremental search
set ignorecase              " ignore case when searching
set smartcase               " case sensitive when UC is present
set gdefault                " Makes /g the default when doing a :s
set hidden                  " change buffer without saving
set mouse=a                 " mouse support
set cursorline              " highlight current line

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

syntax on                   " Not sure but I think this turns on syntax?

set textwidth=79            " when wrapping, wrap after 79 chars
set formatoptions-=t        " but dont automatically wrap

" mostly I run Vim inside Putty or iTerm, so this is useless
if has ("gui_running")
    if has ("gui_gtk2")
        set guifont=ProggySquareTTSZ\ 12
    else
        set guifont=ProggySquareTTSZ:h12
    endif
endif

set swapfile
set directory=~/tmp/swap/

set backup
set backupdir=~/tmp/backup/

colorscheme molokai

" STATUSLINE //////////////////////////////////////////////////////////////////

let g:Powerline_symbols = 'fancy'

set laststatus=2                                    " Always show statusline

" MAPPINGS ////////////////////////////////////////////////////////////////////

" Use , as leader key
let mapleader = ","

" F1 and f2 move through buffers
map <F1> :previous<CR>
map <F2> :next<CR>

" open .vimrc in vertical split
map <leader>v :vsp ~/.vimrc<cr>

" source .vimrc
map <leader>u :source ~/.vimrc<cr>

" Open NERDTree
map <leader>n :NERDTreeToggle<cr>

" break lines with <leader>k
map <leader>k i<CR><ESC>l

" toggle that paste
map <leader>p :set invpaste paste?<CR>

" Fast saving, but my muscles wont use it
nmap <leader>w :w!<cr>

" Save protected file if you forgot sudo
cmap w!! w !sudo dd of=%

" Stupid shift key fixes
cmap W w 
cmap WQ wq
cmap wQ wq
cmap Q q

" indent from visual mode w/o leaving visual mode
vnoremap < <gv
vnoremap > >gv 

" j/k move up and down through wrapped lines in a sane way
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj

" FILETYPES ///////////////////////////////////////////////////////////////////

filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set commentstring=#\ %s

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set commentstring=//\ %s

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set commentstring=<!--\ %s\ -->

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set commentstring=/*\ %s\ */

au FileType stylus set omnifunc=csscomplete#CompleteCSS

" PLUGIN STUFF ////////////////////////////////////////////////////////////////

call pathogen#infect()

" NerdTree
let NERDTreeIgnore = ['\.pyc$']

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" CtrlP
let g:ctrlp_working_path_mode = 2
