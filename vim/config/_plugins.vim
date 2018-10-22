" ==============================================================================
" Settings for Plugins
" ==============================================================================
"
" This `call`s functions provided by plugins so it must be
" sourced after vim-plug has done its thing.
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles


" ALE
" ------------------------------------------------------------------------------
" let g:ale_lint_delay = 5000

let g:ale_sign_error = '㤮 '
let g:ale_sign_warning = '⚠ '

let g:ale_linters = {
    \ 'elixir': ['mix']}

let g:ale_fixers = {
    \ 'elixir': ['mix_format']}
let g:ale_fix_on_save = 1

" Denite
" ------------------------------------------------------------------------------
call denite#custom#var('file/rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', 'node_modules/', 'build/', 'dist/', 'deps/' ])
call denite#custom#map('insert', '<Down>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>',
      \ '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-v>',
      \ '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-x>',
      \ '<denite:do_action:split>', 'noremap')

" Deoplete
" ------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" gruvbox
" ------------------------------------------------------------------------------
let g:gruvbox_bold = 0
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1

" NERDTree
" ------------------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" netrw
" ------------------------------------------------------------------------------
let g:netrw_banner = 0

" Prettier
" ------------------------------------------------------------------------------
let g:prettier#autoformat = 0

" Srcery
" ------------------------------------------------------------------------------
let g:srcery_italic = 1

" Startify
" ------------------------------------------------------------------------------
let g:startify_custom_header =
      \ map(split(system('cat ~/.config/nvim/banner.txt'), '\n'), '"   ". v:val')

" Tabulous
" ------------------------------------------------------------------------------
let tabulousCloseStr = ''
let tabulousLabelLeftStr = '  '
let tabulousLabelModifiedStr = '◦ '
let tabulousLabelNameOptions = ''
let tabulousLabelRightStr = '  '

" test.vim
" ------------------------------------------------------------------------------
let test#strategy = "neovim"

" TrailerTrash
" ------------------------------------------------------------------------------
let g:trailertrash_blacklist = ['vim-plug']

" vim-airline
" ------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 0

" vim-devicons
" ------------------------------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ex$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.exs$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.lock$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.log$'] = ''


