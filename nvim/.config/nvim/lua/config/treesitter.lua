require('nvim-treesitter.configs').setup({
  ensure_installed = {'lua', 'typescript'},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
})
