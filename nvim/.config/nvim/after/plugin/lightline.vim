if exists('g:loaded_lightline')
  let g:lightline = {
        \ 'colorscheme': 'base16_default_dark',
        \
        \ 'active': {
        \   'left':  [['mode', 'paste'], ['readonly', 'filename'], ['modified', 'method']],
        \   'right': [['lineinfo'], ['filetype'], ['method', 'git']],
        \ },
        \
        \ 'inactive': {
        \   'left':  [['readonly', 'filename', 'modified']],
        \   'right': [['filetype']]
        \  },
        \
        \ 'component':  {
        \   'fileinfo': '%{&ff} [%{&fenc!=#""?&fenc:&enc}]',
        \   'filetype': '%{&ft}',
        \   'lineinfo': '%3l:%-2v  %3p%% ☰',
        \   'modified': '[%M]',
        \   'paste':    '%{&paste?"PASTE":""}',
        \   'percent':  '%3p%% ☰',
        \   'readonly': '%R',
        \  },
        \
        \ 'component_function': {
        \   'filename': 'ngs#statusline#Filename',
        \   'git':      'ngs#statusline#GitBranch',
        \   'mode':     'lightline#mode',
        \ },
        \ }
endif
