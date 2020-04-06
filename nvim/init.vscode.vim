"" Neovim configuration
""
"" Author: N. G. Scheurich <nick@scheurich.me>
"" Repo:   https://github.com/ngscheurich/dotfiles

source /Users/ngscheurich/.vimrc

if exists('g:vscode')
  nnoremap K :call VSCodeNotify("editor.action.showHover")<CR>
  nnoremap <Leader>e[ :call VSCodeNotify("editor.action.marker.prev")<CR>
  nnoremap <Leader>e] :call VSCodeNotify("editor.action.marker.next")<CR>
  nnoremap <Leader>tf :call VSCodeNotify("workbench.action.tasks.runTask", "Test Current File")<CR>
  nnoremap <Leader>tn :call VSCodeNotify("workbench.action.tasks.runTask", "Run Nearest Test")<CR>
  nnoremap <Leader>tl :call VSCodeNotify("workbench.action.tasks.runTask", "Run Last Test ")<CR>
  nnoremap <Leader>td :call VSCodeNotify("workbench.action.tasks.runTask", "Debug Nearest Test ")<CR>
endif