" Plugin maintenance
command! PackInstall call ngs#MinpacInstall()
command! PackUpdate  source $MYVIMRC | call ngs#pack#Init() | call minpac#update()
command! PackClean   source $MYVIMRC | call ngs#pack#Init() | call minpac#clean()
command! PackStatus  packadd minpac  | call minpac#status()
command! PackList    packadd minpac  | echo ngs#pack#List()

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

for pairs in items(s:commands)
  for cmd in pairs[1]
    call ngs#commands#NewLazyCommand(cmd, pairs[0])
  endfor
endfor
