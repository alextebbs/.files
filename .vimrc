" SETTINGS ////////////////////////////////////////////////

set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set t_Co=256
set ruler
set wildmenu
set number
set hidden
set mouse=a

" STATUSLINE //////////////////////////////////////////////

set statusline=%F       "tail of the filename
set statusline+=%=      "left/right separator
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=\ Col:%c\      "cursor column
set statusline+=Line:%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

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

" MAPPINGS ////////////////////////////////////////////////

map <F1> :previous<CR>
map <F2> :next<CR>
map ,v :vsp ~/.vimrc<cr>
map ,u :source ~/.vimrc<cr>
map ,n :NERDTreeToggle<cr>
cmap w!! w !sudo dd of=%

" FILETYPES ///////////////////////////////////////////////

filetype plugin indent on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set commentstring=#\ %s

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set commentstring=//\ %s

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set commentstring=<!--\ %s\ -->

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set commentstring=/*\ %s\ */

" PLUGIN STUFF ////////////////////////////////////////////

call pathogen#infect()
let NERDTreeIgnore = ['\.pyc$']

