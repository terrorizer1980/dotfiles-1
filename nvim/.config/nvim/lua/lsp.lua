local lspconfig = require("lspconfig")
local lsp = vim.lsp

local function bufmap(lhs, lsp_fn)
  local rhs = "<Cmd>lua vim.lsp." .. lsp_fn .. "()<CR>"
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, opts)
end

local lsp_on_attach = function ()
  require("completion").on_attach()

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.g.completion_enable_snippet = "vim-vsnip"

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

  bufmap("K",     "buf.hover")
  bufmap("<C-]>", "buf.definition")

  bufmap("<Leader>la",  "buf.code_action")
  bufmap("<Leader>lf",  "buf.formatting")
  bufmap("<Leader>ld",  "diagnostic.show_line_diagnostics")
  bufmap("<Leader>lgd", "buf.definition")
  bufmap("<Leader>lgi", "buf.implementation")
  bufmap("<Leader>lgt", "buf.type_definition")
  bufmap("<Leader>lh",  "buf.hover")
  bufmap("<Leader>lr",  "buf.references")
  bufmap("<Leader>lR",  "buf.rename")
  bufmap("<Leader>ls",  "buf.document_symbol")
  bufmap("<Leader>lS",  "buf.workspace_symbol")

  vim.cmd [[command! LspStop    lua LspStop()]]
  vim.cmd [[command! LspRestart lua LspRestart()]]
  vim.cmd [[command! LspInfo    lua LspInfo()]]
end

-- Elixir
local function elixirls_cmd()
  local lscdir = "~/.local/share/elixir-ls/release"
  local stdout = vim.fn.system("elixir -v")
  local otpver = string.match(stdout, "OTP (%d+)")
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
  -- Temp fix for Naveon RN app
  root_dir = lspconfig.util.root_pattern("tsconfig.json"),
})

-- Lua
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

-- Vim
lspconfig.vimls.setup({on_attach = lsp_on_attach})
