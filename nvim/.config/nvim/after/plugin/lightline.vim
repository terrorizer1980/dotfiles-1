" ----------------------------------------------------------
" lightline config
" ----------------------------------------------------------

if exists('g:loaded_lightline')
  let g:lightline = {
        \ 'colorscheme': 'base16_default_dark',
        \
        \ 'active': {
        \   'left':  [['mode', 'paste'], ['git', 'readonly'], ['filename', 'modified']],
        \   'right': [['lineinfo'], ['percent'], ['method', 'fileicon', 'filetype', 'fileinfo']],
        \ },
        \
        \ 'inactive': {
        \   'left':  [['git', 'readonly'], ['filename', 'modified']],
        \   'right': [['obsession', 'filetype', 'fileinfo']]
        \  },
        \
        \ 'component': {
        \   'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
        \   'fileformat':   '%{&ff}',
        \   'fileinfo':     '%{&ff}[%{&fenc!=#""?&fenc:&enc}]',
        \   'filename':     '%t',
        \   'filetype':     '%{ngs#statusline#FileIcon()}%{&ft!=#""?&ft:"no ft"}',
        \   'lineinfo':     '%3l:%-2v ',
        \   'mode':         '%{lightline#mode()}',
        \   'modified':     '[%M]',
        \   'paste':        '%{&paste?"PASTE":""}',
        \   'percent':      '%3p%% ☰ ',
        \   'readonly':     '%R',
        \  },
        \
        \ 'component_function': {
        \   'git': 'ngs#statusline#GitCurrentBranch',
        \ },
        \ }
endif
