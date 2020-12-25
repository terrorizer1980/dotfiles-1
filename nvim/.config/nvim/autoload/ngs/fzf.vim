function! ngs#fzf#variables() abort
  " TODO Insert variable name on <CR>
  " TODO Better display formatting
  let l:opts = {'source': split(execute('let'), '\n')}
  call fzf#run(fzf#wrap(opts))
endfunction
