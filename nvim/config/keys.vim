" Keybindings
"
" Author: N. G. Scheurich
" Repo: https://github.com/ngscheurich/dotfiles

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
