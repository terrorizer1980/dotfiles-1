return function(on_attach)
  local lspstatus = require('lsp-status')
  local lua_root = "/usr/local/opt/lua-language-server"
  local lua_bin = lua_root .. "/bin/macOS/lua-language-server"
  local lua_main = lua_root .. "/main.lua"

  require("lspconfig").sumneko_lua.setup({
    cmd = {lua_bin, "-E", lua_main},
    on_attach = on_attach,
    capabilities = lspstatus.capabilities,
    settings = {Lua = {diagnostics = {enable = true, globals = {"vim"}}}}
  })
end
