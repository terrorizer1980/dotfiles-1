" Autocommands and autocommand groups
"
" Author: N. G. Scheurich
" Repo: https://github.com/ngscheurich/dotfiles


autocmd VimEnter * call system("tmux source-file ~/.tmux.conf")

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
    autocmd FileType ruby map <Leader>s :call RunCurrentSpecFile()<CR>
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

" vim:foldmethod=marker:foldlevel=0
