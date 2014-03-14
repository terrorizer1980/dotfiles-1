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
Bundle 'tpope/vim-sensible'

"
" Powerline
"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set rtp+=$POWERLINE_HOME/bindings/vim

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
