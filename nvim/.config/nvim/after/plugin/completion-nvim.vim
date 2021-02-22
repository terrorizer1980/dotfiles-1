if !exists('g:loaded_completion') | finish | endif

let g:completion_enable_snippet = "UltiSnips"
let g:completion_auto_change_source = 0
let g:completion_enable_auto_popup = 1

let g:completion_chain_complete_list = [
      \ {'complete_items': ['lsp', 'snippet']},
      \ {'mode': '<c-n>'},
      \ {'mode': '<c-p>'},
      \ ]

imap <C-f> <Plug>(completion_next_source)
imap <C-b> <Plug>(completion_prev_source)
