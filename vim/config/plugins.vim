" Settings for plugins
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Ale
" -------------------------------------------------------------------------------------
let g:ale_lint_delay = 5000

highlight ALEErrorSign guibg=clear guifg=#FF5370
highlight ALEWarningSign guibg=clear guifg=#F8A663

let g:ale_sign_error = '㤮 '
let g:ale_sign_warning = '⚠ '
let g:ale_sign_column_always = 0

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['scss'] = ['stylelint', 'sasslint']
let g:ale_linters['startify'] = []
let g:ale_linters['typescript'] = ['tslint', 'tsserver']
let g:ale_linters['typescript.jsx'] = ['tslint', 'tsserver']

let g:ale_fixers = {}
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['typescript.jsx'] = ['prettier']
let g:ale_fix_on_save = 1


" closetag.vim
" -------------------------------------------------------------------------------------
let g:closetag_filenames = '*.html,*.html.erb,*.html.eex'


" Deoplete
" -------------------------------------------------------------------------------------
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


" editorconfig-vim
" -------------------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'


" NERDTree
" -------------------------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeWinPos = 'right'


" rspec-vim
let g:rspec_command = 'Dispatch rspec {spec}'


" vim-airline
" -------------------------------------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'srcery'
let g:airline#extensions#tabline#enabled = 1


" tmuxline
" -------------------------------------------------------------------------------------
let g:tmuxline_powerline_separators = 0


" vim-devicons
" -------------------------------------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.ex$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.exs$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.lock$'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.log$'] = ''

" vim-jsx
let g:jsx_ext_required = 0

" vim-mix-format
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 0

" vim-startify
let g:startify_custom_header =
            \ map(split(system('cat ~/.config/nvim/banner.txt'), '\n'), '"   ". v:val')


" Srcery
" -------------------------------------------------------------------------------------
let g:srcery_italic = 1


" Denite
" -------------------------------------------------------------------------------------
" Change file/rec command
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Change mappings
call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Change matchers
" call denite#custom#source(
" \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" call denite#custom#source(
" \ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
" call denite#custom#source(
" \ 'file/rec', 'sorters', ['sorter/sublime'])

" Add custom menus
" let s:menus = {}

" let s:menus.zsh = {
"   \ 'description': 'Edit your import zsh configuration'
"   \ }
" let s:menus.zsh.file_candidates = [
"   \ ['zshrc', '~/.config/zsh/.zshrc'],
"   \ ['zshenv', '~/.zshenv'],
"   \ ]

" let s:menus.my_commands = {
"   \ 'description': 'Example commands'
"   \ }
" let s:menus.my_commands.command_candidates = [
"   \ ['Split the window', 'vnew'],
"   \ ['Open zsh menu', 'Denite menu:zsh'],
"   \ ]

" call denite#custom#var('menu', 'menus', s:menus)

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Define aliases
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])


" Tagbar
" -------------------------------------------------------------------------------------
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1

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

