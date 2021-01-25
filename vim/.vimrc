"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" ------------------------------------------------------------------------------
" Packages
" ------------------------------------------------------------------------------
if exists('*minpac#init')
  call minpac#init()

	" Package manager
  call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Code intelligence
  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('Shougo/echodoc.vim')
  call minpac#add('dense-analysis/ale')

	" UI enhancements
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('edkolev/tmuxline.vim')

	" Colorschemes
	call minpac#add('tomasiser/vim-code-dark')

	" Language support
  call minpac#add('sheerun/vim-polyglot')

  " Snippets support
  call minpac#add('hrsh7th/vim-vsnip')
  call minpac#add('hrsh7th/vim-vsnip-integ')

	" Prose and notes
  call minpac#add('vimwiki/vimwiki')

	" General enhancements
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('simnalamburt/vim-mundo')
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
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
endif

" ------------------------------------------------------------------------------
" Settings
" ------------------------------------------------------------------------------
set belloff=all
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set hlsearch
set noshowmode
set number
set relativenumber
set rtp+=/usr/local/opt/fzf
set shiftwidth=2
set sidescroll=1
set signcolumn=yes
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undo
set undofile

" ------------------------------------------------------------------------------
" Mappings & Commands
" ------------------------------------------------------------------------------
let mapleader=" "

nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/
nnoremap <Leader>rl :s/\<<C-r><C-w>\>/
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :Rg<CR>

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

augroup wiki
	autocmd!
	autocmd BufEnter *.md setlocal textwidth=80
	autocmd BufWrite *.md :VimwikiTOC
augroup END

function! s:on_lsp_buffer_enabled()
	setlocal omnifunc=lsp#complete

	augroup format
		autocmd! * <buffer>
		autocmd Bufwrite <buffer> call lsp#ui#vim#document_format()
	augroup END

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
				\ 'name': 'elixir-ls',
				\ 'cmd': {server_info->['elixir-ls']},
				\ 'whitelist': ['elixir'],
				\ })
endif

" ------------------------------------------------------------------------------
"  Plugin Configuration
" ------------------------------------------------------------------------------
" vim-lsp
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '˟'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_hint = {'text': 'i'}
let g:lsp_highlight_references_enabled = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

" vsnip
let g:vsnip_snippet_dir = '~/.config/nvim/snippets'
let g:vsnip_integ_config = {'vim_lsp': 1}
imap <expr> <C-y> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'

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

" lightline.vim
let g:lightline = {
			\ 'colorscheme': 'Tomorrow_Night',
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
	return winwidth(0) > 120 ? '  ' . fugitive#Head() : ''
endfunction

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" vimwiki
let g:vimwiki_list = [{
			\ 'path': '~/Dropbox/wiki/',
			\ 'syntax': 'markdown',
			\ 'ext': 'md',
			\}]

"-----------------------------------------------------------

if $TERM_PROGRAM == 'vscode'
	let g:lightline['colorscheme'] = 'codedark'
	colorscheme codedark
else
	colorscheme default 
endif
