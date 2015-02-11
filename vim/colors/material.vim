"                            __            _       __
"           ____ ___  ____ _/ /____  _____(_)___ _/ /
"          / __ `__ \/ __ `/ __/ _ \/ ___/ / __ `/ / 
"         / / / / / / /_/ / /_/  __/ /  / / /_/ / /  
"        /_/ /_/ /_/\__,_/\__/\___/_/  /_/\__,_/_/   
"
" Author: Kiran P S  <pskirann@gmail.com>
" Colorscheme: material
" 
" this colorscheme is inspired from badwolf and material design color pallete
"
" }}}

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
  finish
endif

hi clear

set background=dark

if exists("syntax_on")
  syntax reset
endif

let colors_name = "material"

" }}}
" Palette {{{

let s:mlc = {}

let s:mlc.black              = ['ffffff', 239]
let s:mlc.white              = ['E8ECED', 253]

let s:mlc.indigo             = ['3F51B5', 0]
let s:mlc.red                = ['F44336', 1]
let s:mlc.green              = ['4CAF50', 2]
let s:mlc.yellow             = ['FFEB3B', 3]
let s:mlc.blue               = ['2196F3', 4]
let s:mlc.purple             = ['9C27B0', 5]
let s:mlc.cyan               = ['00BCD4', 6]
let s:mlc.brown              = ['795548', 7]
let s:mlc.pink               = ['E91E63', 8]
let s:mlc.bluegrey           = ['607D8B', 9]
let s:mlc.light_green        = ['8BC34A', 10]
let s:mlc.amber              = ['FFC107', 11]
let s:mlc.lime               = ['CDDC39', 12]
let s:mlc.orange             = ['FF9800', 13]
let s:mlc.teal               = ['009688', 14]
let s:mlc.deeporange         = ['FF5722', 15]

let s:mlc.brightgravel       = ['d9cec3', 252]
let s:mlc.lightgravel        = ['998f84', 245]
let s:mlc.gravel             = ['857f78', 243]
let s:mlc.mediumgravel       = ['666462', 241]
let s:mlc.deepgravel         = ['45413b', 238]
let s:mlc.deepergravel       = ['35322d', 236]
let s:mlc.darkgravel         = ['242321', 235]
let s:mlc.blackgravel        = ['1c1b1a', 233]
let s:mlc.blackestgravel     = ['141413', 232]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  let histring = 'hi ' . a:group . ' '

  if strlen(a:fg)
    if a:fg == 'fg'
      let histring .= 'guifg=fg ctermfg=fg '
    else
      let c = get(s:mlc, a:fg)
      let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
    endif
  endif

  if a:0 >= 1 && strlen(a:1)
    if a:1 == 'bg'
      let histring .= 'guibg=bg ctermbg=bg '
    else
      let c = get(s:mlc, a:1)
      let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
    endif
  endif

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let c = get(s:mlc, a:3)
    let histring .= 'guisp=#' . c[0] . ' '
  endif

  " echom histring

  execute histring
endfunction
" }}}
" Configuration Options {{{

" None, you bitches!

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal',       'white',        'blackgravel')

call s:HL('Folded',       'mediumgravel', 'bg',          'none')

call s:HL('VertSplit',    'lightgravel',  'bg',          'none')

call s:HL('CursorLine',   '',             'darkgravel',  'none')
call s:HL('CursorColumn', '',             'darkgravel')
call s:HL('ColorColumn',  '',             'darkgravel')

call s:HL('TabLine',      'white',        'blackgravel', 'none')
call s:HL('TabLineFill',  'white',        'blackgravel', 'none')
call s:HL('TabLineSel',   'black',         'blue',      'none')

call s:HL('MatchParen',   'amber',    'darkgravel',  'bold')

call s:HL('NonText',      'deepgravel',   'bg')
call s:HL('SpecialKey',   'deepgravel',   'bg')

call s:HL('Visual',       '',             'deepgravel')
call s:HL('VisualNOS',    '',             'deepgravel')

call s:HL('Search',       'black',         'amber',   'bold')
call s:HL('IncSearch',    'black',         'blue',      'bold')

call s:HL('Underlined',   'fg',           '',            'underline')

