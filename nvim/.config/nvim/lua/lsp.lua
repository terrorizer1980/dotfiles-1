local lspconfig = require('lspconfig')

local function bufmap(lhs, lsp_fn)
  local rhs = '<Cmd>lua vim.lsp.' .. lsp_fn .. '()<CR>'
  local opts = {noremap = true, silent = true}
  nnoremap(lhs, rhs, opts, true)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, opts)
end

local lsp_on_attach = function ()
  require('completion').on_attach()

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  bufmap('K',     '<Cmd>lua vim.lsp.buf.hover()<CR>')
  bufmap('<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>')

  bufmap('<Leader>a',  'buf.code_action')
  bufmap('<Leader>f',  'buf.formatting')
  bufmap('<Leader>d',  'diagnostic.show_line_diagnostics')
  bufmap('<Leader>gd', 'buf.definition')
  bufmap('<Leader>gi', 'buf.implementation')
  bufmap('<Leader>gt', 'buf.type_definition')
  bufmap('<Leader>h',  'buf.hover')
  bufmap('<Leader>r',  'buf.references')
  bufmap('<Leader>R',  'buf.rename')
  bufmap('<Leader>s',  'buf.rename')
  bufmap('<Leader>S',  'buf.workspace_symbol')
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
