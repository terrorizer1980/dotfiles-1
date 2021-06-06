" ==========================================================
" Autocommands
" ==========================================================

augroup yank
  autocmd!
  autocmd TextYankPost * lua vim.highlight.on_yank()
augroup END
