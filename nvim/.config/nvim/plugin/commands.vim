" ==========================================================
" Commands 
" ==========================================================

" Package management
command! PaqInstall lua require'pkg'.install()
command! PaqUpdate  lua require'pkg'.update()
command! PaqClean   lua require'pkg'.clean()
command! PaqGet     lua require'ngs.util'.paq_get()
