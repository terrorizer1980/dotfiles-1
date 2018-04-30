" Settings for plugins
"
" Author: N. G. Scheurich
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
" Deoplete {{{
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('alchemist', 'mark', 'ex')
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
" deoplete-ternjs {{{
" let g:tern_request_timeout = 1
" let g:tern#filetypes = ['js', 'jsx', 'javascript.jsx', 'vue']
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
let g:airline_theme='twofirewatch'
let g:airline_powerline_fonts = 0
hi StatusLine ctermbg=red
" }}} ----------------------------------------------------------------
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
" NERDTree {{{
"" Open automatically when Vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"" Close Vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}} ----------------------------------------------------------------
" omnisharp-vim {{{
let g:OmniSharp_server_path = '/Users/nscheurich/OmniSharp/omnisharp/OmniSharp.exe'
let g:OmniSharp_timeout = 1
set completeopt=longest,menuone,preview
set previewheight=5
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
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '㤮 '
let g:syntastic_warning_symbol = '⚠ '
" }}}
" vim-javascript {{{
let g:javascript_plugin_flow = 1
" }}} ----------------------------------------------------------------
" vim-gutentags {{{
let g:gutentags_cache_dir = '~/.tags_cache'
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
" }}}
" vim-lua-ftplugin {{{
let g:lua_complete_omni = 1
" }}}

" vim:foldmethod=marker:foldlevel=0
