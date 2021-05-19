" ==========================================================
" " Colors
" ==========================================================

let s:pack = luaeval('require("ngs.packages").pack()')
if  s:pack == 'standard'
  colorscheme two-firewatch 
elseif s:pack == 'experimental'
  colorscheme two-firewatch 
end

highlight link LspDiagnosticsVirtualTextError       Comment
highlight link LspDiagnosticsVirtualTextHint        Comment
highlight link LspDiagnosticsVirtualTextInformation Comment
highlight link LspDiagnosticsVirtualTextWarning     Comment
