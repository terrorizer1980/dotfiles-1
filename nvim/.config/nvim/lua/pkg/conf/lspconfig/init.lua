local lspconfig = require("lspconfig")
-- local lsp_format = require("ngs.lsp_format")
local util = require("ngs.util")

-- Callback for when LSP client attaches to buffer
local function on_attach(_, bufnr)
  local function map(lhs, rhs)
    for _, l in pairs(lhs) do
      util.bufmap(bufnr, "n", l, rhs, {silent = true})
    end
  end

  map({"<C-]>", "<Leader>ld"},  "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map({"K",     "<Leader>lh"},  "<Cmd>lua vim.lsp.buf.hover()<CR>")
  map({"gca",   "<Leader>la"},  "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  map({"gd",    "<Leader>lD"},  "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map({"gf",    "<Leader>lf"},  "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
  map({"gr",    "<Leader>lr"},  "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
  map({"gs",    "<Leader>ls"},  "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")

  -- lsp_format.setup(client.config.filetypes)
end

-- Set up servers with default settings
local servers = {"vimls", "rls", "terraformls", "gdscript"}
for _, server in ipairs(servers) do
  lspconfig[server].setup({on_attach = on_attach})
end

-- Set up servers with custom settings
servers = {"efm", "elixirls", "haxe_language_server", "omnisharp", "sumneko_lua", "tsserver"}
for _, server in ipairs(servers) do
  require("pkg.conf.lspconfig." .. server)(on_attach)
end
