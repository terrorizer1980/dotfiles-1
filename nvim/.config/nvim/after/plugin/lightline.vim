if exists('g:loaded_lightline')
  let g:lightline = {
        \ 'colorscheme': 'base16_default_dark',
        \
        \ 'active': {
        \   'left':  [['mode', 'paste'], ['git', 'readonly'], ['filename', 'modified']],
        \   'right': [['lineinfo'], ['percent'], ['method', 'fileicon', 'filetype']],
        \ },
        \
        \ 'inactive': {
        \   'left':  [['git', 'readonly'], ['filename', 'modified']],
        \   'right': [['obsession', 'filetype']]
        \  },
        \
        \ 'component':  {
        \   'fileinfo': '%{&ff} [%{&fenc!=#""?&fenc:&enc}]',
        \   'filename': '%t',
        \   'lineinfo': '%3l:%-2v ',
        \   'modified': '[%M]',
        \   'paste':    '%{&paste?"PASTE":""}',
        \   'percent':  '%3p%% ☰ ',
        \   'readonly': '%R',
        \  },
        \
        \ 'component_function': {
        \   'filetype': 'ngs#statusline#FileIcon',
        \   'git':      'ngs#statusline#GitCurrentBranch',
        \   'mode':     'lightline#mode',
        \ },
        \ }
endif
