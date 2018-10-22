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
nmap <Leader>/ :Denite grep
nmap <Leader>\ :NERDTreeToggle<CR>
nmap <Leader>b :Denite buffer<CR>
nmap <Leader>f :Denite file/rec<CR>
nmap <Leader>m :silent make<CR>
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-g> :TestVisit<CR>
nmap <silent> t<C-t> :TestLast<CR>
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-s> :TestSuite<CR>
