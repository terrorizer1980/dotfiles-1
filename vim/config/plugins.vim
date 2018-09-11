" Settings for plugins
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" fzf.vim {{{
" Show preview of :Files results
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Show preview of :Ag results
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" }}} ----------------------------------------------------------------
" vim-devicons {{{
let g:tern_request_timeout = 1

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ex$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.exs$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.lock$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.log$'] = ''
" }}} ----------------------------------------------------------------
" elm-vim {{{
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_format_fail_silently = 1
let g:elm_browser_command = 'open'
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 1
" }}} ----------------------------------------------------------------
" vim-airline {{{
" let g:airline_theme='oceanicnext'
let g:airline_theme='tender'
let g:airline_powerline_fonts = 0
" }}} ----------------------------------------------------------------
" lightline.vim {{{
" let g:lightline = {}
" let g:lightline.separator = { 'left': '░', 'right': '░' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }
" }}}
" tagbar {{{
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
" }}} ----------------------------------------------------------------
" Deoplete {{{
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('alchemist', 'mark', '')
call deoplete#custom#source('around', 'mark', '♻')
call deoplete#custom#source('buffer', 'mark', '')
call deoplete#custom#source('file', 'mark', '')
call deoplete#custom#source('jedi', 'mark', '')
call deoplete#custom#source('neosnippet', 'mark', '✄')
call deoplete#custom#source('omni', 'mark', '⦾')
call deoplete#custom#source('tag', 'mark', '')
call deoplete#custom#source('ternjs', 'mark', '')
call deoplete#custom#source('typescript', 'mark', '')

call deoplete#custom#source('alchemist', 'rank', 9999)
" }}} ----------------------------------------------------------------
" editorconfig-vim {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
" }}} ----------------------------------------------------------------
" vim-jsx {{{
let g:jsx_ext_required = 0
" }}} ----------------------------------------------------------------
" rspec-vim {{{
let g:rspec_command = 'Dispatch rspec {spec}'
" }}} ----------------------------------------------------------------
" vim-javascript {{{
let g:javascript_plugin_flow = 1
" }}} ----------------------------------------------------------------
" vim-gutentags {{{
let g:gutentags_cache_dir = '~/.tags'
" }}} ----------------------------------------------------------------
" vim-startify {{{
let g:startify_custom_header =
            \ map(split(system('cat ~/.config/nvim/banner.txt'), '\n'), '"   ". v:val')
" }}} ----------------------------------------------------------------
" tmuxline {{{
let g:tmuxline_powerline_separators = 0
" }}} ----------------------------------------------------------------
" closetag.vim {{{
let g:closetag_filenames = '*.html,*.html.erb,*.html.eex'
" }}} ----------------------------------------------------------------
" ALE {{{
let g:ale_lint_delay = 5000

highlight ALEErrorSign guibg=clear guifg=#FF5370
highlight ALEWarningSign guibg=clear guifg=#F8A663
let g:ale_sign_error = '㤮 '
let g:ale_sign_warning = '⚠ '
let g:ale_sign_column_always = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint', 'flow']
let g:ale_linters['scss'] = ['stylelint', 'sasslint']
let g:ale_linters['startify'] = []
let g:ale_linters['typescript'] = ['tslint']
let g:ale_linters['typescript.jsx'] = ['tslint']

let g:ale_fixers = {}
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['typescript.jsx'] = ['prettier']
let g:ale_fix_on_save = 1
" }}} ----------------------------------------------------------------
" vim-mix-format {{{
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
" }}} ----------------------------------------------------------------

" vim:foldmethod=marker:foldlevel=0
