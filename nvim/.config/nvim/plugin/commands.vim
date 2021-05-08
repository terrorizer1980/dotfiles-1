" ==========================================================
" Commands 
" ==========================================================

" Package management
command! PaqInstall lua require'ngs.packages'.install()
command! PaqUpdate  lua require'ngs.packages'.update()
command! PaqClean   lua require'ngs.packages'.clean()
command! PaqGet     lua require'ngs.util'.paq_get()
