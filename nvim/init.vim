" Use vim rather than vi settings
" ===========
set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Plugins 
" ==============

"plugin
"airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"autocomplete
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

"explorer
Plug 'scrooloose/nerdtree'

"utils
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'

"snippets
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

"syntax
"Plug 'scrooloose/syntastic'
"Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'elzr/vim-json'
Plug 'reasonml-editor/vim-reason-plus'

"DevIcons
Plug 'ryanoasis/vim-webdevicons'

"git
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
Plug 'mileszs/ack.vim'

"colorschemes
Plug 'morhetz/gruvbox'

"live scratchpad
Plug 'metakirby5/codi.vim'
Plug 'jpalardy/vim-slime'

Plug 'isene/hyperlist.vim'

"fold
Plug 'pseewald/vim-anyfold'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"Plug 'neovimhaskell/haskell-vim'



"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['reason'] }
"Plug 'lifepillar/vim-mucomplete', {'for': ['reason']}
"Plug 'jordwalke/vim-reasonml', {'for': ['reason']}
"Plug 'reasonml-editor/vim-reason-plus'

call plug#end()

"coc language servers
let g:coc_global_extensions = ["coc-json", "coc-tsserver", "coc-python", "coc-css", "coc-yaml", "coc-highlight", "coc-prettier", "coc-clangd", "coc-go"]


filetype plugin indent on

"Syntax highlighting
syntax on
syntax enable
set termguicolors     " enable true colors support

let g:gruvbox_bold = '1'
let g:gruvbox_contrast_dark = "medium"
let g:webdevicons_enable = 1
colorscheme gruvbox

" General Config
" ==============
set encoding=utf-8 nobomb " BOM often causes trouble
set number "line numbers relative
set relativenumber "line numbers relative
set showcmd " Show incomplete cmds down the bottom
set autoread " Reload files changed outside vim
set scrolloff=30 " Start scrolling three lines before horizontal border of window.
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

" Better display for messages
set cmdheight=2

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

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

autocmd FileType nerdtree setlocal signcolumn=no


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

"open ag
nmap <Leader>l :Ag<CR>

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"easymotion
nmap s <Plug>(easymotion-s)

" bind K to grep word under cursor

imap jk <esc>
imap kj <esc>
vmap q <esc>

"page up
nmap <C-k> <C-u>

"page down
nmap <C-j> <C-d>

imap hh <C-y>,

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

"NERDTree
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeWinSize=30

"Issues after re-sourcing vimrc
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
end

"NERDTree colorscheme
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

"hi! EndOfBuffer ctermbg=22  ctermfg=2 guibg=22 guifg=2


"hi EndOfBuffer ctermfg=3  ctermfg=3

"for finding syntax of word under cursor:theme
nmap <Leader>c :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


"coc completion
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"coc navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



"coc show doc
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:indentLine_concealcursor=""

"coc prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"debug nvim
let $NVIM_NODE_LOG_FILE='nvim-node.log'

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}



" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Fugitive Conflict Resolution
"nnoremap <leader>gd :Gvdiff<CR>
"nnoremap gdh :diffget //2<CR>
"nnoremap gdl :diffget //3<CR>


"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"command! IntlTag :s/>/>{t("/g | :s/<\//")}<\/
"command! IntlTag :'<,'>!sed -n 's/>\(.*\)<\//>{t("\1")}<\//p'

"let g:mucomplete#can_complete = {}
"let g:mucomplete#enable_auto_at_startup = 1
"let g:mucomplete#chains = {'default': ['omni']}

let g:deoplete#enable_at_startup = 1


set timeoutlen=500
