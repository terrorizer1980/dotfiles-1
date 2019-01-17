" ==============================================================================
" Settings for Vim
" ==============================================================================
"
" This sets the `colorscheme` so it must be sourced after
" vim-plug has done its thing.
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Colors
" ------------------------------------------------------------------------------
set background=dark         " Use light-on-dark colors
set termguicolors           " Use 24-bit color

syntax enable               " Enable syntax processing

let g:one_allow_italics = 1 " Enable italics for colorscheme

" Set colorscheme
colorscheme one

" Folds
" ------------------------------------------------------------------------------
set foldenable              " Enable folding
set foldlevelstart=5        " Maximum fold depth open by default
set foldnestmax=10          " Maximum allowed fold depth

" Indentation
" ------------------------------------------------------------------------------
set autoindent              " Copy indent from current line when starting a new line
set expandtab               " Insert proper amount of spaces in Insert mode
set shiftwidth=2            " Number of spaces to use for each step of (auto)indent
set smartindent             " Intelligently indent new lines
set softtabstop=2           " Number of spaces per <Tab> while editing
set tabstop=2               " Number of spaces per <Tab>

" Interface
" ------------------------------------------------------------------------------
set cursorline              " Highlight current line
set fillchars+=vert:│       " Customize split borders
set noshowmode              " Don't display editing mode (vim-airline shows this)
set signcolumn=yes          " Show signs to the left of line numbers

" Line numbers
" ------------------------------------------------------------------------------
set number                  " Show line numbers
set relativenumber          " Show relative line numbers

" Splits
" ------------------------------------------------------------------------------
set splitbelow              " Open horizontal splits below current window
set splitright              " Open vertical splits to the right of the current window

" Searching
" ------------------------------------------------------------------------------
set inccommand=split        " Preview substitutions in a temporary split
set ignorecase              " Ignore case when searching
set smartcase               " Don't ignore case when searching with mixed case

" Swapfiles/backups
" ------------------------------------------------------------------------------
set nobackup                " Don't create a backup before overwriting a file
set noswapfile              " Don't create a swapfile for a new buffer
