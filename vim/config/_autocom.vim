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

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

augroup prose
    autocmd!
    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoEnter Limelight
	autocmd User GoyoEnter call pencil#init()
    autocmd User GoyoLeave nested call <SID>goyo_leave()
    autocmd User GoyoLeave Limelight!
augroup END
