local utils = require('utils')
local nnoremap = utils.nnoremap

local function leader_map(lhs, rhs)
  nnoremap('<Leader>' .. lhs, rhs, {silent = true})
end

-- Map <Leader> to <Space>
vim.g.mapleader = ' '

-- Navigate window splits with the arrow keys
nnoremap('<Left>',  '<C-w>h')
nnoremap('<Down>',  '<C-w>j')
nnoremap('<Up>',    '<C-w>k')
nnoremap('<Right>', '<C-w>l')

-- Clear search highlighting on <Esc>
nnoremap('<Esc>', '<Cmd>nohlsearch<CR>', {silent = true})

-- Replace word under the cursor, by buffer or line
leader_map('rb', ':%s/\\<<C-r><C-w>\\>/')
leader_map('rl', ':s/\\<<C-r><C-w>\\>/')

-- Yank until the end of the line
nnoremap('Y', 'y$')

-- Close the quickfix or location list
leader_map('cc', '<Cmd>cclose<CR>')
leader_map('cl', '<Cmd>lclose<CR>')

-- Window managemnet
leader_map('wq', '<Cmd>q<CR>')
leader_map('ws', '<Cmd>split<CR>')
leader_map('wv', '<Cmd>vsplit<CR>')

-- Buffer management
leader_map('bd', '<Cmd>bdelete<CR>')
leader_map('bh', '<Cmd>Startify<CR>')
leader_map('bn', '<Cmd>bnext<CR>')
leader_map('bp', '<Cmd>bprevious<CR>')

-- Package management
vim.cmd "command! PackerInstall packadd packer.nvim | lua require('plugins').install()"
vim.cmd "command! PackerUpdate packadd packer.nvim  | lua require('plugins').update()"
vim.cmd "command! PackerSync packadd packer.nvim    | lua require('plugins').sync()"
vim.cmd "command! PackerClean packadd packer.nvim   | lua require('plugins').clean()"
vim.cmd "command! PackerCompile packadd packer.nvim | lua require('plugins').compile()"
