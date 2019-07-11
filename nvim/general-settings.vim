" ==============================================================================
" General Settings
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Indentation
" ------------------------------------------------------------------------------
set autoindent                      " Copy indent from current line when starting a new line
set expandtab                       " Insert proper amount of spaces in Insert mode
set shiftwidth=2                    " Number of spaces to use for each step of (auto)indent
set smartindent                     " Intelligently indent new lines
set softtabstop=2                   " Number of spaces per <Tab> while editing
set tabstop=2                       " Number of spaces per <Tab>

" Searching
" ------------------------------------------------------------------------------
set inccommand=split                " Preview substitutions in a temporary split
set ignorecase                      " Ignore case when searching
set smartcase                       " Don't ignore case when searching with mixed case

" Swapfiles/backups
" --------------------------------------------------------------------------
set nobackup                        " Don't create a backup before overwriting a file
set noswapfile                      " Don't create a swapfile for a new buffer

" Color
" ------------------------------------------------------------------------------
set background=dark                 " Use light-on-dark colors
set termguicolors                   " Use 24-bit color
syntax enable                       " Enable syntax processing
colorscheme gruvbox                 " Set the colorscheme

" Line numbers
" ------------------------------------------------------------------------------
set number                          " Show line numbers
set relativenumber                  " Show relative line numbers

" Splits
" ------------------------------------------------------------------------------
set splitbelow                      " Open horizontal splits below current window
set splitright                      " Open vertical splits to the right of the current window

" Folds
" ------------------------------------------------------------------------------
set foldenable                      " Enable folding
set foldlevelstart=5                " Maximum fold depth open by default
set foldnestmax=10                  " Maximum allowed fold depth

" Misc
" ------------------------------------------------------------------------------
set cursorline                      " Highlight current line
set fillchars+=vert:│               " Customize split borders
set noshowmode                      " Don't display editing mode (vim-airline shows this)
set signcolumn=yes                  " Show signs to the left of line numbers
set hidden                          " Hide a buffer when it is abandoned
set updatetime=300                  " TODO
set scrolloff=5                     " Keep a few lines above and below the cursor
