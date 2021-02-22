" ----------------------------------------------------------
" Helpers for working with commands
" ----------------------------------------------------------

function! ngs#commands#NewLazyCommand(cmd, plugin) abort
  execute 'command! -nargs=*'
        \ . ' ' . a:cmd . ' call ngs#commands#ExecuteLazyCommand('
        \ . '"' . a:plugin . '", '
        \ . '"' . a:cmd . '", '
        \ . '<q-args>'
        \ . ')'
endfunction

function! ngs#commands#ExecuteLazyCommand(plugin, cmd, args) abort
  execute 'delcommand ' . a:cmd
  execute 'packadd ' . a:plugin
  execute a:cmd . ' ' . a:args
endfunction
