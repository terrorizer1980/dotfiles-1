" vim: nowrap
scriptencoding utf-8

" Neovim VS Code configuration
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo:   https://github.com/ngscheurich/dotfiles

if exists('*minpac#init')
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	call minpac#add('justinmk/vim-sneak')
	call minpac#add('tpope/vim-abolish')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-eunuch')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-rsi')
	call minpac#add('tpope/vim-speeddating')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-unimpaired')
endif

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
