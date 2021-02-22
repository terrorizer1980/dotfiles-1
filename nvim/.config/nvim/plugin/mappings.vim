" ----------------------------------------------------------
" Commands
" ----------------------------------------------------------

" Map <Leader> to <Space>
let mapleader = ' '

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

" Replace word under the cursor, by buffer or line
nnoremap <Leader>rb <Cmd>%s/\\<<C-r><C-w>\\>/
nnoremap <Leader>rl <Cmd>s/\\<<C-r><C-w>\\>/

" Yank until the end of the line
nnoremap Y y$

" Close the quickfix or location list
nnoremap <Leader>cc <Cmd>cclose<CR>
nnoremap <Leader>cl <Cmd>lclose<CR>

" Window managemnet
nnoremap <Leader>wq <Cmd>q<CR>
nnoremap <Leader>ws <Cmd>split<CR>
nnoremap <Leader>wv <Cmd>vsplit<CR>
nnoremap <Leader>wo <C-w>o

" Buffer management
nnoremap <Leader>bd <Cmd>bdelete<CR>
nnoremap <Leader>bh <Cmd>Startify<CR>
nnoremap <Leader>bn <Cmd>bnext<CR>
nnoremap <Leader>bp <Cmd>bprevious<CR>

" Telescope
nnoremap <Leader>fb  <Cmd>lua require("telescope.builtin").buffers({show_all_buffers = true})<CR>
nnoremap <Leader>ff  <Cmd>lua require("telescope.builtin").find_files()<CR>
nnoremap <Leader>fg  <Cmd>lua require("telescope.builtin").live_grep()<CR>
nnoremap <Leader>fh  <Cmd>lua require("telescope.builtin").help_tags()<CR>
nnoremap <Leader>fk  <Cmd>lua require("telescope.builtin").keymaps()<CR>
nnoremap <Leader>fo  <Cmd>lua require("telescope.builtin").vim_options()<CR>
nnoremap <Leader>fr  <Cmd>lua require("telescope.builtin").registers()<CR>
nnoremap <Leader>flr <Cmd>lua require("telescope.builtin").lsp_references()<CR>
nnoremap <Leader>fls <Cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>
nnoremap <Leader>flS <Cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>
