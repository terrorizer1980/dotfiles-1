function! ngs#options#SetTabWidth(width) abort
  execute "setlocal shiftwidth="  . a:width
  execute "setlocal softtabstop=" . a:width
  execute "setlocal tabstop="     . a:width
endfunction
