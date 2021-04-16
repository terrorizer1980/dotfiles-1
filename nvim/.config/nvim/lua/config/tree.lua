local map = require('ngs.util').map

vim.g.nvim_tree_ignore = {
  '.git',
  '.elixir_ls',
  '_build',
  'deps',
  'node_modules',
}

vim.g.nvim_tree_icons  = {
  git = {
    unstaged =  '',
    staged =    '',
    unmerged =  '',
    renamed =   '',
    untracked = '',
  },
}

map('n', '<Leader>ee', '<Cmd>NvimTreeToggle<CR>')
map('n', '<Leader>ef', '<Cmd>NvimTreeFindFile<CR>')
