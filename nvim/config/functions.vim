function! GitCurrentBranch() abort
  let l:branch = fugitive#Head()
  return winwidth(0) < 120 || l:branch == '' ? '' : ' ' . fugitive#Head()
endfunction

function! InspectHightlightGroup() abort
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

function! PackInstall() abort
  silent !git clone https://github.com/k-takata/minpac.git
        \ ~/.config/nvim/pack/minpac/opt/minpac
  echo "✔ minpac was installed successfully"
endfunction
