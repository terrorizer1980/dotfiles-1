" ----------------------------------------------------------
" Helpers for working with commands
" ----------------------------------------------------------

function! ngs#commands#NewLazyCommand(cmd, plugin) abort
  execute 'command! ' . a:cmd . ' call ngs#commands#ExecuteLazyCommand("'
        \ . a:plugin . '", "'
        \ . a:cmd . '")'
endfunction

function! ngs#commands#ExecuteLazyCommand(plugin, cmd) abort
  execute 'packadd ' . a:plugin
  execute a:cmd
endfunction
