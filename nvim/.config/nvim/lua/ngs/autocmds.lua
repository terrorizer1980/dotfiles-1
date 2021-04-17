-- ==========================================================
-- Autocommands
-- ==========================================================

local augroup = require("ngs.util").augroup

augroup("yank", {"TextYankPost * lua vim.highlight.on_yank()"})

augroup("colors", {
  "ColorScheme * lua require('ngs.util').set_palette()",
  "ColorScheme * lua require('ngs.util').set_custom_colors()",
})
