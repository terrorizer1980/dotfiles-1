" ----------------------------------------------------------
" Helpers for building out the statusline
" ----------------------------------------------------------

function! ngs#statusline#FileIcon() abort
  if exists('g:loaded_webdevicons') && winwidth(0) > 70
    return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() . ' ' : 'no ft'
  endif
  return ''
endfunction

function! ngs#statusline#GitCurrentBranch() abort
  if exists('g:loaded_fugitive')
    return ' ' . fugitive#Head()
  endif
  return ''
endfunction
