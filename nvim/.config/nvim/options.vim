set cursorline              " Highlight the screen line of the cursor with CursorLine
set expandtab               " Use the appropriate number of spaces to insert a <Tab>
set fillchars+=vert:│       " Characters to fill the statuslines and vertical separators
set foldmethod=marker       " Markers are used to specify folds.
set grepprg=rg\ --vimgrep   " Program to use for the `:grep` command
set hidden                  " Abandon buffers when they become hidden
set ignorecase              " Ignore case in search patterns
set inccommand=split        " Shows partial off-screen substitutions in a preview window
set noshowmode              " Hide mode indicator
set noswapfile              " Don't use swapfiles
set number                  " Print the line number in front of each line
set relativenumber          " Show the cursor-relative line number in front of each line
set rtp+=/usr/local/opt/fzf " Append FZF dir to runtimepath
set scrolloff=5             " Minimal number of screen lines to keep above and below the cursor
set shiftwidth=2            " Number of spaces to use for each step of (auto)indent
set shortmess+=c            " Don't give `ins-completion-menu` messages
set signcolumn=yes:2        " Always show the signcolumn with two spaces
set smartcase               " Override the `ignorecase` option if the pattern contains upper case characters
set smartindent             " Do smart autoindenting when starting a new line
set softtabstop=2           " Number of spaces that a <Tab> counts for while performing editing operations
set splitbelow              " Vertically splitting a window will put the new window below the current one
set splitright              " Horizaontally splitting a window will put the new window right of the current one
set tabstop=2               " Number of spaces that a <Tab> in the file counts for
" set termguicolors           " Enables 24-bit RGB color in the `TUI`
set undofile                " Persists undo history and restore on buffer read
set updatetime=1000         " Milliseconds after which to trigger swap write/`CursorHold`

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
