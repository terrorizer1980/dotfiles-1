" Statusline helpers

function! ngs#statusline#Active() abort
  return luaeval('require"ngs.statusline".get_statusline("active", vim.fn.mode())')
endfunction

function! ngs#statusline#Inactive() abort
  return luaeval('require"ngs.statusline".get_statusline("inactive", vim.fn.mode())')
endfunction
