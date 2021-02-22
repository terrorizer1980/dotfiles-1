" ----------------------------------------------------------
" Globals
" ----------------------------------------------------------

" [Note] I try to only set package-related globals if
" needed, e.g. if a certain package is available.

let g:notes_path = '~/Dropbox/Notes'
let g:work_notes_path = '~/Dropbox/NewAperio/Notes'

let g:vimwiki_list = [
      \ {
      \   'path': '~/Dropbox/Notes',
      \   'syntax': 'markdown',
      \   'ext': '.md'
      \ },
      \ {
      \   'path': '~/Dropbox/NewAperio/Notes',
      \   'syntax': 'markdown',
      \   'ext': '.md'
      \ }
      \ ]

" Vim Markdown 
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1

" tmuxline
let g:tmuxline_powerline_separators = 0
