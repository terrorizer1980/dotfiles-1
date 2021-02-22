" ----------------------------------------------------------
" Autocommands
" ----------------------------------------------------------

augroup movement
  autocmd!

  " See :h last-position-jump
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END

augroup status
  autocmd!
  autocmd BufEnter * setlocal statusline=%!ngs#statusline#Active()
  autocmd BufLeave * setlocal statusline=%!ngs#statusline#Inactive()
augroup END
