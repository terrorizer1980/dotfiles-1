""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

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
filetype off
filetype plugin indent on

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
