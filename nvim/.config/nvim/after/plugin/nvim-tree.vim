let g:nvim_tree_ignore = [
      \ '.git',
      \ '.elixir_ls',
      \ '_build',
      \ 'deps',
      \ 'node_modules',
      \ ]

let g:nvim_tree_icons = {
      \ 'git': {
      \   'unstaged':  '',
      \   'staged':    '',
      \   'unmerged':  '',
      \   'renamed':   '',
      \   'untracked': '',
      \ },
      \ }

nnoremap <Leader>ee <Cmd>NvimTreeToggle<CR>
nnoremap <Leader>ef <Cmd>NvimTreeFindFile<CR>
