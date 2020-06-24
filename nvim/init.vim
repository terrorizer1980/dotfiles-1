" vim: nowrap
scriptencoding utf-8

" Neovim configuration
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo:   https://github.com/ngscheurich/dotfiles

" ------------------------------------------------------------------------------
" Packages
" ------------------------------------------------------------------------------
if exists('*minpac#init')
  call minpac#init()

  " Package manager
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Code intelligence
  call minpac#add('dense-analysis/ale')
  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/asyncomplete-flow.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/vim-lsp')

  " UI enhancements
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('hoov/tmuxline.vim', {'branch': 'truecolor-lightline'})
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('ryanoasis/vim-devicons')

  " Language/framework support
  call minpac#add('calviken/vim-gdscript3')
  call minpac#add('dart-lang/dart-vim-plugin')
  call minpac#add('heavenshell/vim-jsdoc')
  call minpac#add('jdonaldson/vaxe')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('thosakwe/vim-flutter')

  " Colorschemes
  call minpac#add('arzg/vim-colors-xcode')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('nightsense/cosmic_latte')
	call minpac#add('tomasiser/vim-code-dark')

  " Snippets support
  call minpac#add('hrsh7th/vim-vsnip')
  call minpac#add('hrsh7th/vim-vsnip-integ')

  " Prose and notes
  call minpac#add('vimwiki/vimwiki')

  " General enhancements
  call minpac#add('andymass/vim-matchup')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('fsharpasharp/vim-dirvinist')
  call minpac#add('janko/vim-test')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('mbbill/undotree')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('preservim/nerdtree')
  call minpac#add('romainl/vim-qf')
  call minpac#add('sunaku/vim-dasht')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
endif

" ------------------------------------------------------------------------------
"  General Configuration
" ------------------------------------------------------------------------------
set completeopt=menuone,preview
set cursorline
set expandtab
set fillchars+=vert:│
set foldenable
set foldlevelstart=5
set foldmethod=marker
set foldnestmax=10
set hidden
set ignorecase
set inccommand=split
set nobackup
set noshowmode
set noswapfile
set number
set relativenumber
set rtp+=/usr/local/opt/fzf
set scrolloff=5
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set undofile

" set background=light
" colorscheme solarized8_flat
set background=dark
colorscheme xcodedark

" ------------------------------------------------------------------------------
" Mappings & Commands
" ------------------------------------------------------------------------------
let mapleader=" "

nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j

nnoremap <silent> <Esc> :nohlsearch<CR>

nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/
nnoremap <Leader>rl :s/\<<C-r><C-w>\>/

noremap Y y$

noremap n nzz
noremap N Nzz

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>lc :lclose<CR>

nnoremap <C-n> <Plug><qf_qf_next>
nnoremap <C-p> <Plug><qf_qf_previous>
nnoremap <C-n> <Plug><qf_loc_next>
nnoremap <C-p> <Plug><qf_loc_previous>

" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" ------------------------------------------------------------------------------
"  Plugin Configuration
" ------------------------------------------------------------------------------
"  Some interesting character choices: × ‼ ‽ ⁇ ↬ ⊘ ⋿ ⎔ ☐ ☑ ☒ ⚐ ⚑ ⚡⮾ ⮿       o
let s:error_sign = '⊘'
let s:warning_sign = ' '
let s:info_sign = ' '
let s:hint_sign = ' '

" asyncomplete
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
" imap <C-Space> <Plug>(asyncomplete_force_refresh)

" vim-lsp
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': s:error_sign}
let g:lsp_signs_warning = {'text': s:warning_sign}
let g:lsp_signs_hint = {'text': s:info_sign}
let g:lsp_highlight_references_enabled = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

