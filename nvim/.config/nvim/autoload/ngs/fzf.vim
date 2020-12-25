" ----------------------------------------------------------
" Helpers for defining new FZF pickers
" ----------------------------------------------------------

function! ngs#fzf#Variables() abort
  " TODO Insert variable name on <CR>
  " TODO Better display formatting
  let l:opts = {'source': split(execute('let'), '\n')}
  call fzf#run(fzf#wrap(opts))
endfunction

function! ngs#fzf#Packages() abort
  " TODO Preview package options
  " TODO Jump to line in `ngs#packages#Init` on <CR>
  let l:opts = {'source': split(ngs#packages#List(), '\n')}
  call fzf#run(fzf#wrap(opts))
endfunction

