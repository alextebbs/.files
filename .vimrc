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
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4c\ %*             "column number
set statusline +=%2*0x%04B\ %*          "character under cursor

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

colorscheme torte

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

