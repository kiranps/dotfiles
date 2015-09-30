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
let s:mlc.blue2              = ['8BC34A', 4]
let s:mlc.purple             = ['9C27B0', 5]
let s:mlc.cyan               = ['00BCD4', 6]
let s:mlc.brown              = ['795548', 7]
let s:mlc.pink               = ['E91E63', 252]
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


" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal',       'white',        'pink', "")

call s:HL('Folded',       'mediumgravel', 'bg',          'none')

call s:HL('VertSplit',    'lightgravel',  'bg',          'none')

call s:HL('CursorLine',   '',             'darkgravel',  'none')
call s:HL('CursorColumn', '',             'darkgravel')
call s:HL('ColorColumn',  '',             'darkgravel')

call s:HL('TabLine',      'white',        'blackgravel', 'none')
call s:HL('TabLineFill',  'white',        'blackgravel', 'none')
call s:HL('TabLineSel',   'black',         'blue2',      'none')

call s:HL('MatchParen',   'amber',    'darkgravel',  'bold')

call s:HL('NonText',      'deepgravel',   'bg')
call s:HL('SpecialKey',   'deepgravel',   'bg')

call s:HL('Visual',       '',             'deepgravel')
call s:HL('VisualNOS',    '',             'deepgravel')

call s:HL('Search',       'black',         'amber',   'bold')
call s:HL('IncSearch',    'black',         'blue2',      'bold')

call s:HL('Underlined',   'fg',           '',            'underline')

call s:HL('StatusLine',   'black',         'blue2',      'bold')
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

call s:HL('Cursor',  'black', 'blue2', 'bold')
call s:HL('vCursor', 'black', 'blue2', 'bold')
call s:HL('iCursor', 'black', 'blue2', 'none')

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
call s:HL('Operator',    'red', '', 'bold')
call s:HL('Label',       'red', '', 'bold')
call s:HL('Repeat',      'red', '', 'bold')

" Functions and variable declarations are orange, because white looks weird.
call s:HL('Identifier', 'orange', '', 'bold')
call s:HL('Function',   'orange', '', 'bold')

" Preprocessor stuff is yellow, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'yellow', '', 'bold')
call s:HL('Macro',     'yellow', '', 'bold')
call s:HL('Define',    'yellow', '', 'bold')
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

call s:HL('Type',         'teal', '', 'bold')
call s:HL('StorageClass', 'red', '', 'bold')
call s:HL('Structure',    'red', '', 'bold')
call s:HL('Typedef',      'red', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'yellow', '', 'bold')

" Misc
call s:HL('Error',  'white',   'red', 'bold')
call s:HL('Debug',  'white',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      'bold')

" }}}
" Completion Menu {{{

call s:HL('Pmenu',      'white',        'deepergravel')
call s:HL('PmenuSel',   'black',         'blue2',       'bold')
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
  call s:HL('CtrlPPrtCursor', 'black', 'blue2', 'bold')

  " 'prt' or 'win', also for 'regex'
  call s:HL('CtrlPMode1', 'black', 'blue2', 'bold')

  " 'file' or 'path', also for the local working dir
  call s:HL('CtrlPMode2', 'black', 'blue2', 'bold')

  " the scanning status
  call s:HL('CtrlPStats', 'black', 'blue2', 'bold')

  " TODO: CtrlP extensions.
  " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
  " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
  " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
  " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
  " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'blue2',     'bg', 'bold')
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

" Filetype-specific {{{

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

" HTML {{{

" Punctuation
call s:HL('htmlTag',    'white', '', 'none')
call s:HL('htmlEndTag', 'white', '', 'none')
" Tag names
call s:HL('htmlTagName',        'red', '', 'bold')
call s:HL('htmlSpecialTagName', 'red', '', 'bold')
"call s:HL('htmlSpecialChar',    'yellow',   '', 'none')
call s:HL('htmlSpecialChar',    'pink',   '', 'none')
" Attributes
call s:HL('htmlArg', 'green', '', 'none')
" Stuff inside an <a> tag
call s:HL('htmlLink', 'blue2', '', 'underline')
" }}}

" Java {{{
call s:HL('javaClassDecl',    'red',     '', 'bold')
call s:HL('javaScopeDecl',    'red',     '', 'bold')
call s:HL('javaCommentTitle', 'gravel',    '')
call s:HL('javaDocTags',      'white',      '', 'none')
call s:HL('javaDocParam',     'amber', '', '')
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

