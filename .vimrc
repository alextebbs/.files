colorscheme torte
set mouse=a
map <F1> :previous<CR>
map <F2> :next<CR>
map ,v :vsp ~/.vimrc<cr>
map ,u :source ~./vimrc<cr>
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set t_Co=256
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
map <c-space> <c-x><c-o>
set guifont=ProggySquareTT:h12
