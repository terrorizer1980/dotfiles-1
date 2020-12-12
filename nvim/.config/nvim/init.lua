-- =========================================================
-- Neovim configuration
-- =========================================================
-- Author: N. G. Scheurich <nick@scheurich.me>
-- Repo:   https://github.com/ngscheurich/dotfiles

packerfile = vim.fn.stdpath('config') .. '/.packer_compiled.vim'
vim.cmd('source ' .. packerfile)

require('globals')
require('options')
require('mappings')

vim.cmd [[command! Xa :xa]]
