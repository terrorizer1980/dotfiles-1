local map = require("ngs.util").map

vim.g["test#strategy"] = "floaterm"

map("n", "<Leader><Leader>e", "<Cmd>FloatermNew ranger")
map("n", "<Leader><Leader>g", "<Cmd>FloatermNew lazygit")
