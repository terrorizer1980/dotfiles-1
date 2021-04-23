function ngs#statusline#Filename() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' ⁕' : ''


  return filename . modified
endfunction

function ngs#statusline#Filetype() abort
  if !exists('g:loaded_devicons') | return &filetype | endif


  let l:name = expand("%:t")
  let l:ext  = expand("%:t:e")
  let l:args = '"' . l:name . '", "' . l:ext. '"'
  let l:icon = luaeval('require("nvim-web-devicons").get_icon(' . l:args . ')')

  if l:icon != v:null
    return l:icon . ' ' . &filetype
  else
    return &filetype
  endif
endfunction

function! ngs#statusline#LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

function ngs#statusline#GitBranch() abort
  if !exists('g:loaded_fugitive') | return '' | endif

  let l:head = fugitive#Head()
  " Shorten Clubhouse branch names
  let l:head = substitute(l:head, '\v(^.+\/ch\d+).*', '\1', '')

  if g:loaded_fugitive && l:head != ''
    return ' ' . l:head
  endif

  return ''
endfunction

function ngs#statusline#FileInfo() abort
  return ngs#statusline#LspStatus() . ' ' . ngs#statusline#GitBranch()
endfunction
