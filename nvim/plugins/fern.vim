let g:fern#renderer = "nerdfont"

augroup fern
  autocmd!
  autocmd FileType fern call glyph_palette#apply()
augroup END
