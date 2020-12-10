hi Comment cterm=italic

syntax on
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
let g:sonokai_better_performance = 1
colorscheme sonokai


