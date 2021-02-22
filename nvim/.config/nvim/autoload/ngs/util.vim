" ----------------------------------------------------------
" Utility functions
" ----------------------------------------------------------

function! ngs#util#OnBufEnter(exts, cmd) abort
  execute 'autocmd BufEnter ' . join(a:exts, ',') . ' ' . a:cmd
endfunction

function! ngs#util#SetIndentation(spaces) abort
  execute 'setlocal shiftwidth='  . a:spaces
  execute 'setlocal softtabstop=' . a:spaces
  execute 'setlocal tabstop='     . a:spaces
endfunction
