" ----------------------------------------------------------
" Commands
" ----------------------------------------------------------

" Package maintenance
let s:packfile = stdpath('config') . '/autoload/ngs/packages.vim'
command! PackInit    call ngs#packages#Init()
command! PackInstall call ngs#packages#MinpacInstall()
command! PackUpdate  exe 'so ' . s:packfile | call ngs#packages#Init() | call minpac#update()
command! PackClean   exe 'so ' . s:packfile | call ngs#packages#Init() | call minpac#clean()
command! PackStatus  packadd minpac | call minpac#status()
command! PackList    packadd minpac | echo ngs#packages#List()

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

" :grep without the annoying STDOUT window
command! -nargs=* Grep silent grep <args>

" I tend to fuck this up a lot
command! Xa xa
