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
hi Normal            ctermfg=253     ctermbg=8
hi SpecialKey        ctermfg=11      ctermbg=bg
hi NonText           ctermfg=bg
hi Directory         ctermfg=2       ctermbg=bg
hi ErrorMsg          ctermfg=1       ctermbg=bg
hi IncSearch         ctermfg=1       ctermbg=236       cterm=NONE
hi Search            ctermfg=1       ctermbg=236       cterm=NONE
hi MoreMsg           ctermfg=fg      ctermbg=bg
hi ModeMsg           ctermfg=fg      ctermbg=bg
hi LineNr            ctermfg=245
hi CursorLineNr      ctermfg=250     ctermbg=236
hi Question          ctermfg=1       ctermbg=bg
hi StatusLine        ctermfg=fg      ctermbg=236       cterm=NONE
hi StatusLineNC      ctermfg=236     ctermbg=236
hi VertSplit         ctermfg=236                       cterm=NONE
hi Title             ctermfg=1       ctermbg=bg
hi Visual            ctermfg=255     ctermbg=236
hi VisualNOS         ctermfg=0       ctermbg=bg
hi WarningMsg        ctermfg=11      ctermbg=bg
hi WildMenu          ctermfg=236     ctermbg=fg
hi Folded            ctermfg=238     ctermbg=bg
hi FoldColumn        ctermfg=bg      ctermbg=bg
hi Pmenu             ctermfg=249     ctermbg=235
hi PmenuSel          ctermfg=255     ctermbg=236
hi PmenuSbar                         ctermbg=236
hi PmenuThumb                        ctermbg=239
hi CursorLine        ctermfg=fg      ctermbg=235       cterm=NONE
hi SignColumn        ctermfg=1       ctermbg=bg
hi Conceal           ctermfg=1       ctermbg=bg
hi SpellBad          ctermfg=fg      ctermbg=9
hi SpellCap          ctermfg=fg      ctermbg=9
hi SpellRare         ctermfg=fg      ctermbg=9
hi SpellLocal        ctermfg=fg      ctermbg=9
hi DiffAdd           ctermfg=2       ctermbg=bg
hi DiffChange        ctermfg=3       ctermbg=bg
hi DiffDelete        ctermfg=1       ctermbg=bg
hi DiffText          ctermfg=fg      ctermbg=bg
hi ColorColumn                       ctermbg=235
hi CursorColumn                      ctermbg=235
hi TabLine           ctermfg=250     ctermbg=236
hi TabLineSel        ctermfg=236     ctermbg=250
hi TabLineFill                       ctermbg=236

hi Boolean           ctermfg=5       ctermbg=bg
hi Character         ctermfg=1       ctermbg=bg
hi Comment           ctermfg=242     ctermbg=bg
hi Conditional       ctermfg=9       ctermbg=bg
hi Constant          ctermfg=13      ctermbg=bg
hi Debug             ctermfg=1       ctermbg=bg
hi Define            ctermfg=9       ctermbg=bg
hi Delimiter         ctermfg=fg      ctermbg=bg
hi Error             ctermfg=fg      ctermbg=1
hi Exception         ctermfg=1       ctermbg=bg
hi Float             ctermfg=5       ctermbg=bg
hi Function          ctermfg=6       ctermbg=bg
hi Identifier        ctermfg=6       ctermbg=bg
hi Ignore            ctermfg=1       ctermbg=bg
hi Include           ctermfg=9       ctermbg=bg
hi Keyword           ctermfg=1       ctermbg=bg
hi Label             ctermfg=1       ctermbg=bg
hi Macro             ctermfg=1       ctermbg=bg
hi MatchParen        ctermfg=1       ctermbg=238
hi Number            ctermfg=5       ctermbg=bg
hi Operator          ctermfg=15      ctermbg=bg
hi PreCondit         ctermfg=1       ctermbg=bg
hi PreProc           ctermfg=1       ctermbg=bg
hi Repeat            ctermfg=1       ctermbg=bg
hi Special           ctermfg=1       ctermbg=bg
hi SpecialChar       ctermfg=1       ctermbg=bg
hi SpecialComment    ctermfg=1       ctermbg=bg
hi Statement         ctermfg=9       ctermbg=bg
hi StorageClass      ctermfg=1       ctermbg=bg
hi String            ctermfg=11      ctermbg=bg
hi Structure         ctermfg=9       ctermbg=bg
hi Tag               ctermfg=11      ctermbg=7
hi Todo              ctermfg=255     ctermbg=236
hi Type              ctermfg=12      ctermbg=bg
hi Typedef           ctermfg=1       ctermbg=bg
hi Underlined        ctermfg=4       ctermbg=bg
" }}}

" NERDTree File highlighting {{{
hi NERDTreePart            ctermfg=bg
hi NERDTreePartFile        ctermfg=bg
hi NERDTreeDirSlash        ctermfg=bg
hi NERDTreeFile            ctermfg=250
hi NERDTreeDir             ctermfg=250
hi NERDTreeOpenable        ctermfg=bg
hi NERDTreeClosable        ctermfg=bg
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

" Ruby"{{{
"hi rubyLocalVariableOrMethod    ctermfg=12      ctermbg=bg
"hi rubyBlock ctermfg=12      ctermbg=bg
"hi rubyCurlyBlock ctermfg=12      ctermbg=bg
"hi rubyConditionalExpression ctermfg=7       ctermbg=bg
"}}}
"
" JSON {{{
hi jsonNoQuotes ctermfg=fg  ctermbg=bg
hi jsonStringSQ ctermfg=fg  ctermbg=bg
hi jsonBoolean  ctermfg=4  
hi jsonBraces   ctermfg=11
hi jsonString   ctermfg=15

hi jsonEscape   ctermfg=1
hi jsonNumber   ctermfg=1
hi jsonNumError ctermfg=1
hi jsonNull     ctermfg=1

"}}}



" vim:foldmethod=marker
