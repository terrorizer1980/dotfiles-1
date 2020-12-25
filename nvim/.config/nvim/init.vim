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
let g:loaded_netrwPlugin      = 0
let g:loaded_python_provider  = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider    = 0
let g:loaded_node_provider    = 0
let g:loaded_perl_provider    = 0

lua require('lsp')

colorscheme base16-default-dark

" TODO Mappings for UI toggles, e.g. tree, git signs, LSP stuff

let g:vsnip_snippet_dir = stdpath('config') . '/snippets'
