let mapleader=" "

nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j

nnoremap <silent> <Esc> :nohlsearch<CR>

" nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/
" nnoremap <Leader>rl :s/\<<C-r><C-w>\>/

noremap Y y$

nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>lc :lclose<CR>

nnoremap <silent> <Leader>e :FloatermNew ranger<CR>

nnoremap <silent> <Leader>q :q<CR>

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
