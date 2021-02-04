if exists('g:loaded_fzf')
  nnoremap <Leader>ff <Cmd>Files<CR>
  nnoremap <Leader>fb <Cmd>Buffers<CR>
  nnoremap <Leader>fg <Cmd>Rg<CR>
  nnoremap <Leader>fc <Cmd>Command<CR>
  nnoremap <Leader>fv <Cmd>Variables<CR>
  nnoremap <Leader>fp <Cmd>Packages<CR>
  nnoremap <Leader>f, <Cmd>call fzf#vim#files(stdpath('config'))<CR>
  nnoremap <Leader>fn <Cmd>call fzf#vim#files(g:notes_path)<CR>
endif
