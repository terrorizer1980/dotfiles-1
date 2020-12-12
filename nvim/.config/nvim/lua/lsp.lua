local lspconfig = require('lspconfig')
local nnoremap = require('utils').nnoremap

local lsp_on_attach = function ()
  nnoremap('<silent><buffer> gd',    '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  nnoremap('<silent><buffer> <c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  nnoremap('<silent><buffer> K',     '<cmd>lua vim.lsp.buf.hover()<CR>')
  nnoremap('<silent><buffer> gD',    '<cmd>lua vim.lsp.buf.implementation()<CR>')
  nnoremap('<silent><buffer> <c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  nnoremap('<silent><buffer> 1gD',   '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  nnoremap('<silent><buffer> gr',    '<cmd>lua vim.lsp.buf.references()<CR>')
  nnoremap('<silent><buffer> g0',    '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  nnoremap('<silent><buffer> gW',    '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  nnoremap('<silent><buffer> ga',    '<cmd>lua vim.lsp.buf.code_action()<CR>')
  nnoremap('<silent><buffer> gn',    "<cmd>lua require('jumpLoc').jumpNextLocationCycle()<CR>")
  nnoremap('<silent><buffer> gp',    "<cmd>lua require('jumpLoc').jumpPrevLocationCycle()<CR>")

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
  require('completion').on_attach()
end

lspconfig.elixirls.setup({on_attach = lsp_on_attach})
lspconfig.sumneko_lua.setup({
  on_attach = lsp_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {'vim'},
      },
    },
  },
})
