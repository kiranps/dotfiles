if exists("b:current_syntax")
    finish
endif

echom "Our syntax highlighting code will go here."


let s:file_node_extensions = {
            \	'html'     : '',
            \	'css'      : '',
            \	'js'       : '',
            \	'rb'       : '',
            \	'psb'      : ''
            \}

""function! NERDTreeHighlightDevIcons(extension, fg, bg, guifg, guibg)
    ""exec 'autocmd FileType nerdtree highlight ' . 'NERDTree' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    ""exec 'autocmd filetype nerdtree syn match NERDTree' . a:extension . ' #^.*\[' . s:file_node_extensions[a:extension] . '.*\]#'
""endfunction

""call NERDTreeHighlightDevIcons('html', 'green', 'none', 'green', '#151515')
""call NERDTreeHighlightDevIcons('js', 'cyan', 'none', 'green', '#151515')
""call NERDTreeHighlightDevIcons('css', 'yellow', 'none', 'green', '#151515')
""call NERDTreeHighlightDevIcons('rb', 'red', 'none', 'green', '#151515')

"exec 'autocmd filetype nerdtree syn match NERDTreerb #^.*\[.*\]#'
"exec 'autocmd FileType nerdtree highlight NERDTreerb ctermfg=1 ctermbg=NONE'

"syntax match NERDTreerb #^.*\[.*\]#
"highlight NERDTreerb ctermbg=NONE ctermfg=1 

"syn match NERDTreerb #^.*\[.*\]#
"hi NERDTreerb ctermbg=NONE ctermfg=1


let b:current_syntax = "nerdtree"
