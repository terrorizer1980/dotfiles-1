function ngs#statusline#Filename() abort
  if !exists('g:loaded_devicons') | return '' | endif

  let l:filename = expand("%:t")
  let l:extension = expand("%:t:e")
  let l:args = '"' . l:filename . '", "' . l:extension . '"'
  let l:icon = luaeval('require("nvim-web-devicons").get_icon(' . l:args . ')')

  return l:icon . ' ' . l:filename
endfunction

function ngs#statusline#GitBranch() abort
  if !exists('g:loaded_fugitive') | return '' | endif

  let l:head = fugitive#Head()
  if g:loaded_fugitive && l:head != ''
    return ' ' . l:head
  endif

  return ''
endfunction
