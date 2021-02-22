" ----------------------------------------------------------
" Autocommands
" ----------------------------------------------------------

augroup Filetypes
  autocmd!
  autocmd BufEnter * lua require("completion").on_attach()
augroup END

augroup status
  autocmd!
  autocmd BufEnter * setlocal statusline=%!ngs#statusline#Active()
  autocmd BufLeave * setlocal statusline=%!ngs#statusline#Inactive()
augroup END
