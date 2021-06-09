local map = require("ngs.util").map

require("gitsigns").setup({
  signs = {
    add          = {text = '┃'},
    change       = {text = '┃'},
    delete       = {text = '┃'},
    topdelete    = {text = '┃'},
    changedelete = {text = '┃'},
  }
})

map("n", "<Leader>ugs", "<Cmd>Gitsigns toggle_signs<CR>")
map("n", "<Leader>ugb", "<Cmd>Gitsigns toggle_current_line_blame<CR>")
