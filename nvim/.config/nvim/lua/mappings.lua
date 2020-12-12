local utils = require('utils')
local nnoremap = utils.nnoremap

-- Map <Leader> to <Space>
vim.g.mapleader = ' '

-- Navigate window splits with the arrow keys
nnoremap('<Left>',  '<C-w>h')
nnoremap('<Down>',  '<C-w>j')
nnoremap('<Up>',    '<C-w>k')
nnoremap('<Right>', '<C-w>l')

-- Clear search highlighting on <Esc>
nnoremap('<Esc>', ':nohlsearch<CR>', {silent = true})

-- Replace word under the cursor, by buffer or line
nnoremap('<Leader>rb', ':%s/\\<<C-r><C-w>\\>/')
nnoremap('<Leader>rl', ':s/\\<<C-r><C-w>\\>/')

-- Yank until the end of the line
nnoremap('Y', 'y$')

-- Close the quickfix or location list
nnoremap('<Leader>cc', ':cclose<CR>')
nnoremap('<Leader>lc', ':lclose<CR>')

-- Quickly quit the current window
nnoremap('<Leader>q', ':q<CR>', {silent = true})

-- Package management
vim.cmd "command! PackerInstall packadd packer.nvim | lua require('plugins').install()"
vim.cmd "command! PackerUpdate packadd packer.nvim  | lua require('plugins').update()"
vim.cmd "command! PackerSync packadd packer.nvim    | lua require('plugins').sync()"
vim.cmd "command! PackerClean packadd packer.nvim   | lua require('plugins').clean()"
vim.cmd "command! PackerCompile packadd packer.nvim | lua require('plugins').compile()"
