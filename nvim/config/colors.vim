" Color settings
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

syntax enable                  " Enable syntax processing
set background=dark            " Use light-on-dark colors
let g:two_firewatch_italics=1  " Enable italics for colorscheme
colorscheme two-firewatch      " Set colorscheme
" colorscheme monokai_pro
" let g:one_allow_italics = 1
" colorscheme tender

if (has("termguicolors"))
    set termguicolors          " Use 24-bit color if the terminal supports it
endif

highlight Comment cterm=italic " Italic comments
highlight Todo cterm=italic    " Italic TODOs
