function! Colorscheme(name)
  if a:name == 'xcodedark'
    set background=dark
    colorscheme xcodedark
    highlight Normal guibg=#1C1D21
    highlight EndOfBuffer guibg=#1C1D21
    highlight CursorLine guibg=#292A30
  elseif a:name == 'solarized_dark'
    set background=dark
    colorscheme solarized8
    highlight SignColumn guibg=#073642

  elseif a:name == 'solarized_light'
    set background=light
    colorscheme solarized8
    highlight SignColumn guibg=#eee8d5

  elseif a:name == 'iceberg_dark'
    set background=dark
    colorscheme iceberg
  elseif a:name == 'iceberg_light'
    set background=light
    colorscheme iceberg
  else
    set background=dark
  endif

  highlight link mkdLineBreak mkdNonListItemBlock
endfunction

call Colorscheme('iceberg_dark')
