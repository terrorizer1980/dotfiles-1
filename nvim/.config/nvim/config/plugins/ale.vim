" Only execute specified linters
let ale_linters_explicit = 1

" Run fixers on save
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
