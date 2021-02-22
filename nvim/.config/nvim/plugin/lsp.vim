augroup  lsp
  autocmd! 
  autocmd BufWrite *.ex,*.exs,*.lua,*.rs lua vim.lsp.buf.formatting()
augroup END

highlight link LspDiagnosticsSignError       DiffDelete
highlight link LspDiagnosticsSignWarning     StatusLineIndicator
highlight link LspDiagnosticsSignInformation DiffText
highlight link LspDiagnosticsSignHint        DiffAdd

sign define LspDiagnosticsSignError       text=  texthl=LspDiagnosticsSignError      
sign define LspDiagnosticsSignWarning     text=  texthl=LspDiagnosticsSignWarning
sign define LspDiagnosticsSignInformation text=  texthl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint        text=  texthl=LspDiagnosticsSignHint
