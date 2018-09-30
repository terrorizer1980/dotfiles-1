" Sets configuration options for:
"
" - Backups
" - Colors
" - Folds
" - Indentation
" - User Interface
" - Searching
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" Backups
set noswapfile                " Don't use swapfiles
set nowritebackup             " Don't create a backup before writing a file

" Colors
colorscheme srcery      		  " Set colorscheme
set background=dark           " Use light-on-dark colors
set termguicolors             " Use 24-bit color if the terminal supports it
syntax enable                 " Enable syntax processing

" Folds
set foldenable                " Enable folding
set foldlevelstart=5          " Maximum fold depth open by default
set foldnestmax=10            " Maximum allowed fold depth

" Indentation
set autoindent                " Copy indent from current line when starting a new line
set expandtab                 " Insert proper amount of spaces in Insert mode
set shiftwidth=2              " Number of spaces to use for each step of (auto)indent
set smartindent               " Intelligently indent new lines
set smarttab                  " Insert correct number of blanks on <Tab>; delete them on <BS>
set softtabstop=2             " Number of spaces per <Tab> while editing
set tabstop=2                 " Number of spaces per <Tab>

" User Interface
hi Comment cterm=italic       " Italicize comments
hi Todo cterm=italic          " Italicize TODOs
let g:netrw_banner=0          " No netrw banner
set cursorline                " Highlight current line
set colorcolumn=              " Don't highlight any columns
set fillchars+=vert:│         " Customize split borders
set noshowmode                " Don't display editing mode (vim-airline shows this)
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set signcolumn=yes            " Show signs to the left of line numbers
set splitbelow                " Open horizontal splits below current window
set splitright                " Open vertical splits to the right of the current window

" Searching
set ignorecase                " Ignore case when searching
set smartcase                 " Ignore case when searching lowercase

" Miscellany
filetype plugin on            " Enable the native filetype plugin
set encoding=utf-8            " Set character encoding
set inccommand=nosplit        " Don't show incremental command results in a split
set modelines=1               " Allow Vim to execute modelines on file open
set wildignore+=*/tmp/*,*.so, " Set wildcard ignores
            \*.swp,*.zip

