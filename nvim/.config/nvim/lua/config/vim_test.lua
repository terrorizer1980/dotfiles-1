local map = require("ngs.util").map

map("n", "<Leader>tn", "<Cmd>TestNearest<CR>", {silent = true})
map("n", "<Leader>tf", "<Cmd>TestFile<CR>",    {silent = true})
map("n", "<Leader>td", "<Cmd>TestSuite<CR>",   {silent = true})
map("n", "<Leader>tt", "<Cmd>TestLast<CR>",    {silent = true})
map("n", "<Leader>tv", "<Cmd>TestVisit<CR>",   {silent = true})
