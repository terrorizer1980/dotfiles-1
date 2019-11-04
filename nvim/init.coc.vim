scriptencoding utf-8

"                 __
"  __          __/\ \__               __
" /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
" \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"  \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"   \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"    \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/
"
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

echo "LSP client: Coc"

call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'alvan/vim-closetag'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'dunstontc/vim-vscode-theme'
Plug 'edkolev/tmuxline.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'rakr/vim-two-firewatch'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vimwiki/vimwiki'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

call plug#end()

set background=dark
colorscheme two-firewatch

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
source $HOME/.config/nvim/config-plugins.vim

" ------------------------------------------------------------------------------
"  Package Configuration
" ------------------------------------------------------------------------------
"  ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ }

" tmuxline
let g:tmuxline_powerline_separators = 0

" FZF
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \ }

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Vista
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" autopairs
let g:closetag_filetypes = 'html,eelixir'

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,eelixir EmmetInstall

" VimWiki
let s:personal_wiki = {
      \ 'path': '~/wiki',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_toc': 1,
      \ }

let s:work_wiki = {
      \ 'path': '~/newaperio',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_toc': 1,
      \ }

let g:vimwiki_list = [s:personal_wiki, s:work_wiki]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

augroup vimrc
  autocmd!
  autocmd BufWritePre *.ex,*.exs :LspDocumentFormat
augroup end
