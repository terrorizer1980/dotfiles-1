"             __
"     __  __ /\_\    ___ ___   _ __   ___
"    /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"  __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
" /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
" \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"
"
"
" Author: N. G. Scheurich
" Repo: https://github.com/ngscheurich/dotfiles


function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/dotfiles/vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin('~/.local/share/nvim/plugged')"
call s:SourceConfigFilesIn('plugins')
call plug#end()

" Deoplete {{{
 let g:deoplete#enable_at_startup = 1
" let g:echodoc_enable_at_startup = 0
" autocmd CompleteDone * pclose

call deoplete#custom#set('buffer', 'mark', '')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⦾')
call deoplete#custom#set('file', 'mark', '')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '✄')
call deoplete#custom#set('alchemist', 'mark', '')
call deoplete#custom#set('tag', 'mark', '')
call deoplete#custom#set('around', 'mark', '♻')

call deoplete#custom#set('alchemist', 'rank', 9999)
" }}}

" Colors {{{

set background=dark
syntax enable              "  Enable syntax processing
let g:two_firewatch_italics=1
colorscheme two-firewatch  " Set colorscheme


if (has("termguicolors"))
    set termguicolors       " Use 24-bit color if the terminal supports it
endif

highlight VertSplit guifg=#4b5263
highlight EndOfBuffer guifg=#282C34

" Customize fzf colors
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
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
            \ 'header':  ['fg', 'Comment'] }

" }}}
" Indentation {{{

set autoindent    " Copy indent from current line when starting a new line
set expandtab     " Insert proper amount of spaces in Insert mode
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent
set smartindent   " Intelligently indent new lines
set smarttab      " Insert correct number of blanks on <Tab>; delete them on <BS>
set softtabstop=2 " Number of spaces per <Tab> while editing
set tabstop=2     " Number of spaces per <TAB>

" }}}
" User Interface {{{

let g:netrw_banner=0       " No netrw banner
set cursorline             " Highlight current line
set fillchars+=vert:│      " Customize split borders
set guifont=Fira\ Code:h13 " Set font for GUI Vim
set noshowmode             " Don't display editing mode below status bar (vim-airline shows this)
set number                 " Show line numbers
set relativenumber         " Show relative line numbers
set signcolumn=yes         " Show signs to the left of line numbers
set splitbelow             " Open horizontal splits below current window
set splitright             " Open vertical splits to the right of the current window

" }}}
" Folds {{{

set foldenable       " Enable folding
set foldlevelstart=5 " Maximum fold depth open by default
set foldnestmax=10   " Maximum allowed fold depth  

" Toggle folds with <space>
nnoremap <space> za

" }}}
" Keybindings {{{

" Map leader to comma
let mapleader = ","

" Navigate popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Show current file in Finder
nmap <Leader>d :!open %/..<CR>

" Switch to next/previous tab
nmap <Leader>h :tabprevious <CR>
nmap <Leader>l :tabnext <CR>

" Clear highlighting on <ESC>
map <ESC> :noh<CR>

" Next/previous tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Quickly press jk to leave Insert mode
inoremap jk <ESC>

" Toggle maximized window
map <Leader>w :MaximizerToggle<CR>

" Common fzf.vim
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>/ :Ag<CR>

" Common vim-fugitive commands
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>
map <Leader>gl :Glog<CR>
map <Leader>gd :Gdiff<CR>

" Toggle NERDTree
map <Leader>\ :NERDTreeToggle<CR>

" Toggle tagbar
nmap <Leader>t :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Enter cmdline mode with semicolon
nnoremap ; :

" Go to next ALE error
nmap <silent> <Leader>e <Plug>(ale_next_wrap)

" `make` current file
map <Leader>m :silent make<CR>

" }}}
" Backups {{{

set backupcopy=yes " Overwrites original file with backup; needed for webpack-dev-server HMR
set nobackup       " Don't keep backups around
set noswapfile     " Don't use swapfiles
set nowritebackup  " Don't create a backup before writing a file

" }}}
" Searching {{{

set ignorecase " Ignore case when searching
set smartcase  " Ignore case when searching lowercase

" }}}
" Autocommands {{{
"
" PICO-8 {{{
augroup pico8 
    autocmd FileType pico8 map <Leader>m :!/Applications/PICO-8.app/Contents/MacOS/pico8 -run %<CR>
augroup END
" }}}
" Vimscript {{{
augroup vimscript
    autocmd FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}}
" Ruby {{{
augroup ruby
    autocmd FileType ruby map <Leader>s :call RunCurrentSpecFile()<CR>
augroup END
" }}}
" Elm {{{
augroup elm
    autocmd FileType elm setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}}
" Vue.js {{{
augroup vuejs
    autocmd BufRead,BufNewFile *.vue setfiletype html
augroup END
" }}}

" }}}
" Miscellany {{{

set modelines=1
set encoding=utf-8                       " Set character encoding
filetype plugin on                       " Enable the native filetype plugin
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " Set wildcard ignores
set inccommand=nosplit

" }}}

autocmd VimEnter * call system("tmux source-file ~/.tmux.conf")

highlight Comment cterm=italic " Italic comments.
highlight Comment gui=italic " Italic comments in gui.
highlight Todo cterm=italic " Italic comments.
highlight Todo gui=italic " Italic comments in gui.

" vim:foldmethod=marker:foldlevel=0
