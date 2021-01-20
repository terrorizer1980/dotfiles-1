" ----------------------------------------------------------
" Helpers for building out the statusline
" ----------------------------------------------------------

function! ngs#statusline#Filename() abort
  return luaeval('require("ngs.statusline").filename()')
endfunction

function! ngs#statusline#GitBranch() abort
  return luaeval('require("ngs.statusline").git_branch()')
endfunction
