" ==========================================================
" Autocommands
" ==========================================================

augroup yank
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank()
augroup END

augroup colors
  autocmd!
  autocmd ColorScheme * call ngs#color#SetCustom()
augroup END
