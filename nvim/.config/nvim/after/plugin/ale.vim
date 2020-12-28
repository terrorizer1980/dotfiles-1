" ----------------------------------------------------------
" ALE settings
" ----------------------------------------------------------

if exists('g:loaded_ale')
  let g:ale_disable_lsp      = 1
  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save      = 1

  function! s:tslinters() abort
    if filereadable('tslint.json')
      return ['tslint']
    endif
    return ['eslint']
  endfunction

  let g:ale_linters = {
        \ 'css':             ['stylelint'],
        \ 'javascript':      ['eslint'],
        \ 'html':            ['tidy'],
        \ 'typescript':      s:tslinters(),
        \ 'typescriptreact': s:tslinters(),
        \ }

  let g:ale_fixers = {
        \ 'css':             ['prettier', 'stylelint'],
        \ 'javascript':      ['prettier'],
        \ 'typescript':      ['prettier'],
        \ 'json':            ['prettier'],
        \ 'typescriptreact': ['prettier'],
        \ 'html':            ['prettier'],
        \ }
endif
