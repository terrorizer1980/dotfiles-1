" ----------------------------------------------------------
" Secret and mysterious functions
" ----------------------------------------------------------

function! ngs#util#OnBufEnter(exts, cmd) abort
  execute 'autocmd BufEnter ' . join(a:exts, ',') . ' ' . a:cmd
endfunction
