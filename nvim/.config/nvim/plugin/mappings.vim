" ==========================================================
" Mappings
" ==========================================================

" Navigate window splits with the arrow keys
nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l

" Resize splits with meta + the arrow keys
nnoremap <M-Up>    <Cmd>resize +10<CR>
nnoremap <M-Down>  <Cmd>resize -10<CR>
nnoremap <M-Right> <Cmd>vertical resize +10<CR>
nnoremap <M-Left>  <Cmd>vertical resize -10<CR>

" Clear search highlighting on <Esc>
nnoremap <Esc> <Cmd>nohlsearch<CR>

" Yank until the end of the line
nnoremap Y y$

" Window managemnet
nnoremap <Leader>wq <Cmd>q<CR>
nnoremap <Leader>ws <Cmd>split<CR>
nnoremap <Leader>wv <Cmd>vsplit<CR>
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>w= <C-w>=

" Buffer management
nnoremap <Leader>bd <Cmd>bdelete<CR>
nnoremap <Leader>bh <Cmd>Startify<CR>
nnoremap <Leader>bn <Cmd>bnext<CR>
nnoremap <Leader>bp <Cmd>bprevious<CR>

" Toggles
nnoremap <Leader>un <Cmd>lua require("ngs.util").toggle_line_numbers()<CR>
nnoremap <Leader>us <Cmd>lua require("ngs.util").toggle_sign_column()<CR>