function! s:on_lsp_buffer_enabled()
  augroup lsp_format
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> LspDocumentFormat
  augroup END

  " [todo] Why are these <plug> mappings not working?
  " nnoremap <buffer> <C-]> <plug>(lsp-definition)
  " nnoremap <buffer> K  <Plug>(lsp-hover)
  " nnoremap <buffer> gr <Plug>(lsp-references)
  " nnoremap <buffer> ga <Plug>(lsp-code-action)
  " nnoremap <buffer> gR <Plug>(lsp-rename)
  " nnoremap <buffer> gS <Plug>(lsp-workspace-symbol)
  " nnoremap <buffer> go <Plug>(lsp-document-symbol)
  " nnoremap <buffer> gm <Plug>(lsp-signature-help)
  " nnoremap <buffer> gd <Plug>(lsp-document-diagnostics)

  nnoremap <buffer> <C-]> :LspDefinition<CR>
  nnoremap <buffer> K  :LspHover<CR>
  nnoremap <buffer> gr :LspReferences<CR>
  nnoremap <buffer> ga :LspCodeAction<CR>
  nnoremap <buffer> gR :LspRename<CR>
  nnoremap <buffer> gd :LspDocumentDiagnostics<CR>
  nnoremap <buffer> <Leader>] :LspNextError<CR>
  nnoremap <buffer> <Leader>[ <Plug>(lsp-previous-error)
endfunction

augroup lsp_buffer
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let s:elixir_ls = '/Users/ngscheurich/dev/elixir-ls/release/language_server.sh'
if executable(s:elixir_ls)
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'elixir-ls',
        \ 'cmd': {server_info->[s:elixir_ls]},
        \ 'whitelist': ['elixir'],
        \ })
endif

if executable('dart-analysis-server')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'dart-analysis-server',
        \ 'cmd': {server_info->['dart-analysis-server']},
        \ 'whitelist': ['dart'],
        \ })
endif

if executable('typescript-language-server')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['typescript', 'typescriptreact'],
        \ })
endif

if executable('./node_modules/.bin/flow')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flow-language-server',
        \ 'cmd': {server_info->['./node_modules/.bin/flow', 'lsp', '--from', 'vim-lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
        \ 'whitelist': ['javascript'],
        \ })
endif

if executable('rls')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

" vsnip
let g:vsnip_snippet_dir = '~/.config/nvim/snippets'
let g:vsnip_integ_config = {'vim_lsp': 1}
imap <expr> <C-y> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'

"dasht.vim
let g:dasht_results_window = 'vnew'
let g:dasht_filetype_docsets = {
      \ 'typescript': ['javascript'],
      \ 'typescriptreact': ['javascript'],
      \ }
" nnoremap <Leader>k :Dasht<Space>
" nnoremap <Leader> <Leader>k :Dasht!<Space>
" nnoremap <silent> <Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
" nnoremap <silent> <Leader><Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<Return>
" vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>
" vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>

" ALE
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint', 'tslint'],
      \ 'typescriptreact': ['eslint', 'tslint'],
      \ 'html': ['tidy'],
      \ }

let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
      \ 'json': ['prettier'],
      \ 'html': ['prettier'],
      \ }

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" fzf.vim
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
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
      \ 'header':  ['fg', 'Comment'],
      \ }
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :Rg<CR>

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'git', 'readonly'], ['filename', 'modified' ]],
      \   'right': [
      \     ['lsp_information', 'lsp_hints', 'lsp_warnings', 'lsp_errors'],
      \     ['lineinfo'],
      \     ['percent'],
      \     ['method', 'obsession', 'filetype', 'fileinfo'],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [[ 'git', 'readonly'], ['filename', 'modified' ]],
      \   'right': [['obsession', 'filetype', 'fileinfo']]
      \ },
      \ 'component': {
      \   'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \   'fileformat': '%{&ff}',
      \   'fileinfo': '%{&ff}[%{&fenc!=#""?&fenc:&enc}]',
      \   'filename': '%t',
      \   'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \   'lineinfo': '%3l:%-2v ',
      \   'mode': '%{lightline#mode()}',
      \   'modified': '[%M]',
      \   'obsession': '%{ObsessionStatus()}',
      \   'paste': '%{&paste?"PASTE":""}',
      \   'percent': '%3p%% ☰ ',
      \   'readonly': '%R',
      \ },
      \ 'component_function': {
      \   'git': 'GitCurrentBranch',
      \   'lsp_errors': 'LspErrors',
      \ },
      \ 'component_expand': {
      \ },
      \ 'component_type': {
      \   'lsp_errors': 'error',
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': '',
      \ },
      \ }

