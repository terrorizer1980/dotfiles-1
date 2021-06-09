return function(on_attach)
  require("lspconfig").efm.setup({
    init_options = {documentFormatting = true},
    on_attach = on_attach,
    filetypes = {"lua", "elixir", "javascript", "typescript"},
    settings = {
      rootMarkers = {".git/"},
      languages = {
        lua = {{formatCommand = "lua-format -i", formatStdin = true}}
      }
    }
  })
end