" Vim {{{
call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')
call s:HL('VimMapMod',       'teal',       '', 'none')
call s:HL('VimMapModKey',    'teal',       '', 'none')
call s:HL('VimNotation',     'teal',       '', 'none')
call s:HL('VimBracket',      'teal',       '', 'none')
" }}}

" Javascript {{{
call s:HL('jsKeyword', 'cyan', '', '')
call s:HL('jsFuncName', 'purple', '', '')
call s:HL('jsFunction', 'lime', '', '')
call s:HL('jsFuncCall', 'cyan', '', '')
call s:HL('jsStringS', 'amber', '', '')
call s:HL('jsStringD', 'amber', '', '')
call s:HL('jsBooleanTrue', 'purple', '', '')
call s:HL('jsBooleanFalse', 'purple', '', '')
call s:HL('jsOperator', 'red', '', '')
call s:HL('jsConditional', 'red', '', 'bold')
call s:HL('jsNull', 'lime', '', '')
" }}}



" Ruby {{{
call s:HL('rubyInclude', 'red', '', 'bold') " require
call s:HL('rubyClass', 'red', '', 'bold') " class
call s:HL('rubyConditional', 'red', '', 'bold')
call s:HL('rubyDefine', 'red', '', 'bold') " def end
call s:HL('rubyControl', 'red', '', 'bold') "do loop while end

call s:HL('rubyString', 'yellow', '', 'bold') " string 
call s:HL('rubySymbol', 'purple', '', 'bold')
call s:HL('rubyFunction', 'brown', '', 'bold') "function name
call s:HL('rubyIdentifier', 'orange', '', 'bold') " key value
call s:HL('rubyInstanceVariable', 'orange', '', 'bold') "@name
call s:HL('rubyGlobalVariable', 'orange', '', 'bold') " $CURRENT_PATH
call s:HL('rubyConstant', 'blue2', '', 'bold') "class name

call s:HL('rubyComment', 'gravel', '', '')
call s:HL('rubyMultilineComment', 'gravel', '', '')

"call s:HL('rubyExceptional', 'lime', '', 'bold')
"call s:HL('rubyMethodExceptional', 'lime', '', 'bold')
"call s:HL('rubyTodo', 'lime', '', 'bold')
"call s:HL('rubyStringEscape', 'lime', '', 'bold')
"call s:HL('rubyQuoteEscape', 'lime', '', 'bold')
"call s:HL('rubyInterpolationDelimiter', 'lime', '', 'bold')
"call s:HL('rubyInterpolation', 'lime', '', 'bold')
"call s:HL('rubyClassVariable', 'green', '', 'bold')
"call s:HL('rubyPredefinedVariable', 'lime', '', 'bold')
"call s:HL('rubyInvalidVariable', 'lime', '', 'bold')
"call s:HL('rubyNoInterpolation', 'lime', '', 'bold')
"call s:HL('rubyDelimEscape', 'lime', '', 'bold')
"
"call s:HL('rubyNestedParentheses', 'lime', '', 'bold')
"call s:HL('rubyNestedCurlyBraces', 'lime', '', 'bold')
"call s:HL('rubyNestedAngleBrackets', 'lime', '', 'bold')
"call s:HL('rubyNestedSquareBrackets', 'lime', '', 'bold')
"
"call s:HL('rubyRegexpSpecial', 'lime', '', 'bold')
"call s:HL('rubyRegexpComment', 'lime', '', 'bold')
"call s:HL('rubyRegexpParens', 'lime', '', 'bold')
"call s:HL('rubyRegexpCharClass', 'lime', '', 'bold')
"call s:HL('rubyRegexpEscape', 'lime', '', 'bold')
"call s:HL('rubyRegexpBrackets', 'lime', '', 'bold')
"call s:HL('rubyRegexpQuantifier', 'lime', '', 'bold')
"call s:HL('rubyRegexpAnchor', 'lime', '', 'bold')
"call s:HL('rubyRegexpDot', 'lime', '', 'bold')
"
"call s:HL('rubyASCIICode', 'lime', '', 'bold')
"
"call s:HL('rubyInteger', 'lime', '', 'bold')
"call s:HL('rubyFloat', 'lime', '', 'bold')
"call s:HL('rubyLocalVariableOrMethod', 'lime', '', 'bold')
"call s:HL('rubyBlockArgument', 'lime', '', 'bold')

