return function(on_attach)
  require("lspconfig").efm.setup({
    on_attach = on_attach,
    filetypes = {"elixir", "typescript", "typescriptreact", "javascript"},
  })
end
