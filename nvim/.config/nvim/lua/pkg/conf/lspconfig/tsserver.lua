return function(on_attach)
    require("lspconfig").tsserver.setup({
        on_attach = on_attach,
        filetypes = {"typescript", "javascript", "typescriptreact"}
    })
end
