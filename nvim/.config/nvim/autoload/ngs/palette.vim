function! ngs#palette#Set() abort
  return {
        \ 'bg': synIDattr(synIDtrans(hlID('CursorLine')), 'bg'),
        \ 'fg': synIDattr(synIDtrans(hlID('Normal')), 'fg'),
        \ }
endfunction
