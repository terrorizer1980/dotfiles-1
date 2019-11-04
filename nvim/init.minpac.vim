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

" --------------------------------------------------------------------------------------------------
" Packages
" --------------------------------------------------------------------------------------------------
packadd minpac

if !exists('*minpac#init')
  " no minpac; display a helpful message
else
  call minpac#init()
  call minpac#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
  call minpac#add('Shougo/echodoc.vim')
  call minpac#add('Shougo/neosnippet-snippets')
  call minpac#add('Shougo/neosnippet.vim')
  call minpac#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': {-> system('bash install.sh')}})
  call minpac#add('challenger-deep-theme/vim', {'name': 'challenger-deep'})
  call minpac#add('dense-analysis/ale')
  call minpac#add('edkolev/tmuxline.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('liuchengxu/vista.vim')
  call minpac#add('ncm2/float-preview.nvim')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
end

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" --------------------------------------------------------------------------------------------------
"  General Configuration
" --------------------------------------------------------------------------------------------------
set completeopt=noinsert,menuone,noselect

set background=light  " Set background (light/dark)
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

colorscheme solarized8_flat
" colorscheme challenger_deep
" highlight SignColumn guibg=#0F0F22
" highlight StatusLine guibg=NONE
" highlight StatusLineNC guibg=NONE

let mapleader=","

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :Rg<CR>
nnoremap <Esc> :nohlsearch<CR>

" --------------------------------------------------------------------------------------------------
"  Package Configuration
" --------------------------------------------------------------------------------------------------
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
" call g:deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')

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

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" --------------------------------------------------------------------------------------------------
" FZF
" --------------------------------------------------------------------------------------------------
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

" --------------------------------------------------------------------------------------------------
" Lightline
" --------------------------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'solarized',
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

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" --------------------------------------------------------------------------------------------------
"  Patch Runtimepath
" --------------------------------------------------------------------------------------------------
function! s:BuildRuntimepath(paths)
  let list = split(&rtp, ",")
  let i = 0

  for p in list
    if p =~? '.*/after$'
      break
    end
    let i = i + 1
  endfor
  let rtp = ""
  let rtp .= list[0] . ","
  let rtp .= join(a:paths, ",") . ","
  let rtp .= join(list[1:i-1], ",") . ","
  let rtp .= join(list[i:len(list)-i], ",") . ","
  let rtp .= list[-1]

  return rtp
endfunction

let &rtp = s:BuildRuntimepath(["/usr/local/opt/fzf"])
