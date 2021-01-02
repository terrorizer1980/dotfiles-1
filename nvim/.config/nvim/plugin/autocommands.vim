" ----------------------------------------------------------
" Autocommands
" ----------------------------------------------------------

augroup Filetypes
  autocmd!
  autocmd BufEnter *.ex,*.exs packadd vim-mix-format
  autocmd BufEnter *.css,*.js,*.json,*.html,*.ts,*.tsx packadd ale
augroup END
