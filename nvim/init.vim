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
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'alvan/vim-closetag'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'challenger-deep-theme/vim', {'name': 'challenger-deep'}
Plug 'dense-analysis/ale'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'ncm2/float-preview.nvim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
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

call plug#end()

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

" set completeopt=noinsert,menuone,noselect

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

command! ToggleColorscheme call ToggleColorscheme()

function! DarkMode()
  set background=dark
  colorscheme challenger_deep
  let g:lightline.colorscheme = "challenger_deep"
  highlight LineNr guibg=#1D1D30
  highlight SignColumn guibg=#1D1D30
  highlight StatusLine guibg=NONE
  highlight StatusLineNC guibg=NONE
  call LightlineRefresh()
  echo "Good night"
endfunction

function! LightMode()
  set background=light
  colorscheme solarized8_flat
  let g:lightline.colorscheme = "solarized"
  call LightlineRefresh()
  echo "Good morning"
endfunction

function LightlineRefresh()
  call lightline#init()
  call lightline#colorscheme()
endfunction

" ------------------------------------------------------------------------------
"  Package Configuration
" ------------------------------------------------------------------------------
"  ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'javascript': ['prettier'],
      \ 'css': ['prettier'],
      \ }

"  Deoplete
let g:deoplete#enable_at_startup = 1

" Echodoc
let g:echodoc#enable_at_startup = 1

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {'elixir': ['/usr/local/bin/elixir_ls']}
let s:elixir_ls_bin = '/usr/local/bin/elixir_ls'

augroup vimrc
  autocmd!
  autocmd BufWritePre *.ex,*.exs :call LanguageClient#textDocument_formatting_sync()
augroup end

nnoremap <leader>ld :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
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
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'git', 'readonly'], ['filename', 'modified' ]],
      \   'right': [['lineinfo'], ['percent'], ['method', 'obsession', 'filetype', 'fileinfo']]
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
      \   'git': 'LightlineGit',
      \   'method': 'NearestMethodOrFunction',
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': '',
      \ }
      \ }

function! LightlineGit()
  return " " . fugitive#Head()
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

silent call DarkMode()
