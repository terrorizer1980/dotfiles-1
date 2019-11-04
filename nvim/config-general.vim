" ------------------------------------------------------------------------------
"  General Configuration
" ------------------------------------------------------------------------------
set cursorline        " Highlight current line
set expandtab         " Insert proper amount of spaces when inserting a <Tab>
set fillchars+=vert:│ " Customize split borders
set foldenable        " Enable folding set foldlevelstart=5  " Maximum fold depth open by default
set foldmethod=marker " Use character sequences to denote folds
set foldnestmax=10    " Maximum allowed fold depth
set hidden            " Hide a buffer when it is abandoned
set ignorecase        " Ignore case when searching
set inccommand=split  " Preview file-wide search/replace in a split
set nobackup          " Don't create a backup before overwriting a file
set noshowmode        " Don't display editing mode (vim-airline shows this)
set noswapfile        " Don't create a swapfile for a new buffer
set number            " Show line numbers
set relativenumber    " Show relative line numbers
set scrolloff=5       " Keep a few lines above and below the cursor
set shiftwidth=2      " Number of spaces to use for each step of (auto)indent
set shortmess+=c      " TODO
set signcolumn=yes    " Show signs to the left of line numbers
set smartcase         " Don't ignore case when searching with mixed case
set smartindent       " Intelligently indent new lines
set softtabstop=2     " Number of spaces per <Tab> while editing
set splitbelow        " Open horizontal splits below current window
set splitright        " Open vertical splits to the right of the current window
set tabstop=2         " Number of spaces per <Tab>
set termguicolors     " Use 24-bit color
set undofile          " Persist undo history between sessions
set updatetime=300    " Improve coc.nvim diagnostics?

set completeopt=menuone

let mapleader=","

nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lp :call LanguageClient#textDocument_peekDefinition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>ls :call LanguageClient#textDocument_signatureHelp()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
nnoremap <C-]> :call LanguageClient#textDocument_definition()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :Rg<CR>
nnoremap <Esc> :nohlsearch<CR>
nnoremap <Leader>\ :NERDTreeToggle<CR>
