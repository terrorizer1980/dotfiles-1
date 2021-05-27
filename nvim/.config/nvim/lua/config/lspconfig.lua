local lspconfig = require("lspconfig")
local lspstatus = require('lsp-status')
local util = require("ngs.util")

lspstatus.config({
  kind_labels = {},
  current_function = true,
  diagnostics = true,
  indicator_separator = ' ',
  indicator_errors = '',
  indicator_warnings = '',
  indicator_info = '',
  indicator_hint = '',
  indicator_ok = '',
  spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
  status_symbol = '',
  select_symbol = nil,
  update_interval = 100
})
lspstatus.register_progress()

local cmd = vim.cmd

local function map(lhs, rhs)
  util.bufmap(0, "n", lhs, rhs, {silent = true})
end

LspFormatFiletypes = {}

local function lsp_on_attach(client)
  map("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map("K",     "<Cmd>lua vim.lsp.buf.hover()<CR>")

  map("gca",   "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  map("gd",    "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map("gf",    "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
  map("gr",    "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
  map("gs",    "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
  map("gS",    "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")

  lspstatus.on_attach(client)
end

-- Omnisharp
local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/nick/tools/omnisharp-osx/run"
lspconfig.omnisharp.setup({
  on_attach = lsp_on_attach,
  cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
})

-- Haxe
lspconfig.haxe_language_server.setup({
  on_attach = lsp_on_attach,
  init_options = {
    displayArguments = {"compile.hxml"};
  };
})

-- Elixir
local elixirls_setup = vim.loop.new_async(vim.schedule_wrap(function()
  local lscdir = "/usr/local/opt/elixir-ls/release"
  local stdout = vim.fn.system("elixir -v")
  local otpver = string.match(stdout, "OTP (%d+)")

  lspconfig.elixirls.setup({
    on_attach = lsp_on_attach,
    cmd = {lscdir .. "/1.11.2-otp-" .. otpver .. "/language_server.sh"}
  })

  local ft = vim.bo.filetype
  if ft == "elixir" or ft == "eelixir" then
    lspconfig.elixirls.manager.try_add()
  end
end))

elixirls_setup:send()

-- TypeScript/JavaScript
lspconfig.tsserver.setup({
  on_attach = lsp_on_attach,
  filetypes = {"typescript", "javascript", "typescriptreact"},
})

-- Lua
local lua_root = "/usr/local/opt/lua-language-server"
local lua_bin  = lua_root .. "/bin/macOS/lua-language-server"
local lua_main = lua_root .. "/main.lua"
lspconfig.sumneko_lua.setup({
  on_attach = lsp_on_attach,
  capabilities = lspstatus.capabilities,
  cmd = {lua_bin, "-E", lua_main},
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {"vim"},
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

-- Diagnostic highlights and signs
cmd "sign define LspDiagnosticsSignError       text="
cmd "sign define LspDiagnosticsSignWarning     text="
cmd "sign define LspDiagnosticsSignInformation text="
cmd "sign define LspDiagnosticsSignHint        text="
