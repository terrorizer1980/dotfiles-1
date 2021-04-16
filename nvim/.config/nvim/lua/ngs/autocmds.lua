-- ==========================================================
-- Autocommands
-- ==========================================================

local augroup = require('ngs.util').augroup

augroup('editing', {
  'TextYankPost * lua vim.highlight.on_yank()',
})
