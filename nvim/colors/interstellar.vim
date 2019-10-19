"            ____      __                 __       ____          
"           /  _/___  / /____  __________/ /____  / / /___ ______
"           / // __ \/ __/ _ \/ ___/ ___/ __/ _ \/ / / __ `/ ___/
"         _/ // / / / /_/  __/ /  (__  ) /_/  __/ / / /_/ / /    
"        /___/_/ /_/\__/\___/_/  /____/\__/\___/_/_/\__,_/_/ 
" Author: Kiran P S  <pskirann@gmail.com>
" Colorscheme: interstellar

" Preamble {{{
if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif
hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let colors_name = "interstellar"
" }}}

" General/UI {{{
" Colors for Normal are known as fg and bg so set it first
hi Normal        ctermfg=253   ctermbg=234
hi NonText       ctermfg=bg                                  " blank line tidle
hi LineNr        ctermfg=245                                 " line number
hi CursorLine    ctermfg=fg    ctermbg=235  cterm=NONE       " higlight current line if set 
hi CursorLineNr  ctermfg=250   ctermbg=236                   " line number current 
hi VertSplit     ctermfg=236   cterm=NONE                    " vertical split bar color
hi Folded        ctermfg=238   ctermbg=bg                    " code folding
hi FoldColumn        ctermfg=bg      ctermbg=bg
hi MatchParen    ctermfg=1     ctermbg=238                   " match brackets
hi Visual        ctermfg=255   ctermbg=236                   " selection
hi IncSearch     ctermfg=1     ctermbg=236  cterm=NONE       " search dynamic
hi Search        ctermfg=1     ctermbg=236  cterm=NONE       " search
hi ErrorMsg      ctermfg=1     ctermbg=bg
hi WarningMsg    ctermfg=11    ctermbg=bg
hi MoreMsg       ctermfg=fg    ctermbg=bg                    " hi More word
hi Question      ctermfg=1     ctermbg=bg
hi Directory     ctermfg=2     ctermbg=bg                    " see :hi
hi StatusLine    ctermfg=fg    ctermbg=236 cterm=NONE
hi StatusLineNC  ctermfg=236   ctermbg=236
hi WildMenu      ctermfg=236   ctermbg=fg
hi Underlined    ctermfg=4     ctermbg=bg
hi Tag           ctermfg=11    ctermbg=bg                    " you can use CTRL-] on this
hi Error         ctermfg=fg    ctermbg=1 
hi Todo          ctermfg=fg    ctermbg=7
hi SpecialKey    ctermfg=11    ctermbg=bg
hi VisualNOS     ctermfg=0     ctermbg=bg  
hi Title         ctermfg=1     ctermbg=bg cterm=NONE         " --- Options ---
hi Pmenu         ctermfg=249   ctermbg=235
hi PmenuSel      ctermfg=255   ctermbg=236
hi PmenuSbar                   ctermbg=236
hi PmenuThumb                  ctermbg=239
hi ModeMsg       ctermfg=fg    ctermbg=bg
hi DiffAdd       ctermfg=2     ctermbg=bg
hi DiffChange    ctermfg=3     ctermbg=bg
hi DiffDelete    ctermfg=1     ctermbg=bg
hi DiffText      ctermfg=fg    ctermbg=bg
hi ColorColumn                 ctermbg=235

"I don't know what these things are
hi Cursor        ctermfg=1        ctermbg=1 
hi CursorIm      ctermfg=1        ctermbg=1


hi TabLine       ctermfg=1        ctermbg=1
hi TabLineFill   ctermfg=1        ctermbg=1  
hi TabLineSel    ctermfg=1        ctermbg=1  

" }}}

" NERDTree File highlighting {{{
hi NERDTreePart            ctermfg=bg
hi NERDTreePartFile        ctermfg=bg
hi NERDTreeDirSlash        ctermfg=bg
hi NERDTreeFile            ctermfg=250
hi NERDTreeDir             ctermfg=250
hi NERDTreeOpenable        ctermfg=250
hi NERDTreeClosable        ctermfg=250
hi NERDTreeUp              ctermfg=250
hi NERDTreeHelpKey         ctermfg=250
hi NERDTreeHelpTitle       ctermfg=250
hi NERDTreeHelpCommand     ctermfg=250
hi NERDTreeHelp            ctermfg=250
hi NERDTreeRO              ctermfg=250
hi NERDTreeExecFile        ctermfg=250
hi NERDTreeLink            ctermfg=250
hi NERDTreeLinkDir         ctermfg=250
hi NERDTreeCWD             ctermfg=250
hi NERDTreeCurrentNode     ctermfg=1     ctermbg=1               
"}}}

" vim:foldmethod=marker
