-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ///// \/// \\/// \///// \///////// \\\\\\/// \\\\\\\/// \\/// \\/////// \\
-- \/// \\///// /// \\/// \\\\\/// \\\\\\\\\/// \\\\\\\/// \\/// \/// \\/// \
-- \/// \\///////// \\/// \\\\\/// \\\\\\\\\/// \\\\\\\/// \\/// \///////// \
-- \/// \\/// ///// \\/// \\\\\/// \\\\\\\\\/// \\\\\\\/// \\/// \/// \\/// \
-- ///// \/// \\/// \///// \\\\/// \\\\/// \///////// \\/////// \\/// \\/// \
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--
-- ==========================================================================
-- Neovim Configuration
-- ==========================================================================
-- Author: N. G. Scheurich <nick@scheurich.me>
-- Repo: https://github.com/ngscheurich/dotfiles

-- Disable some built-in plugins
vim.g.loaded_python_provider  = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0

-- Add variant pack to packpath
local pack = vim.fn["ngs#variant#Pack"]()
pcall(vim.cmd, string.format("set packpath+=%s", pack))

-- Basic configuration
require("ngs.autocmds")
require("ngs.colors")
require("ngs.commands")
require("ngs.mappings")
require("ngs.options")

-- Variants
if vim.fn["ngs#variant#Name"]() == "lo-fi" then
  vim.o.termguicolors = false
elseif vim.fn["ngs#variant#Name"]() == "experimental" then
  require("config.galaxyline")
end
