function! ngs#variant#Name() abort
  if $NVIM_STYLE != ''
    return $NVIM_STYLE
  else
    return 'normal'
  endif
endfunction

function! ngs#variant#Pack() abort
  let l:path = [stdpath('data'), 'packs', ngs#variant#Name()]
  return join(l:path, '/')
endfunction

function! ngs#variant#File() abort
  let l:file = ngs#variant#Name() . '.vim'
  let l:path = [stdpath('data'), 'packfiles', file]
  return join(l:path, '/')
endfunction

function! ngs#variant#Load() abort
  let l:file = ngs#variant#File()
  if filereadable(l:file)
    execute 'source ' . l:file
  endif
endfunction
