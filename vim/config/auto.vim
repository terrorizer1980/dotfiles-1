" Autocommands for filetypes and plugins
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

augroup filetypes
    autocmd!
    autocmd FileType ruby map <Leader>s :call RunCurrentSpecFile()
    autocmd FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup nerdtree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
augroup END
