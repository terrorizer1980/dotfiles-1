-- ==========================================================
-- Nappings
-- ==========================================================

local map = require("ngs.util").map


-- Map <Leader> to <Space>
vim.g.mapleader = " "

-- Navigate window splits with the arrow keys
map("n", "<Left>",  "<C-w>h")
map("n", "<Down>",  "<C-w>j")
map("n", "<Up>",    "<C-w>k")
map("n", "<Right>", "<C-w>l")

-- Resize splits with meta + the arrow keys
map("n", "<M-Up>",    "<Cmd>resize +10<CR>")
map("n", "<M-Down>",  "<Cmd>resize -10<CR>")
map("n", "<M-Right>", "<Cmd>vertical resize +10<CR>")
map("n", "<M-Left>",  "<Cmd>vertical resize -10<CR>")

-- Quickfix and location lists
-- nmap <C-\> <Plug>(qf_qf_toggle)
-- nmap <Leader>\ <Plug>(qf_loc_toggle)

-- Clear search highlighting on <Esc>
map("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Yank until the end of the line
map("n", "Y", "y$")

-- Toggles
map("n", "<Leader>tq", "<Cmd>lua require('ngs.util').toggle_list('quickfix')<CR>")
map("n", "<Leader>tl", "<Cmd>lua require('ngs.util').toggle_list('location')<CR>")

-- Window managemnet
map("n", "<Leader>wq", "<Cmd>q<CR>")
map("n", "<Leader>ws", "<Cmd>split<CR>")
map("n", "<Leader>wv", "<Cmd>vsplit<CR>")
map("n", "<Leader>wo", "<C-w>o")
map("n", "<Leader>w=", "<C-w>=")

-- Buffer management
map("n", "<Leader>bd", "<Cmd>bdelete<CR>")
map("n", "<Leader>bh", "<Cmd>Startify<CR>")
map("n", "<Leader>bn", "<Cmd>bnext<CR>")
map("n", "<Leader>bp", "<Cmd>bprevious<CR>")

