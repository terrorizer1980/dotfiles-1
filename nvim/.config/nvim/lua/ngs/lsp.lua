-- Neovim LSP Configuration

local lspconfig = require("lspconfig")
local lsp = vim.lsp

local function lspmap(lhs, fnname)
  local rhs = "<Cmd>lua vim.lsp." .. fnname .. "()<CR>"
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, opts)
end

local function telmap(lhs, fnname, telopts)
  if telopts == nil then telopts = '{}' end
  local rhs = "<Cmd>lua require('telescope.builtin')." .. fnname .. "(" .. telopts .. ")<CR>"
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, opts)
end

local lsp_on_attach = function ()
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  function LspStop()
    lsp.stop_client(lsp.get_active_clients())
  end

  function LspRestart()
    LspStop()
    vim.cmd("edit")
  end

  function LspInfo()
    print(vim.inspect(lsp.buf_get_clients()))
  end

  lspmap("K",     "buf.hover")
  lspmap("<C-]>", "buf.definition")

  telmap("<Leader>la",  "lsp_code_actions")
  lspmap("<Leader>lf",  "buf.formatting")
  lspmap("<Leader>ld",  "diagnostic.show_line_diagnostics")
  lspmap("<Leader>lgd", "buf.definition")
  lspmap("<Leader>lgi", "buf.implementation")
  lspmap("<Leader>lgt", "buf.type_definition")
  lspmap("<Leader>lh",  "buf.hover")
  telmap("<Leader>lr",  "lsp_references")
  lspmap("<Leader>lR",  "buf.rename")
  telmap("<Leader>ls",  "lsp_document_symbols")
  telmap("<Leader>lS",  "lsp_workspace_symbols")


  vim.cmd [[command! LspStop    lua LspStop()]]
  vim.cmd [[command! LspRestart lua LspRestart()]]
  vim.cmd [[command! LspInfo    lua LspInfo()]]
end

-- Elixir
local function elixirls_cmd()
  local lscdir = "/usr/local/opt/elixir-ls/release"
  local stdout = vim.fn.system("elixir -v")
  local otpver = string.match(stdout, "OTP (%d+)")
  -- TODO Handle nil optver
  return {vim.fn.expand(
    lscdir .. "/1.11.2-otp-" .. otpver .. "/language_server.sh"
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
  -- root_dir = lspconfig.util.root_pattern("tsconfig.json"),
})

-- Lua
local lua_root = "/usr/local/opt/lua-language-server"
local lua_bin  = lua_root .. "/bin/macOS/lua-language-server"
local lua_main = lua_root .. "/main.lua"
lspconfig.sumneko_lua.setup({
  on_attach = lsp_on_attach,
  cmd = {lua_bin, "-E", lua_main},
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
