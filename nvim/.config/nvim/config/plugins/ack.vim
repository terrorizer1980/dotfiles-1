" Use ripgrep for :Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
