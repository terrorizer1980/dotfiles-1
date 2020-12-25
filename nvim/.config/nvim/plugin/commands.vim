" ----------------------------------------------------------
" Commands
" ----------------------------------------------------------

" Plugin maintenance
command! PackInstall call ngs#MinpacInstall()
command! PackUpdate  source $MYVIMRC | call ngs#pack#Init() | call minpac#update()
command! PackClean   source $MYVIMRC | call ngs#pack#Init() | call minpac#clean()
command! PackStatus  packadd minpac  | call minpac#status()
command! PackList    packadd minpac  | echo ngs#packages#List()

" FZF pickers
command! Variables call ngs#fzf#Variables()
command! Packages  call ngs#fzf#Packages()

" Plugin lazy loading
let s:commands = {
      \ 'vim-test':        ['TestFile', 'TestSuite', 'TestNearest', 'TestLast'],
      \ 'vim-startuptime': ['StartupTime'],
      \ 'nvim-luadev':     ['LuaDev'],
      \ 'ack.vim':         ['Ack'],
      \ 'vim-floaterm':    ['Floaterm'],
      \ 'tmuxline.vim':    ['Tmuxline'],
      \ 'nvim-tree.lua':   ['LuaTreeToggle', 'LuaTreeFindFile', 'LuaTreeOpen'],
      \ }

for [name, cmds] in items(s:commands)
  for cmd in cmds
    call ngs#commands#NewLazyCommand(cmd, name)
  endfor
endfor
