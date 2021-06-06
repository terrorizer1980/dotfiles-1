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

map("n", "<Leader>tgs", "<Cmd>Gitsigns toggle_signs<CR>")
map("n", "<Leader>tgb", "<Cmd>Gitsigns toggle_current_line_blame<CR>")