"call s:HL('rubyCapitalizedMethod', 'lime', '', 'bold')
"call s:HL('rubyBlockParameter', 'lime', '', 'bold')
"call s:HL('rubyBlockParameterList', 'lime', '', 'bold')
"call s:HL('rubyPredefinedConstant', 'lime', '', 'bold')
"call s:HL('rubyRegexpDelimiter', 'lime', '', 'bold')
"call s:HL('rubyRegexp', 'lime', '', 'bold')
"call s:HL('rubyStringDelimiter', 'lime', '', 'bold')
"call s:HL('rubySymbolDelimiter', 'lime', '', 'bold')
"call s:HL('rubyHeredocStart', 'lime', '', 'bold')
"call s:HL('rubyHeredoc', 'lime', '', 'bold')
"call s:HL('rubyAliasDeclaration2', 'lime', '', 'bold')
"call s:HL('rubyAliasDeclaration', 'lime', '', 'bold')
"call s:HL('rubyBoolean', 'lime', '', 'bold')
"call s:HL('rubyPseudoVariable', 'lime', '', 'bold')
"call s:HL('rubyMethodDeclaration', 'lime', '', 'bold')
"call s:HL('rubyClassDeclaration', 'lime', '', 'bold')
"call s:HL('rubyModuleDeclaration', 'lime', '', 'bold')
"call s:HL('rubyKeyword', 'lime', '', 'bold')
"call s:HL('rubyBeginEnd', 'lime', '', 'bold')
"call s:HL('rubyModule', 'lime', '', 'bold')
"
"call s:HL('rubyMethodBlock', 'lime', '', 'bold')
"call s:hl('rubyblock', 'lime', '', 'bold')
"call s:HL('rubyConditionalModifier', 'lime', '', 'bold')
"call s:HL('rubyRepeatModifier', 'lime', '', 'bold')
"call s:HL('rubyDoBlock', 'lime', '', 'bold')
"call s:HL('rubyCurlyBlockDelimiter', 'lime', '', 'bold')
"call s:HL('rubyCurlyBlock', 'lime', '', 'bold')
"call s:HL('rubyArrayDelimiter', 'lime', '', 'bold')
"call s:HL('rubyArrayLiteral', 'lime', '', 'bold')
"call s:HL('rubyBlockExpression', 'lime', '', 'bold')
"call s:HL('rubyCaseExpression', 'lime', '', 'bold')
"call s:HL('rubyConditionalExpression', 'lime', '', 'bold')
"call s:HL('rubyRepeat', 'lime', '', 'bold')
"
"call s:HL('rubyOptionalDo', 'lime', '', 'bold')
"call s:HL('rubyOptionalDoLine', 'lime', '', 'bold')
"call s:HL('rubyRepeatExpression', 'lime', '', 'bold')
"call s:HL('rubyAccess', 'lime', '', 'bold')
"call s:HL('rubyAttribute', 'lime', '', 'bold')
"call s:HL('rubyEval', 'lime', '', 'bold')
"call s:HL('rubyException', 'lime', '', 'bold')
"call s:HL('rubySharpBang', 'lime', '', 'bold')
"call s:HL('rubySpaceError', 'lime', '', 'bold')
"call s:HL('rubyDocumentation', 'lime', '', 'bold')
"call s:HL('rubyKeywordAsMethod', 'lime', '', 'bold')
"call s:HL('rubyDataDirective', 'lime', '', 'bold')
"call s:HL('rubyData', 'lime', '', 'bold')
"call s:HL('rubyPredefinedIdentifier', 'lime', '', 'bold')
"call s:HL('rubyError', 'lime', '', 'bold')

" }}}


" }}}

" }}}


"function! NERDTreeHighlightDevIcons(extension, fg, bg, guifg, guibg)
    "exec 'autocmd FileType nerdtree highlight ' . 'NERDTree' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"endfunction

"" NERDTreeDevWebDevIcons {{{

"call NERDTreeHighlightDevIcons('html', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightDevIcons('js', 'cyan', 'none', 'green', '#151515')
"call NERDTreeHighlightDevIcons('css', 'yellow', 'none', 'green', '#151515')
"call NERDTreeHighlightDevIcons('rb', 'red', 'none', 'green', '#151515')

" }}}
