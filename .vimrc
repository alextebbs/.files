" SETTINGS ////////////////////////////////////////////////////////////////////

set nocompatible

set autoindent                  " autoindent!
set tabstop=2                   " tabs are 2 chars
set shiftwidth=2                " indenting is done in 2char increments
set expandtab                   " tabs become spaces
set smarttab                    " tabs are smart
set smartindent                 " indenting is smart
set scrolljump=1                " jump down 5 lines when cursor hits bottom
set scrolloff=20               " keep 3 lines below cursor
set encoding=utf-8              " UTF-8, duh
set backspace=indent,eol,start  " allow backspace over everything
set t_Co=256                    " colors are fun!
set ruler                       " always show current position
set wildmenu                    " enable something that is awesome
" set wildoptions=pum             " enable something that is awesome
set number                      " enable line numbers
set numberwidth=4               " Numbers up to 9999 supported
set incsearch                   " enable incremental search
set ignorecase                  " ignore case when searching
set smartcase                   " case sensitive when UC is present
set gdefault                    " Makes /g the default when doing a :s
set hidden                      " Hides buffers instead of closing them
set mouse=a                     " mouse support
set cursorline                  " highlight current line
set breakindent                 " Better wrapping
set nohlsearch                  " Do not highlight search results

set colorcolumn=80              " highlight 80th thing

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

command! Lights call Lights()

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
noremap <leader>f :NERDTreeFind<CR>


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

" Fast saving
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

" Some arcane thing to show what syntax group youre in
map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Map Alt-[h,j,k,l] for resizing a window split
nnoremap <silent> <leader>h :vertical resize -4<CR>
nnoremap <silent> <leader>j :resize -4<CR>
nnoremap <silent> <leader>k :resize +4<CR>
nnoremap <silent> <leader>l :vertical resize +4<CR>

nnoremap <silent> <leader>L :r !lorem-ipsum 1 paragraph<CR>

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

map <leader>m <Plug>(easymotion-bd-w)

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
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'

Plug 'ntpeters/vim-better-whitespace'

Plug 'Shougo/denite.nvim'

" Syntax plugins
Plug 'sheerun/vim-polyglot'
" Plug 'nelsyeung/twig.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'elzr/vim-json'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 1
" let g:NERDTreeDirArrowExpandable = '⬏'
" let g:NERDTreeDirArrowCollapsible = '⬎'

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
    \   ['uppercase', 'lowercase', 'capitalize', 'none'],
    \   ['width', 'height'],
    \   ['column', 'row']
    \ ]

" CtrlSF
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '100'
let g:ctrlsf_ackprg = 'ag'

" Emmet
let g:user_emmet_leader_key='<C-E>'

let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Open file commands
call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 0,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'statusline': 0,
\ 'highlight_matched_char': 'WildMenu',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'StatusLine',
\ 'highlight_prompt': 'StatusLine',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
endfunction
