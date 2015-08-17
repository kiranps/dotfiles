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
"Plugin 'digitaltoad/vim-jade'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
"Plugin 'skammer/vim-css-color'
Plugin 'ervandew/supertab'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'chrisgillis/vim-bootstrap3-snippets'
"Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'elzr/vim-json'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'szw/vim-tags'
Plugin 'ryanoasis/vim-webdevicons'
"Plugin 'chase/vim-ansible-yaml'
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
set term=xterm-256color
let g:webdevicons_enable = 1
colorscheme material

"Colorscheme custom
" ==============
"hi LineNr ctermfg=grey ctermbg=8
hi LineNr ctermfg=grey
hi LineNr ctermbg=8
hi VertSplit ctermfg=237 ctermbg=NONE
hi nonText ctermbg=NONE
hi MyGroup cterm=bold
match MyGroup /./
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

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
set hidden " hidden buffer helps to switch buffer without saving

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

nmap <Leader>o <C-]>
nmap <Leader>t <C-t>

nmap <Leader>w :w<CR>

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

"quote word under cursor
nmap <Leader>" ciw"<C-r>""
nmap <Leader>' ciw'<C-r>"'
imap <Leader>" ciw"<C-r>""
imap <Leader>' ciw'<C-r>"'

"quote selected text
vmap <Leader>" di"<C-r>""
vmap <Leader>' di'<C-r>"'


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

"Vim + Ctags + Ctrlp
nmap <leader>. :CtrlPTag<cr>

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

"NERDTree File highlighting
hi NERDTreePart ctermfg=8
hi NERDTreePartFile ctermfg=8
hi NERDTreeDirSlash ctermfg=8
hi NERDTreeDir ctermfg=250
hi NERDTreeOpenable ctermfg=240
hi NERDTreeClosable ctermfg=240

"exec 'autocmd FileType nerdtree syn match js ##'
"exec 'autocmd FileType nerdtree highlight ' . 'js' .' ctermbg='. 'NONE' . ' ctermfg='. '3' .' guibg='. '#ffa500' .' guifg='. '#151515' 
"exec 'autocmd FileType nerdtree syn match js #  \[   \]#'

"let s:devicon = {
            "\ 'html': '',
            "\ 'css': '',
            "\ 'js': '',
            "\ 'rb': ''}

"function! s:NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    "let icon = get(s:file_node_extensions , a:extension)
    "exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    "exec 'autocmd FileType nerdtree syn match ' . a:extension . ' #^.*\[' . icon . '   \]#'
"endfunction

"call s:NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call s:NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call s:NERDTreeHighlightFile('js', 'cyan', 'none', '#ffa500', '#151515')
"call s:NERDTreeHighlightFile('rb', 'red', 'none', '#ffa500', '#151515')




"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    "exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    "exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')


let s:file_node_extensions = {
		\	'html'     : '',
		\	'css'      : '',
		\	'js'       : '',
		\	'rb'       : '',
		\	'psb'      : ''
	\}


"function! s:NERDTreeWebDevIconsSyntaxHighlighter()
  "for [key, val] in items(s:file_node_extensions)
    "exec 'autocmd filetype nerdtree syn match ' . 'NERDTree' . key . ' #^.*\[' . val . '.*\]#'
    "echo 'autocmd filetype nerdtree syn match ' . 'NERDTree' . key . ' #^.*\[' . val . '.*\]#'
  "endfor
"endfunction

"call s:NERDTreeWebDevIconsSyntaxHighlighter()

"function! NERDTreeHighlightDevIcons(extension, fg, bg, guifg, guibg)
    "exec 'autocmd FileType nerdtree highlight ' . 'NERDTree' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"endfunction

"call NERDTreeHighlightDevIcons('html', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightDevIcons('js', 'cyan', 'none', 'green', '#151515')
"call NERDTreeHighlightDevIcons('css', 'yellow', 'none', 'green', '#151515')
"call NERDTreeHighlightDevIcons('rb', 'red', 'none', 'green', '#151515')

"NERDTree custom glyph/icon 
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


"Issues after re-sourcing vimrc
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
end
