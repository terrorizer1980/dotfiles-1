"                 __
"  __          __/\ \__               __
" /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
" \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"  \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"   \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"    \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/
"
" =========================================================
" Neovim configuration
" =========================================================
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Disable some built-in plugins
let g:loaded_python_provider  = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider    = 0
let g:loaded_node_provider    = 0
let g:loaded_perl_provider    = 0

" Enable 24-bit RGB color in the `TUI`
" Some colorschemes need this loaded early in order to work properly
set termguicolors

" LSP configuration
lua require('ngs.lsp')

" Add FZF to the runtimepath
set rtp+=/usr/local/opt/fzf
