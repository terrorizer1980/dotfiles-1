if PluginLoaded('vim-clap')
  nnoremap <silent> <Leader>f :Clap files<CR>
  nnoremap <silent> <Leader>b :Clap buffers<CR>
  nnoremap <silent> <Leader>/ :Clap grep<CR>

  let g:clap_theme = 'material_design_dark'
endif
