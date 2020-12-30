" ----------------------------------------------------------
" Autocommands
" ----------------------------------------------------------

let s:lsp_exts = ['.ex', '.exs', '.js', '.lua', '.ts', '.tsx']

augroup Filetypes
  autocmd!
  autocmd BufEnter *.ex,*.exs packadd vim-mix-format
  autocmd BufEnter *.css,*.js,*.json,*.html,*.ts,*.tsx packadd ale

  call ngs#util#OnBufEnter(s:lsp_exts, 'packadd completion-nvim')
  call ngs#util#OnBufEnter(s:lsp_exts, 'packadd nvim-lspconfig')
augroup END
