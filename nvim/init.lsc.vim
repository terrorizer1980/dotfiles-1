scriptencoding utf-8

"                 __
"  __          __/\ \__               __
" /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
" \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"  \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"   \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"    \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/
"
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" ------------------------------------------------------------------------------
" Packages
" ------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'alvan/vim-closetag'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'mattn/emmet-vim'
Plug 'maximbaz/lightline-ale'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vimwiki/vimwiki'

" Language Server Protocol client
echo "LSP client: vim-lsc"
Plug 'natebosch/vim-lsc'

call plug#end()

" ------------------------------------------------------------------------------
" LSP Client Config
" ------------------------------------------------------------------------------
set shortmess-=F
let g:lsc_auto_map = v:true
let g:lsc_server_commands = {
      \ 'elixir': ['els'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
      \ }

" ------------------------------------------------------------------------------
"  General Configuration
" ------------------------------------------------------------------------------
set cursorline        " Highlight current line
set expandtab         " Insert proper amount of spaces when inserting a <Tab>
set fillchars+=vert:│ " Customize split borders
set foldenable        " Enable folding set foldlevelstart=5  " Maximum fold depth open by default
set foldmethod=marker " Use character sequences to denote folds
set foldnestmax=10    " Maximum allowed fold depth
set hidden            " Hide a buffer when it is abandoned
set ignorecase        " Ignore case when searching
set inccommand=split  " Preview file-wide search/replace in a split
set nobackup          " Don't create a backup before overwriting a file
set noshowmode        " Don't display editing mode (vim-airline shows this)
set noswapfile        " Don't create a swapfile for a new buffer
set number            " Show line numbers
set relativenumber    " Show relative line numbers
set scrolloff=5       " Keep a few lines above and below the cursor
set shiftwidth=2      " Number of spaces to use for each step of (auto)indent
set shortmess+=c      " TODO
set signcolumn=yes    " Show signs to the left of line numbers
set smartcase         " Don't ignore case when searching with mixed case
set smartindent       " Intelligently indent new lines
set softtabstop=2     " Number of spaces per <Tab> while editing
set splitbelow        " Open horizontal splits below current window
set splitright        " Open vertical splits to the right of the current window
set tabstop=2         " Number of spaces per <Tab>
set termguicolors     " Use 24-bit color
set undofile          " Persist undo history between sessions
set updatetime=300    " Improve coc.nvim diagnostics?

set completeopt=menuone

let mapleader=","

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :Rg<CR>
nnoremap <Esc> :nohlsearch<CR>
nnoremap <Leader>\ :NERDTreeToggle<CR>

function! ToggleColorscheme()
  if &background ==# 'dark'
    call LightMode()
  else
    call DarkMode()
  endif
endfunction

function! DarkMode()
  set background=dark
  colorscheme base16-tomorrow-night
  let g:lightline.colorscheme = 'base16_tomorrow_night'
  execute 'silent !termcolors dark'
  echo 'Good night'
endfunction

function! LightMode()
  set background=light
  colorscheme solarized8_flat
  let g:lightline.colorscheme = 'solarized'
  call LightlineRefresh()
  execute 'silent !termcolors light'
  execute 'silent !tmux source ~/.tmuxline.light'
  echo 'Good morning'
endfunction

function! LightlineRefresh()
  call lightline#init()
  call lightline#colorscheme()
endfunction

command! ToggleColorscheme silent call ToggleColorscheme()

" ------------------------------------------------------------------------------
"  Package Configuration
" ------------------------------------------------------------------------------
"  ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ }

"  Deoplete
let g:deoplete#enable_at_startup = 1

" Neosnippet
" let g:neosnippet#enable_completed_snippet = 1

" Echodoc
let g:echodoc#enable_at_startup = 1

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
      \ 'elixir': ['elixir_ls'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
      \ }
let s:elixir_ls_bin = '/usr/local/bin/elixir_ls'
let g:LanguageClient_useVirtualText = 1

augroup vimrc
  autocmd!
  autocmd BufWritePre *.ex,*.exs :call LanguageClient#textDocument_formatting_sync()
augroup end

nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>ls :call LanguageClient#textDocument_signatureHelp()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

" tmuxline
let g:tmuxline_powerline_separators = 0

" FZF
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

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Lightline
let g:lightline = {}
let g:lightline.active = {
      \   'left': [[ 'mode', 'paste' ], [ 'git', 'readonly'], ['filename', 'modified' ]],
      \   'right': [
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \     ['obsession', 'percent', 'lineinfo'],
      \     ['fileformat'], ['method', 'filetype'],
      \   ]
      \ }
let g:lightline.component = {
      \   'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \   'fileinfo': '%{&ff}[%{&fenc!=#""?&fenc:&enc}]',
      \   'filename': '%t',
      \   'lineinfo': '%3l:%-2v ',
      \   'mode': '%{lightline#mode()}',
      \   'modified': '[%M]',
      \   'obsession': '%{ObsessionStatus()}',
      \   'paste': '%{&paste?"PASTE":""}',
      \   'percent': '%3p%% ☰ ',
      \   'readonly': '%R',
      \ }
let g:lightline.component_function = {
      \   'git': 'LightlineGit',
      \   'method': 'NearestMethodOrFunction',
      \   'filetype': 'LightlineFiletype',
      \   'fileformat': 'LightlineFileformat',
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.subseparator = {
      \   'left': '',
      \   'right': '',
      \ }

function! LightlineGit()
  return ' ' . fugitive#Head()
endfunction

function! LightlineFiletype()
  if (strlen(&filetype))
    return &filetype . ' ' . WebDevIconsGetFileTypeSymbol()
  else
    return 'no ft'
  endif
endfunction

function! LightlineFileformat()
  return &fileformat. ' ' . WebDevIconsGetFileFormatSymbol()
endfunction

" Vista
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" autopairs
let g:closetag_filetypes = 'html,eelixir'

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,eelixir EmmetInstall

" VimWiki
let s:personal_wiki = {
      \ 'path': '~/wiki',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_toc': 1,
      \ }

let s:work_wiki = {
      \ 'path': '~/newaperio',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_toc': 1,
      \ }

let g:vimwiki_list = [s:personal_wiki, s:work_wiki]

silent call DarkMode()
" silent call LightMode()
