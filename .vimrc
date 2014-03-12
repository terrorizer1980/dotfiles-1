set nocompatible
filetype off
filetype plugin indent on

"
" vundle
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-sensible'
Bundle 'edkolev/tmuxline.vim'

"
" vim-airline
"
set laststatus=2
let g:airline_theme='dark'
let g:airline_left_sep=''
let g:airline_right_sep=''

"
" tmuxline.vim
"
let g:tmuxline_separators = {
  \ 'left' : '',
  \ 'left_alt': '',
  \ 'right' : '',
  \ 'right_alt' : '',
  \ 'space' : ' '}

"
" NERDTree
"
let NERDTreeShowHidden=1

"
" Colors
"
syntax on
colorscheme default 
set bg=dark
hi Search cterm=NONE ctermfg=black ctermbg=yellow

"
" Editor
"
set nu

"
" Hotkey functions
"
" Josh's Magic Vim Config Edit Key of Wonder
nmap <silent> <F12> :if bufloaded($HOME . '/.vimrc.after') && bufnr(@%) == bufnr($HOME.'/.vimrc.after') <CR>w<CR>execute 'source ' . $HOME . '/.vimrc.after'<CR>bd<CR>else<CR>execute 'tabe ' . $HOME . '/.vimrc.after'<CR>endif<CR><CR>

" Run Ruby file
nmap <silent> <F10> :w<CR> :!ruby %<CR>

" Switch off highlighting
nmap <silent> <F9> :nohl<CR>
