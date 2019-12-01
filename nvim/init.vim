" Use vim rather than vi settings
" ===========
set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Plugins 
" ==============

<<<<<<< HEAD
"plugin
Plug 'gmarik/vundle'

"airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"autocomplete
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"explorer
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'

"utils
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

"snippets
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

"syntax
Plug 'scrooloose/syntastic'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'ryanoasis/vim-webdevicons'
Plug 'mxw/vim-jsx'

"git
Plug 'tpope/vim-fugitive'

"language
"typescript
Plug 'Quramy/tsuquyomi'

Plug 'reasonml-editor/vim-reason-plus'

"format
Plug 'psf/black'
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

"colorschemes
Plug 'morhetz/gruvbox'

"tmp

call plug#end()


"reason languge server
let g:LanguageClient_serverCommands = {
            \ 'reason': ['/Users/shuttl/bin/rls-macos/reason-language-server'],
            \ }


"
=======
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
>>>>>>> 0ba3442774a77aeee94fc8bd3ff8feb1e6b56760
filetype plugin indent on

"Syntax highlighting
syntax on
syntax enable
"set t_Co=256
"set termguicolors     " enable true colors support

let g:gruvbox_bold = '1'
let g:gruvbox_contrast_dark = "hard"
let g:webdevicons_enable = 1
colorscheme gruvbox


"Colorscheme custom
" ==============
"hi Normal ctermbg=NONE ctermfg=NONE
"hi CursorLineNr ctermfg=grey ctermbg=235
"hi VertSplit ctermfg=237 ctermbg=NONE
"hi NonText ctermbg=NONE
hi NonText ctermfg=bg
"hi Folded ctermfg=238 ctermbg=NONE

"custom theme
"hi LineNr ctermfg=grey ctermbg=NONE
"hi vimContinue ctermbg=bg
"hi Pmenu
"hi PmenuSel
"hi PmenuSbar
"hi PmenuThumb

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

"ctrl-j and ctrl-k bindings to the up and down arrow keys
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"disable easymotion mappings
let g:EasyMotion_do_mapping=0

"set leader key as space
let mapleader = "\<Space>"
let maplocalleader = ","

