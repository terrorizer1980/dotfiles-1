" ----------------------------------------------------------
" Autocommands
" ----------------------------------------------------------

augroup filetypes
  autocmd!
  autocmd BufEnter *.ex,*.exs packadd vim-mix-format
augroup END
