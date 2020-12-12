" Map <Leader> to <Space>
let mapleader=" "

" Navigate window splits with the arrow keys
nnoremap <Right> <C-w>l
nnoremap <Left>  <C-w>h
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j

" Clear search highlighting on <Esc>
nnoremap <silent> <Esc> :nohlsearch<CR>

" Replace word under the cursor, by buffer or line
nnoremap <Leader>ra :%s/\<<C-r><C-w>\>/
nnoremap <Leader>rl :s/\<<C-r><C-w>\>/

" Yank until the end of the line
noremap Y y$

" Close the quickfix or location list
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>lc :lclose<CR>

" Quickly quit the current window
nnoremap <silent> <Leader>q :q<CR>
