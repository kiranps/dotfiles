" Vim Configuration
" ===========

" Use vim rather than vi settings
" ===========
set nocompatible

"Setup Vundle For Package Management
"Vundle begins here, turn off filetype temporarily
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins 
" ==============

Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'digitaltoad/vim-jade'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
"Plugin 'skammer/vim-css-color'
Plugin 'ervandew/supertab'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'chrisgillis/vim-bootstrap3-snippets'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'elzr/vim-json'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
call vundle#end()
"Vundle ended so reenable filetypes
filetype plugin indent on

" Appearance
" ==========

"Syntax highlighting
" ==============
set t_Co=256
syntax on
syntax enable
colorscheme material
set term=xterm-256color

"Colorscheme custom
" ==============
hi LineNr ctermfg=grey
hi VertSplit ctermfg=237 ctermbg=NONE
hi nonText ctermbg=NONE

" General Config
" ==============
set encoding=utf-8 nobomb " BOM often causes trouble
set number "line numbers
set showcmd " Show incomplete cmds down the bottom
set autoread " Reload files changed outside vim
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set ttyfast " Send more characters at a given time.
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set nolist " list disables linebreak

" Search / replace
" ==============
set gdefault " By default add g flag to search/replace. Add g to toggle.
set ignorecase " Ignore case of searches.
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup

" Indentation and Display
" =======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif


"set leader key as space
let mapleader = "\<Space>"

"refresh vimrc
nmap <Leader>[ :so $MYVIMRC<CR>

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

"code folding
vmap <Leader>f zf
vmap <Leader>F zo

"cut copy paste
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p

"easy motion Leaderkey binding
map <Leader>e <Plug>(easymotion-prefix)

"Open visual mode
nmap <Leader><Leader> V

"switch split pane
nmap <Leader>s <C-w><C-w>

"correct indentation
vmap <Leader>i =

"select all
nmap <Leader>a ggVG

nmap <Leader>q :q!<CR>

"open nerd tree
nmap <Leader>j :NERDTreeToggle<CR>

"next buffer
nmap <Leader>m :bn<CR>

"previous buffer
nmap <Leader>n :bp<CR>

"close buffer
nmap <Leader>d :bd<CR>

"open config file
nmap <leader>r :e ~/.vimrc<CR>

"command mode
imap jk <esc>
vmap q <esc>

"move to end of line
nmap E $

"move to begining of line
nmap B ^

"page up
nmap <C-k> <C-u>

"page down
nmap <C-j> <C-d>

imap hh <C-y>,

"tabbing visual selection
vmap <Tab> >gv
vmap <S-Tab> <gv


"emmet only for html css
" ==============
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"airline
set laststatus=2

"airline tabline
let g:airline#extensions#tabline#enabled = 1

"let g:airline#extensions#tmuxline#enabled = 0

"airline theme
let g:airline_theme="bubblegum"

"airline separator
let g:airline_left_sep=''
let g:airline_right_sep=''

"snipmate trigger key
imap kk <Plug>snipMateNextOrTrigger
imap KK <Plug>snipMateBack 

"indentation lines
let g:indentLine_color_term = 236
let g:indentLine_char = '|'
