" SETTINGS ////////////////////////////////////////////////////////////////////

set nocompatible

set autoindent                  " autoindent!
set tabstop=2                   " tabs are 2 chars
set shiftwidth=2                " indenting is done in 2char increments
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
set breakindent                 " Better wrapping

" Only show CursorLine in current window/pane
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,FocusGained * setlocal cursorline
  au WinLeave,FocusLost * setlocal nocursorline
augroup END

set clipboard=unnamed           " Use OSX clipboard
set autoread                    " Reload files updated outside of vim
set iskeyword-=_                " Makes underscores count as a word
set splitbelow                  " Splits open below
set splitright                  " Splits open to the right

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
    set guioptions-=e
    " Hacked font for use w/ Powerline/Airline
    set guifont=Inconsolata-g\ for\ Powerline:h11
    " set guifont=Operator\ Mono\ for\ Powerline:h11
    " set guifont=Inconsolata\ Nerd\ Font\ Mono:h13
endif


set noswapfile
" set directory=~/tmp/swap/

set nobackup
" set backupdir=~/tmp/backup/

set undofile
set undodir=~/tmp/undo/

set background=light
colorscheme light

if has('gui_running')
    set background=light
    colorscheme light
else
    set background=dark
    colorscheme dark
endif

function! Lights()
  if g:colors_name == 'dark'
    colorscheme light
  else
    colorscheme dark
  endif
endfunc

" Automatically change vim working directory to path of current file.
" autocmd BufEnter * silent! lcd %:p:h

" STATUSLINE /////////////////////////////////////////////////////////////////

let g:Powerline_symbols = 'fancy'                   " Use fancy symbols
set laststatus=2                                    " Always show statusline

" MAPPINGS ///////////////////////////////////////////////////////////////////

" These are some good keys to remap in normal mode
" - + H L <space> <cr> <bs>

" Use space as leader key
let mapleader = " "

" F1 and f2 move through buffers
noremap <F1> :previous<CR>
noremap <F2> :next<CR>

" Much easier
noremap H 0
noremap L $

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" open .vimrc in vertical split
noremap <leader>v :vsp $MYVIMRC<CR>

" source .vimrc
noremap <leader>u :source $MYVIMRC<CR>

" Open NERDTree
noremap <leader>n :NERDTreeToggle<CR>

" Nerdtree is so laaaaame
" noremap <leader>o cdoC

" Toggle set cursorcolumn
noremap <leader>\ :set cursorcolumn!<CR>

" New Tab, this is already mapped in macvim
" map <D-t> :tabnew<CR>

" break lines with K, goes with joining lines via J
noremap K i<CR><ESC>

" toggle that paste
noremap <leader>p :set invpaste paste?<CR>

" Fast saving, but my muscles wont use it
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :wq<cr>

" Save protected file if you forgot to sudo into it
cnoremap w!! w !sudo dd of=%

" Split navigation
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" indent from visual mode w/o leaving visual mode
vnoremap < <gv
vnoremap > >gv

" j/k move up and down through wrapped lines in a sane way
noremap <buffer><silent>k gk
noremap <buffer><silent>j gj

" Move through wrapped lines in a sane way
noremap j gj
noremap k gk

" Copy/Paste to clipboard
map <leader>cc "+y
map <leader>vv "+p

" Exit insert mode with `jk`
inoremap jk <ESC>

" Some arcane thing to show what syntax group youre in
map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Toggle color scheme
" nnoremap <leader>l :call Lights()<cr>

" Map Alt-[h,j,k,l] for resizing a window split
nnoremap <silent> <leader>h :vertical resize -4<CR>
nnoremap <silent> <leader>j :resize -4<CR>
nnoremap <silent> <leader>k :resize +4<CR>
nnoremap <silent> <leader>l :vertical resize +4<CR>

" Set working directory to the current file
nnoremap <leader>cd :cd %:p:h<CR>

" :au FocusLost * :set number
" :au FocusGained * :set relativenumber

" CtrlSF Mappings
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" FZF
noremap <leader>f :GFiles<CR>

" Easymotion
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

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
  autocmd FileType html set shiftwidth=2
augroup END

augroup CSS
  autocmd!
  autocmd Filetype css,sass,scss,stylus,less call SetCSSAutocomplete()
  autocmd FileType css set commentstring=/*\ %s\ */
  autocmd FileType stylus,sass,css set shiftwidth=2
augroup END

augroup JADE
  autocmd!
  autocmd FileType jade set shiftwidth=2
augroup END

au BufRead,BufNewFile *.inc set filetype=html

" PLUGIN STUFF ////////////////////////////////////////////////////////////////

" vim-plug is cool now i guess
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'
Plug 'tpope/vim-abolish'
Plug 'svermeulen/vim-easyclip'
Plug 'easymotion/vim-easymotion'
Plug 'gcmt/taboo.vim'
Plug 'tmhedberg/matchit'
Plug 'dyng/ctrlsf.vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'matsen/nvim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'ryanoasis/vim-devicons'

" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Syntax plugins
" Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'

call plug#end()

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 1

function! NERDTreeHighlightFile(extension, fg, bg, guifg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('html', 202, 'none', '#FC4709')
call NERDTreeHighlightFile('hbs', 202, 'none', '#FC4709')
call NERDTreeHighlightFile('jade', 149, 'none', '#A0D24D')
call NERDTreeHighlightFile('json', 223, 'none', '#FECEA0')
call NERDTreeHighlightFile('scss', 44, 'none', '#1AD0CE')
call NERDTreeHighlightFile('sass', 44, 'none', '#1AD0CE')
call NERDTreeHighlightFile('css', 44, 'none', '#1AD0CE')
call NERDTreeHighlightFile('js', 226, 'none', '#FFFF0D')
call NERDTreeHighlightFile('rb', 197, 'none', '#E53378')
call NERDTreeHighlightFile('md', 208, 'none', '#FD720A')
call NERDTreeHighlightFile('php', 140, 'none', '#9E6FCD')
call NERDTreeHighlightFile('svg', 178, 'none', '#CDA109')
call NERDTreeHighlightFile('gif', 36, 'none', '#15A274')
call NERDTreeHighlightFile('jpg', 36, 'none', '#15A274')
call NERDTreeHighlightFile('png', 36, 'none', '#15A274')

" Open NERDTree at startup if you didn't specify a file
augroup NERDTree
  autocmd!
  autocmd vimenter * if !argc() | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" SuperTab
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" CtrlP
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline
let g:airline_powerline_fonts = 1

" Switch
let g:switch_mapping = "-"

let g:switch_custom_definitions =
    \ [
    \   ['top', 'bottom'],
    \   ['left', 'right'],
    \   ['above', 'below'],
    \   ['before', 'after'],
    \   ['next', 'prev'],
    \   ['margin', 'padding'],
    \   ['darken', 'lighten'],
    \   ['black', 'white'],
    \   ['block', 'flex', 'inline', 'inline-block', 'none'],
    \   ['hidden', 'visible', 'auto', 'scroll'],
    \   ['absolute', 'fixed', 'relative', 'static'],
    \   ['uppercase', 'lowercase', 'capitalize', 'none']
    \ ]

" CtrlSF
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '100'

" Emmet
let g:user_emmet_leader_key='<C-E>'

let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
