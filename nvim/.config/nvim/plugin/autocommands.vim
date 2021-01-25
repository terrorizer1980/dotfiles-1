" ----------------------------------------------------------
" Autocommands
" ----------------------------------------------------------

augroup Filetypes
  autocmd!
  autocmd BufEnter * lua require("completion").on_attach()
augroup END
