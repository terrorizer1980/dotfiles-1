return function(on_attach)
  require("lspconfig").haxe_language_server.setup({
    on_attach = on_attach,
    init_options = {displayArguments = {"compile.hxml"}},
  })
end
