" Basic Setup
set nocompatible      " Use vim, no vi defaults
set encoding=utf-8    " Set default encoding to UTF-8
set history=1000      " Store lots of :cmdline history
set syntax=on         " Enable syntax highlighting

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Backups
set noswapfile
set nobackup
set nowb

" Editor
set nowrap                   " don't wrap lines
set number                   " Show line numbers
set relativenumber           " Show relative line numbers
set ruler                    " Show line and column number
syntax enable                " Turn on syntax highlighting allowing local overrides
set listchars=""             " Reset the listchars
set listchars=tab:\ \        " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.       " show trailing spaces as dots
set listchars+=extends:>     " The character to show in the last column when wrap is
                             " off and the line continues beyond the right of the screen
set listchars+=precedes:<    " The character to show in the last column when wrap is

" Font
set guifont=InputMono\ ExLight\ Plus\ Nerd\ File\ Types:h13

" File type settings
au BufRead,BufNewFile *.markdown setlocal textwidth=80

" Hotkey functions
"" Edit .vimrc
nmap <silent> <F12> :if bufloaded($HOME . '/.vimrc') && bufnr(@%) == bufnr($HOME.'/.vimrc') <CR>w<CR>execute 'source ' . $HOME . '/.vimrc'<CR>bd<CR>else<CR>execute 'tabe ' . $HOME . '/.vimrc'<CR>endif<CR><CR>
"" Run Ruby file
nmap <silent> <F10> :w<CR> :!ruby %<CR>
"" Run Python file
nmap <silent> <F11> :w<CR> :!python %<CR>
"" Switch off highlighting
nmap <silent> <F9> :nohl<CR>
"" Toggle paste mode 
set pastetoggle=<F2>

" Vim-Plug 
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'chriskempson/base16-vim'
Plug 'luochen1990/rainbow'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-dispatch'
Plug 'luochen1990/rainbow'
Plug 'ngmy/vim-rubocop'
Plug 'mileszs/ack.vim'
call plug#end()

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Colors
syntax on
set background=dark
colorscheme base16-default
let g:rainbow_active=1

" ack.vim + The Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" NERDTree
let NERDTreeShowHidden=1

" Ctrl-P ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" Syntastic
let g:syntastic_haml_checkers = ['haml_lint']
