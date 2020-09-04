let g:fern#renderer       = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#drawer_width   = 30

nnoremap <silent> <Leader>d :call ToggleFern()<CR>

function! ToggleFern() abort
  execute ":Fern . -drawer -toggle"
  execute "normal \<C-w>="
endfunction

function! s:init_fern() abort
  call glyph_palette#apply()
  setlocal nonumber
  setlocal norelativenumber
endfunction

augroup fern
  autocmd!
  autocmd FileType fern call s:init_fern()
augroup END
