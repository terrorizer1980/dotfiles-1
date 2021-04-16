local exists, lspconfig  = pcall(require, 'lspconfig')

if not exists then return end

local util = require('ngs.util')

local cmd = vim.cmd

local function map(lhs, rhs)
  util.bufmap(0, 'n', lhs, rhs, {silent = true})
end

LspFormatFiletypes = {}

local function lsp_on_attach(client)
  print('  Attached to LSP server')

  map('<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  map('K',     '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')

  map('<Leader>la', '<Cmd>lua require("lspsaga.codeaction").code_action()<CR>')
  map('<Leader>ld', '<Cmd>lua require("lspsaga.provider").preview_definition()<CR>')
  map('<Leader>le', '<Cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>')
  map('<Leader>lf', '<Cmd>lua vim.lsp.buf.formatting_sync()<CR>')
  map('<Leader>lh', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
  map('<Leader>lr', '<Cmd>lua require("telescope.builtin").lsp_references()<CR>')
  map('<Leader>ls', '<Cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>')
  map('<Leader>lS', '<Cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>')

  map('ga', '<Cmd>lua require("lspsaga.codeaction").code_action()<CR>')
  map('gd', '<Cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>')
  map('gf', '<Cmd>lua vim.lsp.buf.formatting_sync()<CR>')
  map('gf', 'buf.formatting_sync')
  map('gr', '<Cmd>lua require("telescope.builtin").lsp_references()<CR>')
  map('gs', '<Cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>')
  map('gS', '<Cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>')

  map('[d', '<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
  map('d]', '<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')

  local config = client.config
  if config.capabilities.textDocument.formatting then
    for _, ft in ipairs(config.filetypes) do
      print('Adding ' .. ft)
      table.insert(LspFormatFiletypes, ft)
    end
  end
end

-- Haxe
lspconfig.haxe_language_server.setup({
  on_attach = lsp_on_attach,
  init_options = {
    displayArguments = {"compile.hxml"};
  };
})

-- Elixir
local elixirls_setup = vim.loop.new_async(vim.schedule_wrap(function()
  local lscdir = '/usr/local/opt/elixir-ls/release'
  local stdout = vim.fn.system('elixir -v')
  local otpver = string.match(stdout, 'OTP (%d+)')

  lspconfig.elixirls.setup({
    on_attach = lsp_on_attach,
    cmd = {lscdir .. '/1.11.2-otp-' .. otpver .. '/language_server.sh'}
  })

  local ft = vim.bo.filetype
  if ft == 'elixir' or ft == 'eelixir' then
    lspconfig.elixirls.manager.try_add()
  end
end))

elixirls_setup:send()

-- TypeScript
lspconfig.tsserver.setup({
  on_attach = lsp_on_attach,
  filetypes = {'typescript', 'javascript', 'typescriptreact'},
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

-- Diagnostic highlights and signs
local pal = vim.g.ngs_palette
local sign_bg = util.get_highlight_attr('SignColumn', 'bg')

util.highlight('LspDiagnosticsDefaultError',      {fg = pal.red})
util.highlight('LspDiagnosticsDefaultWarning',    {fg = pal.yellow})
util.highlight('LspDiagnosticsDefaultInformtion', {fg = pal.cyan})
util.highlight('LspDiagnosticsDefaultHint',       {fg = pal.blue})

util.highlight('LspDiagnosticsSignError',       {fg = pal.red, bg = sign_bg})
util.highlight('LspDiagnosticsSignWarning',     {fg = pal.yellow, bg = sign_bg})
util.highlight('LspDiagnosticsSignInformation', {fg = pal.cyan, bg = sign_bg})
util.highlight('LspDiagnosticsSignHint',        {fg = pal.blue, bg = sign_bg})

cmd [[sign define LspDiagnosticsSignError       text=]]
cmd [[sign define LspDiagnosticsSignWarning     text=]]
cmd [[sign define LspDiagnosticsSignInformation text=]]
cmd [[sign define LspDiagnosticsSignHint        text=]]
