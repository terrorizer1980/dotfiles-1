vim.cmd('packloadall')

local nvim_lsp = require'nvim_lsp'
local completion = require 'completion'
local diagnostic = require 'diagnostic'

local lsp_on_attach = function ()
  completion.on_attach()
  diagnostic.on_attach()
end

nvim_lsp.elixirls.setup{
  cmd = {'/Users/nick/Projects/elixir-ls/release/language_server.sh'};
  on_attach = lsp_on_attach;
}

require'nvim_lsp'.tsserver.setup{on_attach = lsp_on_attach}
require'nvim_lsp'.flow.setup{on_attach = lsp_on_attach}
require'nvim_lsp'.rls.setup{on_attach = lsp_on_attach}
