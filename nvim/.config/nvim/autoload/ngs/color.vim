function! ngs#color#SetCustom() abort
  if !exists('g:colors_name') | return | endif

  if g:colors_name == 'one'
    highlight Normal       guibg=#20232a
    highlight LineNr       guifg=#696b71 guibg=#282c34
    highlight CursorLineNr guifg=#696b71 guibg=#282c34
    highlight CursorLine   guibg=#282c34
    highlight SignColumn   guibg=#282c34

    highlight LspDiagnosticsSignError       guifg=#e06c75 guibg=#282c34
    highlight LspDiagnosticsSignHint        guifg=#7dcfff guibg=#282c34
    highlight LspDiagnosticsSignInformation guifg=#7aa2f7 guibg=#282c34
    highlight LspDiagnosticsSignWarning     guifg=#e5c07b guibg=#282c34
  elseif g:colors_name == 'base16-tomorrow-night'
    highlight LspDiagnosticsSignError       guifg=#cc6666 guibg=#282c34
    highlight LspDiagnosticsSignHint        guifg=#81a2be guibg=#282c34
    highlight LspDiagnosticsSignInformation guifg=#8abeb7 guibg=#282c34
    highlight LspDiagnosticsSignWarning     guifg=#f0c674 guibg=#282c34
  elseif g:colors_name == 'two-firewatch' && &background == 'dark'
    let s:dk = '#20232a'
    let s:md = '#24282f'
    let s:lt = '#272C36'

    call s:hilite('Normal',       {'bg': s:dk})
    call s:hilite('CursorLine',   {'bg': s:lt})
    call s:hilite('LineNr',       {'bg': s:md})
    call s:hilite('CursorLineNr', {'bg': s:md})
    call s:hilite('SignColumn',   {'bg': s:md})

    call s:hilite('LspDiagnosticsSignError',       {'fg': '#e06c75', 'bg': s:md})
    call s:hilite('LspDiagnosticsSignHint',        {'fg': '#6e88a6', 'bg': s:md})
    call s:hilite('LspDiagnosticsSignInformation', {'fg': '#56b6c2', 'bg': s:md})
    call s:hilite('LspDiagnosticsSignWarning',     {'fg': '#c8ae9d', 'bg': s:md})

    call s:hilite('GitSignsAdd',    {'fg': '#43d08a', 'bg': s:md})
    call s:hilite('GitSignsChange', {'fg': '#c8ae9d', 'bg': s:md})
    call s:hilite('GitSignsDelete', {'fg': '#e06c75', 'bg': s:md})
  elseif g:colors_name == 'tokyonight' && &background == 'dark'
    let s:gutter = '#1d202e'

    call s:hilite('LineNr',         {'bg': s:gutter})
    call s:hilite('CursorLineNr',   {'bg': s:gutter})
    call s:hilite('SignColumn',     {'bg': s:gutter})

    call s:hilite('LspDiagnosticsSignError',  {'fg': '#e06c75', 'bg': s:gutter})
    call s:hilite('LspDiagnosticsSignHint',        {'fg': '#1abc9c', 'bg': s:gutter})
    call s:hilite('LspDiagnosticsSignInformation', {'fg': '#0db9d7', 'bg': s:gutter})
    call s:hilite('LspDiagnosticsSignWarning',     {'fg': '#e0af68', 'bg': s:gutter})

    call s:hilite('GitSignsAdd',    {'fg': '#164846', 'bg': s:gutter})
    call s:hilite('GitSignsChange', {'fg': '#394b70', 'bg': s:gutter})
    call s:hilite('GitSignsDelete', {'fg': '#823c41', 'bg': s:gutter})

    highlight CursorLine guibg=#25293b
    highlight IndentBlanklineChar guifg=#2f354e
  end
endfunction

function! s:hilite(group, colors) abort
  let l:fg  = get(a:colors, 'fg')
  let l:bg  = get(a:colors, 'bg')
  let l:cmd = 'hi ' . a:group

  if l:fg != v:false | let l:cmd .= ' guifg=' . l:fg | endif
  if l:bg != v:false | let l:cmd .= ' guibg=' . l:bg | endif

  execute cmd
endfunction
