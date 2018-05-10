" Autocommands
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" PICO-8 {{{
augroup pico8 
    autocmd!
    autocmd FileType pico8 map <Leader>m :!/Applications/PICO-8.app/Contents/MacOS/pico8 -run %<CR>
augroup END
" }}} ----------------------------------------------------------------
" Vimscript {{{
augroup vimscript
    autocmd!
    autocmd FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}} ----------------------------------------------------------------
" Ruby {{{
augroup ruby
    autocmd!
    autocmd FileType ruby map <Leader>s :call RunCurrentSpecFile()
augroup END
" }}} ----------------------------------------------------------------
" Elm {{{
augroup elm
    autocmd!
    autocmd FileType elm setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}} ----------------------------------------------------------------
" Vue.js {{{
augroup vuejs
    autocmd!
    autocmd BufRead,BufNewFile *.vue setfiletype html
augroup END
" }}} ----------------------------------------------------------------
" LÖVE {{{
augroup love
    autocmd!

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
augroup END
" }}} ----------------------------------------------------------------
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
" }}} ----------------------------------------------------------------
" vim-prettier {{{
augroup prettier
    autocmd!
    autocmd BufWritePre,InsertLeave
                \ *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md
                \ PrettierAsync
augroup END
" }}} ----------------------------------------------------------------
" NERDTree {{{
augroup nerdtree
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" }}} ----------------------------------------------------------------

    " vim:foldmethod=marker:foldlevel=0
