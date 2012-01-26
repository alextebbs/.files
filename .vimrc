" SETTINGS ////////////////////////////////////////////////////////////////////

set nocompatible            

set autoindent              " autoindent!
set tabstop=4               " tabs are 4 chars
set shiftwidth=4            " indenting is done in 4char increments
set expandtab               " tabs become spaces
set smarttab                " tabs are smart
set smartindent

set t_Co=256
set ruler                   " always show current position
set wildmenu                " enable wildmenu
set number                  " enable line numbers
set incsearch               " enable incremental search
set hidden                  " change buffer without saving
set mouse=a                 " mouse support
syntax on

set textwidth=79            " when wrapping, wrap after 79 chars
set formatoptions-=t        " but dont automatically wrap

if has ("gui_running")
    if has ("gui_gtk2")
        set guifont=ProggySquareTTSZ\ 12
    else
        set guifont=ProggySquareTTSZ:h12
    endif
endif

set swapfile
set dir=~/tmp
set backupdir=~/tmp,/var/tmp,$HOME/Local\ Settings/Temp

colorscheme molokai

" STATUSLINE //////////////////////////////////////////////////////////////////

set laststatus=2
set statusline=%F                                   " tail of the filename
set statusline+=%=                                  " left/right separator
set statusline+=[%{strlen(&fenc)?&fenc:'none'},     " file encoding
set statusline+=%{&ff}]                             " file format
set statusline+=%h                                  " help file flag
set statusline+=%m                                  " modified flag
set statusline+=%r                                  " read only flag
set statusline+=%y                                  " filetype
set statusline+=\ Col:%c\                           " cursor column
set statusline+=Line:%l/%L                          " cursor line/total lines
set statusline+=\ %P                                " percent through file

" MAPPINGS ////////////////////////////////////////////////////////////////////

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

" Fast saving
nmap <leader>w :w!<cr>

" Save protected file if you forgot sudo
cmap w!! w !sudo dd of=%

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

" PLUGIN STUFF ////////////////////////////////////////////////////////////////

call pathogen#infect()
let NERDTreeIgnore = ['\.pyc$']
