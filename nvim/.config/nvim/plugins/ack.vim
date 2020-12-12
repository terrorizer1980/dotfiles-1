if PluginLoaded('ack.vim')
  " If available, use ripgrep for :Ack
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  endif
end
