" let s:error_sign = '⊘'
" let s:warning_sign = ' '
" let s:info_sign = ' '
" let s:hint_sign = ' '

let ale_linters_explicit = 1
let ale_fix_on_save = 1

let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'javascript': [],
      \ 'javascriptreact': [],
      \ 'typescript': ['eslint', 'tslint'],
      \ 'typescriptreact': ['eslint', 'tslint'],
      \ 'html': ['tidy'],
      \ }

let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'css': ['prettier', 'stylelint'],
      \ 'javascript': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
      \ 'json': ['prettier'],
      \ 'html': ['prettier'],
      \ }
      " \ 'elixir': ['mix_format'],
