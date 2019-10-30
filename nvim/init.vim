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
Plugin 'scrooloose/nerdcommenter'

"Explorer
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'szw/vim-tags'
"Plugin 'dkprice/vim-easygrep'
"Plugin 'Lokaltog/vim-easymotion'

"Snippet library
Plugin 'marcweber/vim-addon-mw-utils' "Snipmate dependency
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


"Git
Plugin 'tpope/vim-fugitive'

Plugin 'terryma/vim-multiple-cursors'

"Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Theme
Plugin 'ryanoasis/vim-webdevicons'

"Syntax highligting
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'

"AutoComplete
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim' "Python autocompletion

"Code Format
Plugin 'Yggdroot/indentLine'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

"I don't know
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Quramy/tsuquyomi' "Typescript

"Gist
"Plugin 'mattn/webapi-vim'
"Plugin 'mattn/gist-vim'

"Ruby plugins
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'ngmy/vim-rubocop'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-endwise'

"Plugin 'tomtom/tlib_vim'
"Plugin 'junegunn/limelight.vim'
"Plugin 'terryma/vim-expand-region'
"Plugin 'jeetsukumaran/vim-buffergator'
"Plugin 'solarnz/thrift.vim'
"Plugin 'guns/xterm-color-table.vim'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'icholy/typescript-tools.git'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'salomvary/vim-eslint-compiler'
"Plugin 'itchyny/lightline.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'edkolev/tmuxline.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'skammer/vim-css-color'
"Plugin 'chrisgillis/vim-bootstrap3-snippets'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'chase/vim-ansible-yaml'


call vundle#end()

"Vundle ended so reenable filetypes
filetype plugin indent on

" Appearance
" ==========
"Syntax highlighting
" ==============
syntax on
syntax enable
"set term=xterm
"set term=xterm-256color
let g:webdevicons_enable = 1
"colorscheme material
colorscheme interstellar1
let g:airline_theme="atomic"
set t_Co=256

"set textwidth=80
"set columns=100
"let &colorcolumn="120,".join(range(120,335),",")


"Colorscheme custom
" ==============
"hi Normal ctermbg=NONE ctermfg=NONE
"hi LineNr ctermfg=grey ctermbg=NONE
"hi CursorLineNr ctermfg=grey ctermbg=235
"hi VertSplit ctermfg=237 ctermbg=NONE
"hi nonText ctermbg=NONE
"hi Folded ctermfg=238 ctermbg=NONE

" General Config
" ==============
set encoding=utf-8 nobomb " BOM often causes trouble
set number "line numbers relative
set relativenumber "line numbers relative
set showcmd " Show incomplete cmds down the bottom
set autoread " Reload files changed outside vim
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set ttyfast " Send more characters at a given time.
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set nolist " list disables linebreak
set hidden " hidden buffer helps to switch buffer without saving

" Search / replace
" ==============
set gdefault " By default add g flag to search/replace. Add g to toggle.
set ignorecase " Ignore case of searches.
set nohlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup

" Indentation and Display
" =======================
"set foldmethod=syntax
"set foldlevel=1
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
let maplocalleader = ","

"refresh vimrc
nmap <Leader>[ :so ~/.config/nvim/init.vim<CR>

nmap <Leader>t <C-t>
nmap <Leader>w :w<CR>

"cut copy paste
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p

"easy motion Leaderkey binding
map <Leader>e <Plug>(easymotion-prefix)

"quote word under cursor
nmap <Leader>" ciw"<C-r>""
nmap <Leader>' ciw'<C-r>"'

"Open visual mode
nmap <Leader><Leader> V

"switch split pane
nmap <Leader>s <C-w><C-w>

"correct indentation
vmap <Leader>i =

"select all
nmap <Leader>a ggVG

"open nerd tree
nmap <Leader>k :NERDTreeToggle<CR>

"open CtrlP
nmap <Leader>j :CtrlP<CR>

"next buffer
nmap <Leader>m :bn<CR>

"previous buffer
nmap <Leader>n :bp<CR>

"close buffer
nmap <Leader>d :bd<CR>

"next tab   
nmap <Leader>M :tabNext<CR>

"previous tab
nmap <Leader>N :tabprevious<CR>

"close tab
nmap <Leader>D :tabclose<CR>

"open config file
nmap <leader>r :e ~/.vimrc<CR>

"Vim + Ctags + Ctrlp
"nmap <leader>. :CtrlPTag<CR>

"Toggle QuickFix
nmap <leader>q :call QuickfixToggle()<CR>

"git status
nmap <leader>g :Gstatus\|only<CR>

nmap s <Plug>(easymotion-s)

imap jk <esc>
imap kj <esc>
vmap q <esc>

"page up
nmap <C-k> <C-u>

"page down
nmap <C-j> <C-d>

imap hh <C-y>,

"tabbing visual selection
vmap <Tab> >gv
vmap <S-Tab> <gv

"nnoremap <C-n> :call NumberToggle()<cr>

" remap arrow keys
nnoremap <Left> :tabnext<CR>
nnoremap <Right> :tabprev<CR>

"nnoremap L :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ==============
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"airline
set laststatus=2

"airline tabline
let g:airline#extensions#tabline#enabled = 1

"airline theme
"let g:airline_theme="bubblegum"

"airline separator
"
"
"
let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_symbols.branch = '⭠'

"let g:airline_left_sep=''
"let g:airline_right_sep=''

"snipmate trigger key
imap kk <Plug>snipMateNextOrTrigger
imap KK <Plug>snipMateBack 

"indentation lines
let g:indentLine_color_term = 236
let g:indentLine_char = '|'

"vertical spit symbol
set fillchars=vert:\│

"NERDTree custom glyph/icon 
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"Issues after re-sourcing vimrc
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
end

"for finding syntax of word under cursor:theme
"nmap <Leader>c :call <SID>SynStack()<CR>
"function! <SID>SynStack()
  "if !exists("*synstack")
    "return
  "endif
  "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

au BufRead,BufNewFile *.ts  setlocal filetype=typescript

if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview


let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

let g:NERDTreeWinSize=40

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

set backspace=indent,eol,start

"let g:vimrubocop_keymap = 0
"nmap <Leader>0 :RuboCop<CR>

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|node_modules)$'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

autocmd FileType javascript set formatprg=prettier\ --stdin


"vim-jedi python plugin keybindings
let g:jedi#completions_command = "<C-N>"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#usages_command = "<leader>u"
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#documentation_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

"disable airline keymaps
let g:airline#extensions#keymap#enabled = 0
