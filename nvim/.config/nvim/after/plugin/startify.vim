if !exists('g:loaded_startify') | finish | endif

let g:startify_session_persistence = 1
let g:startify_files_number = 5
let g:startify_skiplist = ['~/.local/share/nvim/site/pack/*']
let g:startify_bookmarks = []

let s:version = matchstr(execute('version'), 'NVIM v\d\.\d\.\d')
let s:banner = [
      \ '                                  __                      ',
      \ '     ___      __    ___   __  __ /\_\    ___ ___          ',
      \ '   /'' _ `\  /''__`\ / __`\/\ \/\ \\/\ \ /'' __` __`\     ',
      \ '   /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \       ',
      \ '   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\      ',
      \ '    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/      ',
      \ '                                                          ',
      \ '        Welcome to ' . s:version . '.  Happy hacking.     ',
      \ '                                                          ',
      \ '   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░      '
      \ ]

let g:startify_custom_header = s:banner

nnoremap <Leader>wh <Cmd>Startify<CR>
