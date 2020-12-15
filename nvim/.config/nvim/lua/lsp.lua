local lspconfig = require('lspconfig')
local utils = require('utils')

local nnoremap = utils.nnoremap

local function lsp_map(keys, fn)
  local lhs = '<Leader>l' .. keys
  local rhs = '<Cmd>lua vim.lsp.' .. fn .. '()<CR>'
  local opts = {silent = true}
  nnoremap(lhs, rhs, opts, true)
end

local lsp_on_attach = function ()
  require('completion').on_attach()

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  lsp_map('a',  'buf.code_action')
  lsp_map('f',  'buf.formatting')
  lsp_map('d',  'diagnostic.show_line_diagnostics')
  lsp_map('gd', 'buf.definition')
  lsp_map('gi', 'buf.implementation')
  lsp_map('gt', 'buf.type_definition')
  lsp_map('h',  'buf.hover')
  lsp_map('r',  'buf.references')
  lsp_map('R',  'buf.rename')
  lsp_map('s',  'buf.rename')
  lsp_map('S',  'buf.workspace_symbol')

  nnoremap('<Leader>lcr',   "<Cmd>lua require('utils').lsp_restart()<CR>", {}, true)
  nnoremap('<Leader>lcs',   "<Cmd>lua require('utils').lsp_stop()<CR>",    {}, true)
  nnoremap('<Leader>li',    "<Cmd>lua require('utils').lsp_info()<CR>",    {}, true)

  nnoremap('K',     '<Cmd>lua vim.lsp.buf.hover()<CR>',      {}, true)
  nnoremap('<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', {}, true)
end

-- Language server configuration
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
