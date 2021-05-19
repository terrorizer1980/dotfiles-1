" ==========================================================
" Commands 
" ==========================================================

" Package management
command! PackerInstall lua require'ngs.packages'.install()
command! PackerCompile lua require'ngs.packages'.compile()
command! PackerUpdate  lua require'ngs.packages'.update()
command! PackerClean   lua require'ngs.packages'.clean()
command! PackerSync    lua require'ngs.packages'.sync()
command! PackerGet     lua require'ngs.util'.packer_get()
