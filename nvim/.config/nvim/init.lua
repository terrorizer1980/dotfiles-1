-- =========================================================
-- Neovim configuration
-- =========================================================
-- Author: N. G. Scheurich <nick@scheurich.me>
-- Repo:   https://github.com/ngscheurich/dotfiles

vim.g.loaded_python_provider  = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0

require('options')
require('mappings')
require('globals')

vim.cmd [[command! Xa :xa]]
