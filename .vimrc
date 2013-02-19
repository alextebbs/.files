" SETTINGS ////////////////////////////////////////////////////////////////////

set nocompatible

set autoindent                  " autoindent!
set tabstop=2                   " tabs are 2 chars
set shiftwidth=4                " indenting is done in 2char increments
set expandtab                   " tabs become spaces
set smarttab                    " tabs are smart
set smartindent                 " indenting is smart
set scrolljump=5                " jump down 5 lines when cursor hits bottom
set scrolloff=10                " keep 3 lines below cursor
set encoding=utf-8              " UTF-8, duh
set backspace=indent,eol,start  " allow backspace over everything
set t_Co=256                    " colors are fun!
set ruler                       " always show current position
set wildmenu                    " enable something that is awesome
set number                      " enable line numbers
set numberwidth=4               " Numbers up to 9999 supported
set incsearch                   " enable incremental search
set ignorecase                  " ignore case when searching
set smartcase                   " case sensitive when UC is present
set gdefault                    " Makes /g the default when doing a :s
set hidden                      " change buffer without saving
set mouse=a                     " mouse support
set cursorline                  " highlight current line
set clipboard=unnamed           " Use OSX clipboard
set autoread                    " Reload files updated outside of vim
set iskeyword-=_                " Makes underscores count as a word


" Show tabs and trailing spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

syntax on                       " Not sure but I think this turns on syntax?

set textwidth=79                " when wrapping, wrap after 79 chars
set formatoptions-=t            " but dont automatically wrap

if has ("gui_running")
    " Hide all the extra crap in gVim
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    " Hacked font for use w/ Powerline
    set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h12
endif

" CodeKit is silly and doesn't support swapfiles
set nobackup
set nowritebackup
set noswapfile

" set swapfile
" set directory=~/tmp/swap/

" set backup
" set backupdir=~/tmp/backup/

set undofile
set undodir=~/tmp/undo/

set background=dark
colorscheme molokai

" Tried to use solarized but it was fugly
" let g:solarized_termcolors=256
" colorscheme solarized

" STATUSLINE /////////////////////////////////////////////////////////////////

let g:Powerline_symbols = 'fancy'                   " Use fancy symbols
set laststatus=2                                    " Always show statusline

" MAPPINGS ///////////////////////////////////////////////////////////////////

" These are some good keys to remap in normal mode
" - + H L <space> <cr> <bs>

" Use , as leader key
let mapleader = ","

" F1 and f2 move through buffers
noremap <F1> :previous<CR>
noremap <F2> :next<CR>

" Cmd-R to 'Refresh' file
noremap <D-r> :e

" make - do something useful
noremap - dd

" Much easier
noremap H 0
noremap L $

" open .vimrc in vertical split
noremap <leader>v :vsp $MYVIMRC<CR>

" source .vimrc
noremap <leader>u :source $MYVIMRC<CR>

" Open NERDTree
noremap <leader>n :NERDTreeToggle<CR>

" Nerdtree is so laaaaame
noremap <leader>o cdoC

" Toggle set cursorcolumn
noremap <leader>\ :set cursorcolumn!<CR>

" Fugitive mappings

" Show status
noremap <leader>gs :Gstatus<CR>

" Commit some things, start in insert mode
noremap <leader>gc :Gcommit<CR>i

" Add the current file
noremap <leader>ga :Git add %<CR>

" Add everything
noremap <leader>gA :Git add -A<CR>

" Push w/ default settings
noremap <leader>gp :Git push origin master<CR>

" Pull
noremap <leader>gu :Git pull<CR>

" New Tab, this is already mapped in macvim
" map <D-t> :tabnew<CR>

" break lines with K, goes with joining lines via J
noremap K i<CR><ESC>

" toggle that paste
noremap <leader>p :set invpaste paste?<CR>

" Fast saving, but my muscles wont use it
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :wq<cr>

" Save protected file if you forgot sudo
cnoremap w!! w !sudo dd of=%

" Stupid shift key fixes
cnoremap W w
cnoremap WQ wq
cnoremap wQ wq
cnoremap Q q

" quick shortcut to open help in vsplit
cnoremap vh vert help

" indent from visual mode w/o leaving visual mode
vnoremap < <gv
vnoremap > >gv

" j/k move up and down through wrapped lines in a sane way
noremap <buffer><silent>k gk
noremap <buffer><silent>j gj

" ghetto way to copy to OSX clipboard through pbcopy,
" if clipboard support is not available
vnoremap <leader>c :w !pbcopy<CR><CR>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>j :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

" ABBREVIATIONS //////////////////////////////////////////////////////////////

" FILETYPES ///////////////////////////////////////////////////////////////////

filetype plugin indent on

augroup Python
  autocmd!
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType python set commentstring=#\ %s
augroup END

augroup Javascript
  autocmd!
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript set commentstring=//\ %s
  autocmd FileType javascript set shiftwidth=2
augroup END

augroup HTML
  autocmd!
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html set commentstring=<!--\ %s\ -->
  autocmd FileType html set formatoptions-=t
  autocmd FileType html set shiftwidth=4
augroup END

augroup CSS
  autocmd!
  autocmd Filetype css,sass,scss,stylus,less call SetCSSAutocomplete()
  autocmd FileType css set commentstring=/*\ %s\ */
  autocmd FileType stylus,sass set shiftwidth=2
augroup END

augroup JADE
  autocmd!
  autocmd FileType jade set shiftwidth=2
augroup END

" PLUGIN STUFF ////////////////////////////////////////////////////////////////

call pathogen#infect()

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '.DS_Store']

" Open NERDTree at startup if you didn't specify a file
augroup NERDTree
  autocmd!
  autocmd vimenter * if !argc() | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" SuperTab
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" EasyMotion
let g:EasyMotion_leader_key = '<Leader><Leader>'

" CtrlP
let g:ctrlp_working_path_mode = 2

" Sparkup
let g:sparkupNextMapping = '<c-x>'
