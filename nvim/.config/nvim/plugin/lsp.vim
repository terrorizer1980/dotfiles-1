augroup  lsp
  autocmd! 
  autocmd BufWrite *.ex,*.exs,*.lua,*.rs lua vim.lsp.buf.formatting()
augroup END