"refresh vimrc
nmap <Leader>[ :so ~/.config/nvim/init.vim<CR>

<<<<<<< HEAD
"write file
=======
nmap <Leader>t <C-t>
>>>>>>> 0ba3442774a77aeee94fc8bd3ff8feb1e6b56760
nmap <Leader>w :w<CR>

"cut copy paste
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p

"quote word under cursor
nmap <Leader>" ciw"<C-r>""
nmap <Leader>' ciw'<C-r>"'

"Open visual mode
nmap <Leader><Leader> V

"switch split pane
nmap <Leader>s <C-w><C-w>

"select all
nmap <Leader>a ggVG

"open nerd tree
nmap <Leader>k :NERDTreeToggle<CR>

"open fuzzy search
nmap <Leader>j :FZF<CR>

"next buffer
nmap <Leader>m :bn<CR>

"previous buffer
nmap <Leader>n :bp<CR>

"close buffer
nmap <Leader>d :bd<CR>

<<<<<<< HEAD
=======
"next tab   
nmap <Leader>M :tabNext<CR>

"previous tab
nmap <Leader>N :tabprevious<CR>

"close tab
nmap <Leader>D :tabclose<CR>

>>>>>>> 0ba3442774a77aeee94fc8bd3ff8feb1e6b56760
"open config file
nmap <leader>r :e $MYVIMRC<CR>

"Toggle QuickFix
nmap <leader>q :call QuickfixToggle()<CR>

"git status
nmap <leader>g :Gstatus\|only<CR>

"easymotion
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
"vmap <Tab> >gv
"vmap <S-Tab> <gv


"airline
set laststatus=2
let g:airline_theme="base16_grayscale"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''


"indentation lines
let g:indentLine_char = '|'

"vertical spit symbol
set fillchars=vert:\│

<<<<<<< HEAD
"open quickfix
=======
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


>>>>>>> 0ba3442774a77aeee94fc8bd3ff8feb1e6b56760
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


set backspace=indent,eol,start

<<<<<<< HEAD
=======
"let g:vimrubocop_keymap = 0
"nmap <Leader>0 :RuboCop<CR>

>>>>>>> 0ba3442774a77aeee94fc8bd3ff8feb1e6b56760
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"format on save
autocmd FileType javascript set formatprg=prettier\ --stdin
<<<<<<< HEAD
"autocmd BufWritePre *.re ReasonPrettyPrint

"NERDTree
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeWinSize=30

"Issues after re-sourcing vimrc
"if exists("g:loaded_webdevicons")
    "call webdevicons#refresh()
"end

"hi NERDTreePart            ctermfg=bg
"hi NERDTreePartFile        ctermfg=bg
hi NERDTreeDirSlash        ctermfg=bg
"hi NERDTreeFile            ctermfg=bg
hi NERDTreeDir             ctermfg=fg
hi NERDTreeOpenable        ctermfg=bg
hi NERDTreeClosable        ctermfg=bg
"hi NERDTreeUp              ctermfg=250
"hi NERDTreeHelpKey         ctermfg=250
"hi NERDTreeHelpTitle       ctermfg=250
"hi NERDTreeHelpCommand     ctermfg=250
hi NERDTreeHelp            ctermfg=bg
"hi NERDTreeRO              ctermfg=250
"hi NERDTreeExecFile        ctermfg=250
"hi NERDTreeLink            ctermfg=250
"hi NERDTreeLinkDir         ctermfg=250
hi NERDTreeCWD             ctermfg=fg
"hi NERDTreeCurrentNode     ctermfg=1     ctermbg=1               
hi NERDTreeFlags           ctermfg=fg

"for finding syntax of word under cursor:theme
nmap <Leader>c :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"python config
let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0
let g:syntastic_python_checkers=['mypy']

nnoremap <Leader>8 :call jedi#goto_definitions()<cr>
nnoremap <Leader>u :call jedi#usages()<cr>



"start autocomple engine
let g:deoplete#enable_at_startup = 1
imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd CompleteDone * silent! pclose!

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
=======


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
>>>>>>> 0ba3442774a77aeee94fc8bd3ff8feb1e6b56760
" ===========
set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Plugins 
" ==============

"plugin
Plug 'gmarik/vundle'

"airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"autocomplete
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"explorer
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'

"utils
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

"snippets
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

"syntax
Plug 'scrooloose/syntastic'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'ryanoasis/vim-webdevicons'
Plug 'mxw/vim-jsx'

"git
Plug 'tpope/vim-fugitive'

"language
"typescript
Plug 'Quramy/tsuquyomi'

Plug 'reasonml-editor/vim-reason-plus'

"format
Plug 'psf/black'
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

"colorschemes
Plug 'morhetz/gruvbox'

"tmp

call plug#end()


"reason languge server
let g:LanguageClient_serverCommands = {
            \ 'reason': ['/Users/shuttl/bin/rls-macos/reason-language-server'],
            \ }


"
filetype plugin indent on

"Syntax highlighting
syntax on
syntax enable
"set t_Co=256
"set termguicolors     " enable true colors support

let g:gruvbox_bold = '1'
let g:gruvbox_contrast_dark = "hard"
let g:webdevicons_enable = 1
colorscheme gruvbox


"Colorscheme custom
" ==============
"hi Normal ctermbg=NONE ctermfg=NONE
"hi CursorLineNr ctermfg=grey ctermbg=235
"hi VertSplit ctermfg=237 ctermbg=NONE
"hi NonText ctermbg=NONE
hi NonText ctermfg=bg
"hi Folded ctermfg=238 ctermbg=NONE

"custom theme
"hi LineNr ctermfg=grey ctermbg=NONE
"hi vimContinue ctermbg=bg
"hi Pmenu
"hi PmenuSel
"hi PmenuSbar
"hi PmenuThumb

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

"ctrl-j and ctrl-k bindings to the up and down arrow keys
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"disable easymotion mappings
let g:EasyMotion_do_mapping=0

"set leader key as space
let mapleader = "\<Space>"
let maplocalleader = ","

"refresh vimrc
nmap <Leader>[ :so $MYVIMRC<CR>

"write file
nmap <Leader>w :w<CR>

"cut copy paste
vmap <Leader>y "+y
nmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p

"quote word under cursor
nmap <Leader>" ciw"<C-r>""
nmap <Leader>' ciw'<C-r>"'

"Open visual mode
nmap <Leader><Leader> V

"switch split pane
nmap <Leader>s <C-w><C-w>

"select all
nmap <Leader>a ggVG

"open nerd tree
nmap <Leader>k :NERDTreeToggle<CR>

"open fuzzy search
nmap <Leader>j :FZF<CR>

"next buffer
nmap <Leader>m :bn<CR>

"previous buffer
nmap <Leader>n :bp<CR>

"close buffer
nmap <Leader>d :bd<CR>

"open config file
nmap <leader>r :e $MYVIMRC<CR>

"Toggle QuickFix
nmap <leader>q :call QuickfixToggle()<CR>

"git status
nmap <leader>g :Gstatus\|only<CR>

"easymotion
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
"vmap <Tab> >gv
"vmap <S-Tab> <gv


"airline
set laststatus=2
let g:airline_theme="base16_grayscale"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''


"indentation lines
let g:indentLine_char = '|'

"vertical spit symbol
set fillchars=vert:\│

"open quickfix
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


set backspace=indent,eol,start

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"format on save
autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.re ReasonPrettyPrint

"NERDTree
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeWinSize=30

"Issues after re-sourcing vimrc
"if exists("g:loaded_webdevicons")
    "call webdevicons#refresh()
"end

"hi NERDTreePart            ctermfg=bg
"hi NERDTreePartFile        ctermfg=bg
hi NERDTreeDirSlash        ctermfg=bg
"hi NERDTreeFile            ctermfg=bg
hi NERDTreeDir             ctermfg=fg
hi NERDTreeOpenable        ctermfg=bg
hi NERDTreeClosable        ctermfg=bg
"hi NERDTreeUp              ctermfg=250
"hi NERDTreeHelpKey         ctermfg=250
"hi NERDTreeHelpTitle       ctermfg=250
"hi NERDTreeHelpCommand     ctermfg=250
hi NERDTreeHelp            ctermfg=bg
"hi NERDTreeRO              ctermfg=250
"hi NERDTreeExecFile        ctermfg=250
"hi NERDTreeLink            ctermfg=250
"hi NERDTreeLinkDir         ctermfg=250
hi NERDTreeCWD             ctermfg=fg
"hi NERDTreeCurrentNode     ctermfg=1     ctermbg=1               
hi NERDTreeFlags           ctermfg=fg

"for finding syntax of word under cursor:theme
nmap <Leader>c :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"python config
let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0
let g:syntastic_python_checkers=['mypy']

nnoremap <Leader>8 :call jedi#goto_definitions()<cr>
nnoremap <Leader>u :call jedi#usages()<cr>



"start autocomple engine
let g:deoplete#enable_at_startup = 1
imap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd CompleteDone * silent! pclose!

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
