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

""
"" Backups
""
set backupdir=~/tmp/vim,/tmp,.
set directory=~/tmp/vim,/tmp,.

"
" NeoBundle
"
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'kien/ctrlp.vim'
call neobundle#end()
filetype off
filetype plugin indent on
NeoBundleCheck

"
" Powerline
"
"set rtp+=/home/nick/.local/lib/python3.3/site-packages/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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
hi LineNr ctermfg=grey

"
" Editor
"
set nu

"
" File Types
"
autocmd FileType markdown setlocal textwidth=80

"
" Hotkey functions
"
" Edit .vimrc
nmap <silent> <F12> :if bufloaded($HOME . '/.vimrc') && bufnr(@%) == bufnr($HOME.'/.vimrc') <CR>w<CR>execute 'source ' . $HOME . '/.vimrc'<CR>bd<CR>else<CR>execute 'tabe ' . $HOME . '/.vimrc'<CR>endif<CR><CR>

" Run Ruby file
nmap <silent> <F10> :w<CR> :!ruby %<CR>

" Switch off highlighting
nmap <silent> <F9> :nohl<CR>

" Prettify punctuation
nmap <silent> <F8> :%s/\v"(.*)"/“\1”/ge<CR> :%s/'/’/ge<CR> :%s/\v--([^-])/—\1/ge<CR>
