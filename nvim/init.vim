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
  call minpac#add('edkolev/tmuxline.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('ryanoasis/vim-devicons')

  " Language support
  call minpac#add('calviken/vim-gdscript3')
  call minpac#add('dart-lang/dart-vim-plugin')
  call minpac#add('jdonaldson/vaxe')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('thosakwe/vim-flutter')

  " Colorschemes
	call minpac#add('tomasiser/vim-code-dark')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('romainl/Apprentice')

  " Snippets support
  call minpac#add('hrsh7th/vim-vsnip')
  call minpac#add('hrsh7th/vim-vsnip-integ')

  " Prose and notes
  call minpac#add('vimwiki/vimwiki')

  " General enhancements
  call minpac#add('fsharpasharp/vim-dirvinist')
  call minpac#add('janko/vim-test')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('mbbill/undotree')
  call minpac#add('preservim/nerdtree')
  call minpac#add('sunaku/vim-dasht')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
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
set background=dark
set completeopt=menuone,preview,noselect
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

colorscheme gruvbox

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

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" ------------------------------------------------------------------------------
"  Plugin Configuration
" ------------------------------------------------------------------------------
"  asyncomplete
" let g:asyncomplete_auto_completeopt = 0
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" vim-lsp
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '˟'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_hint = {'text': 'ℹ'}
let g:lsp_highlight_references_enabled = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

function! s:on_lsp_buffer_enabled()
	setlocal omnifunc=lsp#complete

	" augroup format
	" 	autocmd! * <buffer>
	" 	autocmd Bufwrite <buffer> call lsp#ui#vim#document_format()
	" augroup END

	nmap <buffer> <C-]> <Plug>(lsp-definition)
	nmap <buffer> K  <Plug>(lsp-hover)
	nmap <buffer> gr <Plug>(lsp-references)
	nmap <buffer> ga <Plug>(lsp-code-action)
	nmap <buffer> gR <Plug>(lsp-rename)
	nmap <buffer> gS <Plug>(lsp-workspace-symbol)
	nmap <buffer> go <Plug>(lsp-document-symbol)
	nmap <buffer> gm <Plug>(lsp-signature-help)
	nmap <buffer> gd <Plug>(lsp-document-diagnostics)
endfunction

augroup lsp_buffer
	autocmd!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('elixir-ls')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': '[elixir] elixir-ls',
        \ 'cmd': {server_info->['elixir-ls']},
        \ 'whitelist': ['elixir'],
        \ })
endif

if executable('dart-analysis-server')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': '[dart] dart-analysis-server',
        \ 'cmd': {server_info->['dart-analysis-server']},
        \ 'whitelist': ['dart'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': '[javascript] typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript'],
      \ })
endif

" vsnip
let g:vsnip_snippet_dir = '~/.config/nvim/snippets'
let g:vsnip_integ_config = {'vim_lsc': 1}
imap <expr> <C-y> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'

"dasht.vim
let g:dasht_results_window = 'vnew'
let g:dasht_filetype_docsets = {
      \ 'typescript': ['javascript'],
      \ 'typescriptreact': ['javascript'],
      \ }
nnoremap <Leader>k :Dasht<Space>
nnoremap <Leader> <Leader>k :Dasht!<Space>
nnoremap <silent> <Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
nnoremap <silent> <Leader><Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<Return>
vnoremap <silent> <Leader>K y:<C-U>call Dasht(getreg(0))<Return>
vnoremap <silent> <Leader><Leader>K y:<C-U>call Dasht(getreg(0), '!')<Return>

" ALE
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint', 'tslint'],
      \ 'typescriptreact': ['eslint', 'tslint'],
      \ }

let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
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
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'git', 'readonly'], ['filename', 'modified' ]],
      \   'right': [['lineinfo'], ['percent'], ['method', 'obsession', 'filetype', 'fileinfo']]
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
      \   'git': 'lightline_git',
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': '',
      \ },
      \ }

function! s:lightline_git()
  return winwidth(0) > 120 ? ' ' . fugitive#Head() : ''
endfunction

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" test.vim
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-t> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" vimwiki
let g:vimwiki_list = [{
			\ 'path': '~/Dropbox/wiki/',
			\ 'syntax': 'markdown',
			\ 'ext': 'md',
			\}]

augroup wiki
  autocmd!
  autocmd BufEnter *.md setlocal textwidth=80
  autocmd BufWrite *.md :VimwikiTOC
augroup END

" NERDTree
nmap <leader>tt :NERDTreeToggle<CR>
nmap <leader>tf :NERDTreeFind<CR>

" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

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
