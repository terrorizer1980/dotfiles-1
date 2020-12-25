" ----------------------------------------------------------
" Helpers for building out the statusline.
" ----------------------------------------------------------

function! ngs#statusline#FileIcon() abort
  let l:name = expand("%:t")
  let l:ext = expand("%:e")
  let l:expr = 'require("nvim-web-devicons").get_icon("' . name . '", "' . ext . '")'
  return luaeval(l:expr) . ' '
endfunction

function! ngs#statusline#GitCurrentBranch() abort
  if exists('g:loaded_fugitive')
    return ' ' . fugitive#Head()
  endif
  return ''
endfunction
