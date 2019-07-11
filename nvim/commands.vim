scriptencoding utf-8

" ==============================================================================
" Commands
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

augroup vimrc | autocmd! | augroup end

augroup filetypes
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END

" Format the current buffer on write
autocmd vimrc BufWritePre * silent call CocAction('format')

" Format the current buffer
command! -nargs=0 Format :call CocAction('format')

" Hide the statusline in fzf terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