function! LspInformation()
  let l:count = lsp#get_buffer_diagnostics_counts()['information']
  return LspComponent(l:count, s:info_sign)
endfunction

function! LspHints()
  let l:count = lsp#get_buffer_diagnostics_counts()['hint']
  return LspComponent(l:count, s:hint_sign)
endfunction

function! LspWarnings()
  let l:count = lsp#get_buffer_diagnostics_counts()['warning']
  return LspComponent(l:count, s:warning_sign)
endfunction

function! LspErrors()
  let l:count = lsp#get_buffer_diagnostics_counts()['error']
  return LspComponent(l:count, s:error_sign)
endfunction

function! LspComponent(count, symbol)
  return a:count == '0' ? '' : a:symbol . ' ' . a:count
endfunction

function! GitCurrentBranch()
  let l:branch = fugitive#Head()
  return winwidth(0) < 120 || l:branch == '' ? '' : ' ' . fugitive#Head()
endfunction

let g:lsp_signs_error = {'text': s:error_sign}
let g:lsp_signs_warning = {'text': s:warning_sign}
let g:lsp_signs_hint = {'text': s:hint_sign}

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" test.vim
" let test#strategy = 'dispatch'

nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-a> :TestSuite<CR>
nnoremap <silent> t<C-t> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

" vimwiki
let g:notes = {
      \ 'path': '~/Dropbox/wikis/notes/',
      \ 'auto_toc': 1,
      \ 'nested_syntaxes': {
      \   'c': 'c',
      \   'elixir': 'elixir',
      \   'javascript': 'javascript',
      \   'typescript': 'typescript',
      \   'viml': 'viml',
      \ },
      \ }

let g:safe_harbour = {
      \ 'path': '~/Dropbox/wikis/safe_harbour/',
      \ 'auto_toc': 1,
      \ }

let g:new_aperio = {
      \ 'path': '~/Dropbox/wikis/new_aperio/',
      \ 'auto_toc': 1,
      \ 'nested_syntaxes': {
      \   'elixir': 'elixir',
      \   'javascript': 'javascript',
      \   'typescript': 'typescript',
      \ },
      \ }

let g:vimwiki_list = [g:notes, g:safe_harbour, g:new_aperio]
let g:vimwiki_hl_headers= 1
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = ' ○◐●✓'
let g:vimwiki_folding = 'expr'

" NERDTree
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>

" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" GitGutter
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_sign_allow_clobber = 1
let g:lsp_signs_priority = 15

" ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" ------------------------------------------------------------------------------
" VS Code Integration
" ------------------------------------------------------------------------------
if $TERM_PROGRAM == 'vscode'
  let g:lightline['colorscheme'] = 'codedark'
  colorscheme codedark
endif

if exists('g:vscode')
  nnoremap K :call VSCodeNotify("editor.action.showHover")<CR>
  nnoremap <Leader>e[ :call VSCodeNotify("editor.action.marker.prev")<CR>
  nnoremap <Leader>e] :call VSCodeNotify("editor.action.marker.next")<CR>
  nnoremap <Leader>tf :call VSCodeNotify("workbench.action.tasks.runTask", "Test Current File")<CR>
  nnoremap <Leader>tn :call VSCodeNotify("workbench.action.tasks.runTask", "Run Nearest Test")<CR>
  nnoremap <Leader>tl :call VSCodeNotify("workbench.action.tasks.runTask", "Run Last Test ")<CR>
  nnoremap <Leader>td :call VSCodeNotify("workbench.action.tasks.runTask", "Debug Nearest Test ")<CR>
endif