call s:HL('StatusLine',   'black',         'blue',      'bold')
call s:HL('StatusLineNC', 'white',         'deepgravel',  'bold')

call s:HL('Directory',    'orange',  '',            'bold')

call s:HL('Title',        'yellow')

call s:HL('ErrorMsg',     'red',        'bg',          'bold')
call s:HL('MoreMsg',      'amber',    '',            'bold')
call s:HL('ModeMsg',      'orange',  '',            'bold')
call s:HL('Question',     'orange',  '',            'bold')
call s:HL('WarningMsg',   'teal',        '',            'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call s:HL('LineNr',     'mediumgravel', 'blackgravel')
call s:HL('SignColumn', '',             'blackgravel')
call s:HL('FoldColumn', 'mediumgravel', 'blackgravel')

" }}}
" Cursor {{{

call s:HL('Cursor',  'black', 'blue', 'bold')
call s:HL('vCursor', 'black', 'blue', 'bold')
call s:HL('iCursor', 'black', 'blue', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'white')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gravel')
call s:HL('Todo',           'white', 'bg', 'bold')
call s:HL('SpecialComment', 'white', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'orange')

" Control flow stuff is red.
call s:HL('Statement',   'red', '', 'bold')
call s:HL('Keyword',     'red', '', 'bold')
call s:HL('Conditional', 'red', '', 'bold')
call s:HL('Operator',    'red', '', 'none')
call s:HL('Label',       'red', '', 'none')
call s:HL('Repeat',      'red', '', 'none')

" Functions and variable declarations are orange, because white looks weird.
call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function',   'orange', '', 'none')

" Preprocessor stuff is yellow, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'yellow', '', 'none')
call s:HL('Macro',     'yellow', '', 'none')
call s:HL('Define',    'yellow', '', 'none')
call s:HL('PreCondit', 'yellow', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'deeporange', '', 'bold')
call s:HL('Character', 'deeporange', '', 'bold')
call s:HL('Boolean',   'deeporange', '', 'bold')

call s:HL('Number',    'deeporange', '', 'bold')
call s:HL('Float',     'deeporange', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'teal', '', 'bold')

call s:HL('Type',         'teal', '', 'none')
call s:HL('StorageClass', 'red', '', 'none')
call s:HL('Structure',    'red', '', 'none')
call s:HL('Typedef',      'red', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'yellow', '', 'bold')

" Misc
call s:HL('Error',  'white',   'red', 'bold')
call s:HL('Debug',  'white',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu',      'white',        'deepergravel')
call s:HL('PmenuSel',   'black',         'blue',       'bold')
call s:HL('PmenuSbar',  '',             'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'black', 'black')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'white', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap',   'amber', 'bg', 'undercurl,bold', 'amber')
    call s:HL('SpellBad',   '',          'bg', 'undercurl',      'amber')
    call s:HL('SpellLocal', '',          '',   'undercurl',      'amber')
    call s:HL('SpellRare',  '',          '',   'undercurl',      'amber')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

  " the message when no match is found
  call s:HL('CtrlPNoEntries', 'white', 'red', 'bold')

  " the matched pattern
  call s:HL('CtrlPMatch', 'orange', 'bg', 'none')

  " the line prefix '>' in the match window
  call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

  " the prompt’s base
  call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

  " the prompt’s text
  call s:HL('CtrlPPrtText', 'white', 'bg', 'none')

  " the prompt’s cursor when moving over the text
  call s:HL('CtrlPPrtCursor', 'black', 'blue', 'bold')

  " 'prt' or 'win', also for 'regex'
  call s:HL('CtrlPMode1', 'black', 'blue', 'bold')

  " 'file' or 'path', also for the local working dir
  call s:HL('CtrlPMode2', 'black', 'blue', 'bold')

  " the scanning status
  call s:HL('CtrlPStats', 'black', 'blue', 'bold')

  " TODO: CtrlP extensions.
  " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
  " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
  " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
  " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
  " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'blue',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'black', 'orange')
call s:HL('InterestingWord2', 'black', 'yellow')
call s:HL('InterestingWord3', 'black', 'green')
call s:HL('InterestingWord4', 'black', 'deeporange')
call s:HL('InterestingWord5', 'black', 'teal')
call s:HL('InterestingWord6', 'black', 'red')


" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=black guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'blue', 'blackgravel')
call s:HL('ShowMarksHLu', 'blue', 'blackgravel')
call s:HL('ShowMarksHLo', 'blue', 'blackgravel')
call s:HL('ShowMarksHLm', 'blue', 'blackgravel')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call s:HL('clojureSpecial',  'red',       '', '')
call s:HL('clojureDefn',     'red',       '', '')
call s:HL('clojureDefMacro', 'red',       '', '')
call s:HL('clojureDefine',   'red',       '', '')
call s:HL('clojureMacro',    'red',       '', '')
call s:HL('clojureCond',     'red',       '', '')

call s:HL('clojureKeyword',  'orange',      '', 'none')

call s:HL('clojureFunc',     'teal',       '', 'none')
call s:HL('clojureRepeat',   'teal',       '', 'none')

call s:HL('clojureParen0',   'lightgravel', '', 'none')

call s:HL('clojureAnonArg',  'white',        '', 'bold')

" }}}
" CSS {{{

call s:HL('cssColorProp',            'orange', '', 'none')
call s:HL('cssBoxProp',              'orange', '', 'none')
call s:HL('cssTextProp',             'orange', '', 'none')
call s:HL('cssRenderProp',           'orange', '', 'none')
call s:HL('cssGeneratedContentProp', 'orange', '', 'none')

call s:HL('cssValueLength',          'deeporange',      '', 'bold')
call s:HL('cssColor',                'deeporange',      '', 'bold')
call s:HL('cssBraces',               'lightgravel', '', 'none')
call s:HL('cssIdentifier',           'orange',      '', 'bold')
call s:HL('cssClassName',            'orange',      '', 'none')

" }}}
" Diff {{{

call s:HL('gitDiff',     'lightgravel', '',)

call s:HL('diffRemoved', 'teal',       '',)
call s:HL('diffAdded',   'yellow',        '',)
call s:HL('diffFile',    'black',        'red',  'bold')
call s:HL('diffNewFile', 'black',        'red',  'bold')

call s:HL('diffLine',    'black',        'orange', 'bold')
call s:HL('diffSubname', 'orange',      '',       'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'orange', '',)
call s:HL('djangoTagBlock', 'orange',      '')
call s:HL('djangoVarBlock', 'orange',      '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'white', 'bg', 'none')
call s:HL('htmlEndTag', 'white', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'pink', '', 'bold')
call s:HL('htmlSpecialTagName', 'pink', '', 'bold')
"call s:HL('htmlSpecialChar',    'yellow',   '', 'none')
call s:HL('htmlSpecialChar',    'pink',   '', 'none')

" Attributes
call s:HL('htmlArg', 'green', '', 'none')

" Stuff inside an <a> tag

call s:HL('htmlLink', 'blue', '', 'underline')

" }}}
" Java {{{

call s:HL('javaClassDecl',    'red',     '', 'bold')
call s:HL('javaScopeDecl',    'red',     '', 'bold')
call s:HL('javaCommentTitle', 'gravel',    '')
call s:HL('javaDocTags',      'white',      '', 'none')
call s:HL('javaDocParam',     'amber', '', '')

" }}}
" LaTeX {{{

call s:HL('texStatement',   'blue',       '', 'none')
call s:HL('texMathZoneX',   'orange',       '', 'none')
call s:HL('texMathZoneA',   'orange',       '', 'none')
call s:HL('texMathZoneB',   'orange',       '', 'none')
call s:HL('texMathZoneC',   'orange',       '', 'none')
call s:HL('texMathZoneD',   'orange',       '', 'none')
call s:HL('texMathZoneE',   'orange',       '', 'none')
call s:HL('texMathZoneV',   'orange',       '', 'none')
call s:HL('texMathZoneX',   'orange',       '', 'none')
call s:HL('texMath',        'orange',       '', 'none')
call s:HL('texMathMatcher', 'orange',       '', 'none')
call s:HL('texRefLabel',    'orange',  '', 'none')
call s:HL('texRefZone',     'yellow',         '', 'none')
call s:HL('texComment',     'light_green',    '', 'none')
call s:HL('texDelimiter',   'orange',       '', 'none')
call s:HL('texZone',        'brightgravel', '', 'none')

augroup badwolf_tex
  au!

  au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
  au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'yellow', '', 'none')

" }}}
" Lispyscript {{{

call s:HL('lispyscriptDefMacro', 'yellow',  '', '')
call s:HL('lispyscriptRepeat',   'teal', '', 'none')

" }}}
" Mail {{{

call s:HL('mailSubject',     'orange',      '', 'bold')
call s:HL('mailHeader',      'lightgravel', '', '')
call s:HL('mailHeaderKey',   'lightgravel', '', '')
call s:HL('mailHeaderEmail', 'white',        '', '')
call s:HL('mailURL',         'deeporange',      '', 'underline')
call s:HL('mailSignature',   'gravel',      '', 'none')

call s:HL('mailQuoted1',     'gravel',      '', 'none')
call s:HL('mailQuoted2',     'teal',       '', 'none')
call s:HL('mailQuoted3',     'orange', '', 'none')
call s:HL('mailQuoted4',     'orange',      '', 'none')
call s:HL('mailQuoted5',     'yellow',        '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule',       'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter',  'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker',        'lightgravel', '', 'bold')
call s:HL('markdownItalic',            'white',        '', 'bold')
call s:HL('markdownBold',              'white',        '', 'bold')
call s:HL('markdownH1',                'orange',      '', 'bold')
call s:HL('markdownH2',                'yellow',        '', 'bold')
call s:HL('markdownH3',                'yellow',        '', 'none')
call s:HL('markdownH4',                'yellow',        '', 'none')
call s:HL('markdownH5',                'yellow',        '', 'none')
call s:HL('markdownH6',                'yellow',        '', 'none')
call s:HL('markdownLinkText',          'deeporange',      '', 'underline')
call s:HL('markdownIdDeclaration',     'deeporange')
call s:HL('markdownAutomaticLink',     'deeporange',      '', 'bold')
call s:HL('markdownUrl',               'deeporange',      '', 'bold')
call s:HL('markdownUrldelimiter',      'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter',     'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter',     'orange', '', 'bold')
call s:HL('markdownCode',              'orange', '', 'none')
call s:HL('markdownCodeBlock',         'orange', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'teal', '', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'teal')
call s:HL('pythonBuiltinObj',  'teal')
call s:HL('pythonBuiltinFunc', 'teal')
call s:HL('pythonEscape',      'teal')
call s:HL('pythonException',   'yellow',   '', 'bold')
call s:HL('pythonExceptions',  'yellow',   '', 'none')
call s:HL('pythonPrecondit',   'yellow',   '', 'none')
call s:HL('pythonDecorator',   'red',  '', 'none')
call s:HL('pythonRun',         'gravel', '', 'bold')
call s:HL('pythonCoding',      'gravel', '', 'bold')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gravel')
call s:HL('hlLevel1', 'orange')
call s:HL('hlLevel2', 'green')
call s:HL('hlLevel3', 'teal')
call s:HL('hlLevel4', 'pink')
call s:HL('hlLevel5', 'orange')
call s:HL('hlLevel6', 'orange')
call s:HL('hlLevel7', 'green')
call s:HL('hlLevel8', 'teal')
call s:HL('hlLevel9', 'pink')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')

call s:HL('VimMapMod',       'teal',       '', 'none')
call s:HL('VimMapModKey',    'teal',       '', 'none')
call s:HL('VimNotation',     'teal',       '', 'none')
call s:HL('VimBracket',      'teal',       '', 'none')

" }}}

" Javascript {{{

call s:HL('jsKeyword', 'cyan', '', '')
call s:HL('jsFuncName', 'lime', '', '')
call s:HL('jsFunction', 'blue', '', '')
call s:HL('jsFuncCall', 'cyan', '', '')
call s:HL('jsStringS', 'amber', '', '')
call s:HL('jsStringD', 'amber', '', '')
call s:HL('jsBooleanTrue', 'purple', '', '')
call s:HL('jsBooleanFalse', 'purple', '', '')
call s:HL('jsOperator', 'red', '', '')
call s:HL('jsConditional', 'pink', '', '')
call s:HL('jsNull', 'lime', '', '')
" }}}


" }}}
