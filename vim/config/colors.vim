" Color settings
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

syntax enable                  " Enable syntax processing
set background=dark            " Use light-on-dark colors
colorscheme tender
" colorscheme OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1

if (has("termguicolors"))
    set termguicolors          " Use 24-bit color if the terminal supports it
endif

highlight Comment cterm=italic " Italic comments
highlight Todo cterm=italic    " Italic TODOs
