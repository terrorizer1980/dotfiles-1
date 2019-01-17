" ==============================================================================
" Keybindings
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

let mapleader = ","

" Insert mode
" ------------------------------------------------------------------------------
imap jk <ESC>
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Normal mode
" ------------------------------------------------------------------------------
nmap <ESC> :noh<CR>
map <Leader>/ :Ag<CR>
map <Leader>b :Buffers<CR>
map <Leader>f :Files<CR>
nmap <Leader>\ :NERDTreeToggle<CR>
nmap <Leader>m :silent make<CR>
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> t<C-t> :TestLast<CR>
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-s> :TestSuite<CR>

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

