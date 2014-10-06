" Vim Configuration
" ===========

" Use vim rather than vi settings
set nocompatible

"Setup Vundle For Package Management

"Vundle begins here, turn off filetype temporarily
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'


"My plugins

"show current buffers in a siderbar
Plugin 'Buffergator'

"Plugin 'unite.vim'
"Plugin 'python.vim'

"autocompletion
Plugin 'SuperTab'

" ctrlp is file fuzzy search
Plugin 'ctrlp.vim'

"Plugin 'node.js'
Plugin 'JavaScript-Indent'

"insert comment
Plugin 'The-NERD-Commenter'

"Plugin 'wombat256.vim'
Plugin 'tpope/vim-surround'
"plugin 'snipmate'
"Plugin 'EasyMotion'
Plugin 'bling/vim-airline'
Plugin 'othree/html5.vim'
"Plugin 'Valloric/YouCompleteMe'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "mattn/emmet-vim"
Bundle 'edkolev/tmuxline.vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'The-NERD-tree'
"Bundle 'mileszs/ack.vim'



"End Vundle
call vundle#end()
"Vundle ended so reenable filetypes
filetype plugin indent on

" Appearance
" ==========

"We want syntax highlighting in 256 colors
set t_Co=256
syntax on
syntax enable
set ignorecase
set term=xterm-256color

"set line number color
hi LineNr ctermfg=grey

hi VertSplit ctermbg=red

""Use Source Code Pro for the font
"set guifont=Source\ Code\ Pro\ For\ PowerlineSymbols:h16
"set noshowmode " Let airline handle the mode display


" General Config
" ==============

"set leader key as space
let mapleader = "\<Space>"

set encoding=utf-8
set number
set backspace=indent,eol,start " Allow backspace in insert mode
set showcmd " Show incomplete cmds down the bottom
set autoread " Reload files changed outside vim


" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Indentation and Display
" =======================
" We want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces visually
set nowrap " Don't wrap lines

" Folds
" =====
set foldmethod=indent " Fold based on indent
set foldnestmax=3 " Deepest fold is 3 levels
set nofoldenable " Don't fold by default

imap jk <esc>

"move to end of line
nmap E $

""move to begining of line
nmap B ^

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>y "+y


"Open visual mode
nmap <Leader><Leader> V


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
nmap <leader>rr :e ~/.vimrc<CR>  

imap hh <C-y>,

"tabbing visual selection
vmap <Tab> >gv
vmap <S-Tab> <gv

"window navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

"tabspaces
" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

"emmet only for html css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"splitbar
:set fillchars+=vert:\ 

"airline
set laststatus=2

"lineno color
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"airline tabline
let g:airline#extensions#tabline#enabled = 1

"airline theme
let g:airline_theme="bubblegum"

"tmuxline
let g:tmuxline_powerline_separators = 0

"powerline font for airline
"let g:airline_powerline_fonts=1 

"let g:Powerline_symbols = 'fancy'

"airline separator
let g:airline_left_sep=''
let g:airline_right_sep=''

"YouCompleteMe configuration
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_invoke_completion = '<C-TAB>'
