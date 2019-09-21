let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \             [ 'git', 'readonly', 'filename', 'modified' ]],
      \   'right': [[ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v ',
      \   'percent': '%3p%% ☰'
      \ },
      \ 'component_function': {
      \   'git': 'LightlineGit'
      \ },
      \ }

function! LightlineGit()
  return " " . fugitive#Head()
endfunction

" vim  utf-8[unix]   42% ☰   58/135 ㏑ : 42  ☲ [56]trailing
