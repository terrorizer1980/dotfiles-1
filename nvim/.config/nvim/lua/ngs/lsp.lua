local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local lsp, cmd = vim.lsp, vim.cmd

local function map(lhs, fnname)
  local rhs = '<Cmd>lua vim.lsp.' .. fnname .. '()<CR>'
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, opts)
end

local lsp_on_attach = function ()
  print('  Attached to LSP server')

  function LspStop()
    lsp.stop_client(lsp.get_active_clients())
  end

  function LspRestart()
    LspStop()
    cmd('edit')
  end

  function LspDebug()
    print(vim.inspect(lsp.buf_get_clients()))
  end

  map('K',     'buf.hover')
  map('<C-]>', 'buf.definition')

  map('<Leader>la',  'buf.code_action')
  map('<Leader>lf',  'buf.formatting')
  map('<Leader>ld',  'diagnostic.show_line_diagnostics')
  map('<Leader>lgd', 'buf.definition')
  map('<Leader>lgi', 'buf.implementation')
  map('<Leader>lgt', 'buf.type_definition')
  map('<Leader>lh',  'buf.hover')
  map('<Leader>lr',  'buf.references')
  map('<Leader>lR',  'buf.rename')
  map('<Leader>ls',  'buf.document_symbol')
  map('<Leader>lS',  'buf.workspace_symbol')

  cmd [[command! LspStop       lua LspStop()]]
  cmd [[command! LspRestart    lua LspRestart()]]
  cmd [[command! LspDebug      lua LspDebug()]]

  require('lspkind').init({
    symbol_map = {
      Function = "λ"
    }
  })
end

-- Haxe
lspconfig.haxe_language_server.setup({
  on_attach = lsp_on_attach,
  init_options = {
    displayArguments = {"compile.hxml"};
  };
})

-- Elixir
local function elixirls_cmd()
  local lscdir = '/usr/local/opt/elixir-ls/release'
  local stdout = vim.fn.system('elixir -v')
  local otpver = string.match(stdout, 'OTP (%d+)')
  -- TODO Handle nil optver
  return {vim.fn.expand(
    lscdir .. '/1.11.2-otp-' .. otpver .. '/language_server.sh'
  )}
end

lspconfig.elixirls.setup({
  on_attach = lsp_on_attach,
  cmd = elixirls_cmd(),
})

-- TypeScript
lspconfig.tsserver.setup({
  on_attach = lsp_on_attach,
  filetypes = {'typescript', 'javascript'},
  -- Temp fix for Naveon RN app
  -- root_dir = lspconfig.util.root_pattern('tsconfig.json'),
})

-- Lua
local lua_root = '/usr/local/opt/lua-language-server'
local lua_bin  = lua_root .. '/bin/macOS/lua-language-server'
local lua_main = lua_root .. '/main.lua'
lspconfig.sumneko_lua.setup({
  on_attach = lsp_on_attach,
  cmd = {lua_bin, '-E', lua_main},
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {'vim'},
      },
    },
  },
})

-- Vim
lspconfig.vimls.setup({on_attach = lsp_on_attach})

-- Rust
lspconfig.rls.setup({on_attach = lsp_on_attach})

-- Terraform
lspconfig.terraformls.setup({on_attach = lsp_on_attach})

-- GDScript
lspconfig.gdscript.setup({on_attach = lsp_on_attach})
