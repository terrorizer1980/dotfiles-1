" Statusline helpers

function! ngs#statusline#Filename() abort
  return luaeval('require("ngs.util").get_filename()')
endfunction

function! ngs#statusline#GitBranch() abort
  return luaeval('require("ngs.util").git_current_branch()')
endfunction

function! ngs#statusline#Active() abort
  return luaeval('require"ngs.statusline".get_statusline("active", vim.fn.mode())')
endfunction

function! ngs#statusline#Inactive() abort
  return luaeval('require"ngs.statusline".get_statusline("inactive", vim.fn.mode())')
endfunction
