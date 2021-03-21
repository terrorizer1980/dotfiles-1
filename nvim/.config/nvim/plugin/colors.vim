" ----------------------------------------------------------
" Colors
" ----------------------------------------------------------

" Set the colorscheme
colorscheme base16-tomorrow-night

" Make matched parens less obstrusive
highlight MatchParen guibg=bg gui=underline

" Set up statusline highlight groups
lua require"ngs.statusline".set_statusline_highlights()

" Don't draw listchars in bold
highlight NonText gui=none

" Use the correct color for the Erlang icon
highlight DevIconErl guifg=#A1022B
