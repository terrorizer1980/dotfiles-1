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

let s:plug_dir = '~/.local/share/nvim/plugged'

" ------------------------------------------------------------------------------
" Packages
" ------------------------------------------------------------------------------
call plug#begin(s:plug_dir)

Plug '/usr/local/opt/fzf'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'challenger-deep-theme/vim', {'name': 'challenger-deep'}
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-zoom'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/vista.vim'
Plug 'romainl/Apprentice'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'simnalamburt/vim-mundo'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
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
set foldenable        " Enable folding
set foldlevelstart=5  " Maximum fold depth open by default
set foldmethod=marker " Use character sequences to indicate folds
set foldnestmax=10    " Maximum allowed fold depth
set hidden            " Hide a buffer when it's abandoned
set ignorecase        " Ignore case when searching
set inccommand=split  " Preview file-wide search/replace in a split
" set nobackup          " Don't create a backup before overwriting a file
set noshowmode        " Don't display editing mode (lightline handles this)
" set noswapfile        " Don't create a swapfile for a new buffer
set number            " Show line numbers
set relativenumber    " Show relative line numbers
set scrolloff=5       " Keep a few lines above and below the cursor
set shiftwidth=2      " Number of spaces to use for each step of (auto)indent
set shortmess+=c      " Suppress ins-completion-menu messages
set signcolumn=yes    " Show signs to the left of line numbers
set smartcase         " Don't ignore case when searching with mixed case
set smartindent       " Intelligently indent new lines
set softtabstop=2     " Number of spaces per <Tab> while editing
set splitbelow        " Open horizontal splits below current window
set splitright        " Open vertical splits to the right of the current window
set tabstop=2         " Number of spaces per <Tab>
set termguicolors     " Use 24-bit color
set undofile          " Persist undo history between sessions

let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 30

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
nnoremap <Leader>\ :Lexplore<CR>

" ------------------------------------------------------------------------------
"  Package Configuration
" ------------------------------------------------------------------------------
"  ALE
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ 'typescript.tsx': ['tslint'],
      \ }

let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'javascript': ['prettier'],
      \ 'css': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescript.tsx': ['prettier'],
      \ }

"  Deoplete
let g:deoplete#enable_at_startup = 1

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" Neosnippet
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
      \ 'elixir': ['elixir_ls'],
      \ 'javascript': ['typescript-language-server', '--stdio'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
      \ }

function! s:SetLSPShortcuts()
  nnoremap K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>ld :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction

augroup lsp
  autocmd!
  autocmd FileType elixir,typescript,typescript.tsx call s:SetLSPShortcuts()
  autocmd BufWritePre *.ex,*.exs :call LanguageClient#textDocument_formatting_sync()
augroup end

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

" Lightline
let g:lightline = {
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

" ------------------------------------------------------------------------------
"  Functions & Commands
" ------------------------------------------------------------------------------
function! SetColorscheme(...)
    let l:defaults = {
          \ 'bg': 'dark', 'cs': 'default', 'tc': 'default',
          \ 'll': 'default', 'tm': 'default'
          \ }

  if a:0 == 1
    if a:1 == 'light'
      let l:options = {
            \ 'bg': 'light', 'cs': 'solarized8_flat', 'tc': 'light',
            \ 'll': 'solarized', 'tm': 'solarized_light'
            \ }
    elseif a:1 == 'dark'
      let l:options = {
            \ 'bg': 'dark', 'cs': 'solarized8_flat', 'tc': 'dark',
            \ 'll': 'solarized', 'tm': 'solarized_dark'
            \ }
    elseif a:1 == 'challenger-deep'
      let l:options = {
            \ 'bg': 'dark', 'cs': 'challenger_deep', 'tc': 'challenger-deep',
            \ 'll': 'challenger_deep', 'tm': 'challenger_deep'
            \ }
    elseif a:1 == 'srcery'
      let l:options = {
            \ 'bg': 'dark', 'cs': 'srcery', 'tc': 'srcery',
            \ 'll': 'srcery', 'tm': 'srcery'
            \ }
    elseif a:1 == 'apprentice'
      let l:options = {
            \ 'bg': 'dark', 'cs': 'apprentice', 'tc': 'apprentice',
            \ 'll': 'apprentice', 'tm': 'apprentice'
            \ }
    else
      let l:options = l:defaults
    endif
  else
      let l:options = l:defaults
  endif

  call s:ApplyColorscheme(l:options)
endfunction

function! s:ApplyColorscheme(options)
  let &background = a:options['bg']
  execute 'colorscheme ' . a:options['cs']
  let g:lightline.colorscheme = a:options['ll']
  execute 'silent !tmux source ~/.config/tmux/themes/' . a:options['tm']
  execute 'silent !termcolors ' . a:options['tc']
  call s:RefreshLightline(a:options['ll'])

  if a:options['cs'] == 'challenger_deep'
    " highlight LineNr guibg=#1D1D30
    " highlight SignColumn guibg=#1D1D30
    " highlight StatusLine guibg=NONE
    " highlight StatusLineNC guibg=NONE
  elseif a:options['cs'] == 'default'
    highlight CursorLine guifg=#181818
  endif
endfunction

function! s:RefreshLightline(...)
  if a:0 == 1
    let l:dir = s:plug_dir . '/lightline.vim/autoload/lightline/colorscheme'

    if a:1 == 'solarized'
      execute 'source ' . l:dir . '/solarized.vim'
    elseif a:1 == 'srcery'
      execute 'source ' . l:dir . '/srcery_drk.vim'
    endif
  endif

  call lightline#init()
  call lightline#colorscheme()
endfunction

function! ToggleColorscheme()
  if &background ==# 'dark'
    call SetColorscheme('light')
  else
    call SetColorscheme('dark')
  endif
endfunction

command! ToggleColorscheme call ToggleColorscheme()

call SetColorscheme('challenger-deep')
