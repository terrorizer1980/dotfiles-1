local lspconfig = require("lspconfig")
local lsp_format = require("ngs.lsp_format")
local util = require("ngs.util")

-- Callback for when LSP client attaches to buffer
local function on_attach(client, bufnr)
    local function map(lhs, rhs)
        util.bufmap(bufnr, "n", lhs, rhs, {silent = true})
    end

    vim.cmd("redir @q")
    vim.cmd("redir END")

    map("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    map("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
    map("gca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    map("gd", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
    map("gf", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
    map("gr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
    map("gs", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
    map("gS",
        "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")

    lsp_format.setup(client.config.filetypes)
end

-- Set up servers with default settings
local servers = {"vimls", "rls", "terraformls", "gdscript"}
for _, server in ipairs(servers) do
    lspconfig[server].setup({on_attach = on_attach})
end

-- Set up servers with custom settings
servers = {
    "efm", "elixirls", "haxe_language_server", "omnisharp", "sumneko_lua",
    "tsserver"
}
for _, server in ipairs(servers) do
    require("pkg.conf.lspconfig." .. server)(on_attach)
end
