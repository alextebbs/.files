" MAPPINGS ////////////////////////////////////////////////

map <F1> :previous<CR>
map <F2> :next<CR>
map ,v :vsp ~/.vimrc<cr>
map ,u :source ~/.vimrc<cr>

set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set t_Co=256
set ruler
set number
set hidden
set mouse=a

" PLUGIN STUFF ////////////////////////////////////////////

call pathogen#infect()
let NERDTreeIgnore = ['\.pyc$']


" CSS autocomplete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

if has ("gui_running")
	if has ("gui_gtk2")
		set guifont=ProggySquareTTSZ\ 12
	else
		set guifont=ProggySquareTTSZ:h12
	endif
endif

set backupdir=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp

" Zenburn Settings

let g:zenburn_high_Contrast = 1

colorscheme zenburn
