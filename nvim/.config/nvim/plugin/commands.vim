" ----------------------------------------------------------
" Commands
" ----------------------------------------------------------

" Plugin maintenance
command! PackInit    call ngs#packages#Init()
command! PackInstall call ngs#packages#MinpacInstall()
command! PackUpdate  source $MYVIMRC | call ngs#packages#Init() | call minpac#update()
command! PackClean   source $MYVIMRC | call ngs#packages#Init() | call minpac#clean()
command! PackStatus  packadd minpac  | call minpac#status()
command! PackList    packadd minpac  | echo ngs#packages#List()

" FZF pickers
command! Variables lua require("ngs.fzf").variables()
command! Packages  lua require("ngs.fzf").packages()

" Plugin lazy loading
let s:commands = {
      \ 'vim-test':        ['TestFile', 'TestSuite', 'TestNearest', 'TestLast'],
      \ 'vim-startuptime': ['StartupTime'],
      \ 'nvim-luadev':     ['Luadev'],
      \ 'vim-floaterm':    ['FloatermNew'],
      \ 'tmuxline.vim':    ['Tmuxline'],
      \ }

for [name, cmds] in items(s:commands)
  for cmd in cmds
    call ngs#commands#NewLazyCommand(cmd, name)
  endfor
endfor
