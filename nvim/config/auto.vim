" Autocommands and autocommand groups
"
" Author: N. G. Scheurich
" Repo: https://github.com/ngscheurich/dotfiles

" if exists('$TMUX')
"   autocmd VimEnter * :Tmuxline vim_statusline_3
" endif

" PICO-8 {{{
augroup pico8 
    autocmd FileType pico8 map <Leader>m :!/Applications/PICO-8.app/Contents/MacOS/pico8 -run %<CR>
augroup END
" }}} ----------------------------------------------------------------
" Vimscript {{{
augroup vimscript
    autocmd FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}} ----------------------------------------------------------------
" Ruby {{{
augroup ruby
    autocmd FileType ruby map <Leader>s :call RunCurrentSpecFile()
augroup END
" }}} ----------------------------------------------------------------
" Elm {{{
augroup elm
    autocmd FileType elm setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}} ----------------------------------------------------------------
" Vue.js {{{
augroup vuejs
    autocmd BufRead,BufNewFile *.vue setfiletype html
augroup END
" }}} ----------------------------------------------------------------
" LÖVE {{{
augroup love
  function! OnlineDoc()
      let s:urlTemplate = "https://love2d.org/wiki/%"
      let s:browser = "open"
      let s:wordUnderCursor = split(expand("<cWORD>"), "(")[0]
      let s:wordUnderCursor = substitute(s:wordUnderCursor, "[<>]", "", "g")
      let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
      let s:cmd = "silent! !" . s:browser . " " . s:url
      execute s:cmd
  endfunction

  function! LocalDoc()
    let s:wordUnderCursor = split(expand("<cWORD>"), "(")[0]
    let s:cmd = "help love-" . s:wordUnderCursor
    execute s:cmd
  endfunction
  
  nmap K :call LocalDoc()<CR>
  " nmap <Leader>m :!tmux next-window && love .<CR>
augroup END
" }}}
" OmniSharp {{{
augroup omnisharp
  autocmd!

  autocmd FileType cs nnoremap <buffer> <Leader>b :wa!<CR>:OmniSharpBuildAsync<CR>
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
nnoremap <Leader>nm :OmniSharpRename<CR>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
nnoremap <Leader>tp :OmniSharpAddToProject<CR>
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
