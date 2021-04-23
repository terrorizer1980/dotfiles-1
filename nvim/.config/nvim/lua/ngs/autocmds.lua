-- ==========================================================
-- Autocommands
-- ==========================================================

local augroup = require("ngs.util").augroup

augroup("yank", {"TextYankPost * lua vim.highlight.on_yank()"})

augroup("colors", {
  "ColorScheme * lua require('ngs.colors').set_custom()",
})
