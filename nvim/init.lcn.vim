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

echo "LSP client: LanguageClient-neovim"

call plug#begin('~/.local/share/nvim/plugged')

source $HOME/.config/nvim/plugins.vim

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mike-hearn/base16-vim-lightline'

call plug#end()

source $HOME/.config/nvim/config-general.vim
source $HOME/.config/nvim/config-plugins.vim

" Deoplete
let g:deoplete#enable_at_startup = 1

" Echodoc
let g:echodoc#enable_at_startup = 1

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
      \ 'elixir': ['els'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
      \ }
let s:elixir_ls_bin = '/usr/local/bin/elixir_ls'
let g:LanguageClient_useVirtualText = 1

augroup vimrc
  autocmd!
  autocmd BufWritePre *.ex,*.exs :call LanguageClient#textDocument_formatting_sync()
augroup end

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

function! ToggleColorscheme()
  if &background ==# 'dark'
    call LightMode()
  else
    call DarkMode()
  endif
endfunction

function! DarkMode()
  set background=dark
  colorscheme dark_plus
  let g:lightline.colorscheme = 'dark_plus'
  execute 'silent !termcolors dark'
  execute 'silent !tmux source ~/.tmuxline.dark_plus'
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

function LightlineRefresh()
  call lightline#init()
  call lightline#colorscheme()
endfunction

command! ToggleColorscheme silent call ToggleColorscheme()

silent call DarkMode()
