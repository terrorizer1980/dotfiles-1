" ----------------------------------------------------------
" Colors
" ----------------------------------------------------------

" Set the colorscheme
colorscheme base16-tomorrow-night

" Customize highlight groups
highlight MatchParen guibg=bg gui=underline

" Set up statusline highlight groups
lua require"ngs.statusline".set_statusline_highlights()
