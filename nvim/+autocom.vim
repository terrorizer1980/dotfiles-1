" ==============================================================================
" Autocommands
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

augroup general
    autocmd!
    autocmd FileType typescript noremap <Leader>] :TSDef<CR>
    autocmd FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=4 foldmethod=marker foldlevel=0
augroup END

augroup prettier
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup END

augroup nerdtree
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
