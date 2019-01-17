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
let g:ale_lint_delay = 5000

let g:ale_sign_error = '㤮 '
let g:ale_sign_warning = '⚠ '

let g:ale_linters = {
    \ 'cs': ['omnisharp'],
    \ 'elixir': ['mix'],
    \ 'javascript': ['eslint']}

let g:ale_fixers = {
    \ 'elixir': ['mix_format'],
    \ 'javascript': ['eslint']}

let g:ale_fix_on_save = 1

" Deoplete
" ------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('alchemist', 'mark', '')
call deoplete#custom#source('around', 'mark', '♻')
call deoplete#custom#source('buffer', 'mark', '')
call deoplete#custom#source('file', 'mark', '')
call deoplete#custom#source('jedi', 'mark', '')
call deoplete#custom#source('neosnippet', 'mark', '✄')
call deoplete#custom#source('omni', 'mark', '⦾')
call deoplete#custom#source('tag', 'mark', '')
call deoplete#custom#source('[TernJS]', 'mark', '')
call deoplete#custom#source('typescript', 'mark', '')

call deoplete#custom#source('alchemist', 'rank', 9999)

" fzf
" ------------------------------------------------------------------------------
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" Tagbar
" ------------------------------------------------------------------------------
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

" test.vim
" ------------------------------------------------------------------------------
let test#strategy = "neovim"

" tmuxline.vim
" ------------------------------------------------------------------------------
let g:tmuxline_powerline_separators = 0

" TrailerTrash
" ------------------------------------------------------------------------------
let g:trailertrash_blacklist = ['vim-plug']

" vim-airline
" ------------------------------------------------------------------------------
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 0
let g:airline_theme='one'

" vim-devicons
" ------------------------------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ex$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.exs$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.lock$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.log$'] = ''

" vim-polyglot
" ------------------------------------------------------------------------------
let g:polyglot_disabled = ['typescript']

