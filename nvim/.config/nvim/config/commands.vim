command! InspectHightlightGroup echo InspectHightlightGroup()

command! PackInstall call PackInstall()
command! PackUpdate  call PackInit() | call minpac#update()
command! PackClean   call PackInit() | call minpac#clean()
command! PackStatus  packadd minpac  | call minpac#status()
