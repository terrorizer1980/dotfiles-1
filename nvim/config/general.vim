" General settings
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" User Interface {{{
let g:netrw_banner=0           " No netrw banner
set cursorline                 " Highlight current line
set fillchars+=vert:│          " Customize split borders
set noshowmode                 " Don't display editing mode below status bar (vim-airline shows this)
set number                     " Show line numbers
set relativenumber             " Show relative line numbers
set signcolumn=yes             " Show signs to the left of line numbers
set splitbelow                 " Open horizontal splits below current window
set splitright                 " Open vertical splits to the right of the current window
" }}} ----------------------------------------------------------------
" Backups {{{
set backupcopy=yes             " Overwrites original file with backup
set nobackup                   " Don't keep backups around
set noswapfile                 " Don't use swapfiles
set nowritebackup              " Don't create a backup before writing a file
" }}} ----------------------------------------------------------------
" Searching {{{
set ignorecase                 " Ignore case when searching
set smartcase                  " Ignore case when searching lowercase
" }}} ----------------------------------------------------------------
" Folds {{{
set foldenable                 " Enable folding
set foldlevelstart=5           " Maximum fold depth open by default
set foldnestmax=10             " Maximum allowed fold depth  
" }}} ----------------------------------------------------------------
" Indentation {{{
set autoindent                 " Copy indent from current line when starting a new line
set expandtab                  " Insert proper amount of spaces in Insert mode
set shiftwidth=2               " Number of spaces to use for each step of (auto)indent
set smartindent                " Intelligently indent new lines
set smarttab                   " Insert correct number of blanks on <Tab>; delete them on <BS>
set softtabstop=2              " Number of spaces per <Tab> while editing
set tabstop=2                  " Number of spaces per <TAB>
" }}} ----------------------------------------------------------------
" Miscellany {{{
set modelines=1                " TODO Add description
set encoding=utf-8             " Set character encoding
filetype plugin on               " Enable the native filetype plugin
set wildignore+=*/tmp/*,*.so,
            \*.swp,*.zip       " Set wildcard ignores
set inccommand=nosplit         " TODO Add description
highlight Comment cterm=italic " Italic comments
highlight Todo cterm=italic    " Italic TODOs
" }}} ----------------------------------------------------------------

" vim:foldmethod=marker:foldlevel=0
