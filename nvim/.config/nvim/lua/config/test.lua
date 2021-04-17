local map = require("ngs.util").map

vim.g["test#strategy"] = "floaterm"

map("n", "<Leader>tn", "<Cmd>TestNearest<CR>", {silent = true, noremap = false})
map("n", "<Leader>tf", "<Cmd>TestFile<CR>",    {silent = true, noremap = false})
map("n", "<Leader>td", "<Cmd>TestSuite<CR>",   {silent = true, noremap = false})
map("n", "<Leader>tt", "<Cmd>TestLast<CR>",    {silent = true, noremap = false})
map("n", "<Leader>tv", "<Cmd>TestVisit<CR>",   {silent = true, noremap = false})
