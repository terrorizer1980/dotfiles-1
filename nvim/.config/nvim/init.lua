-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ///// \/// \\/// \///// \///////// \\\\\\/// \\/// \///// \/// \\/// \
-- \/// \\///// /// \\/// \\\\\/// \\\\\\\\\/// \\/// \\/// \\//// //// \
-- \/// \\///////// \\/// \\\\\/// \\\\\\\\\/// \\/// \\/// \\/// / /// \
-- \/// \\/// ///// \\/// \\\\\/// \\\\\\\\\\/// /// \\\/// \\/// \\/// \
-- ///// \/// \\/// \///// \\\\/// \\\\/// \\\///// \\\///// \/// \\/// \
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--
-- ======================================================================
-- Neovim Configuration
-- ======================================================================
-- Author: N. G. Scheurich <nick@scheurich.me>
-- Repo: https://github.com/ngscheurich/dotfiles

-- Disable some built-in plugins
vim.g.loaded_python_provider  = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0

--- Package management
require("ngs.packages")

-- Package configuration
require("config.compe")
require("config.devicons")
require("config.formatter")
require("config.lspconfig")
require("config.lspkind")
require("config.startify")
require("config.treesitter")
