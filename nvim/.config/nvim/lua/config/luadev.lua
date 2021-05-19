local map = require("ngs.util").map

map("n", "<Leader>r", "<Plug>(Luadev-Runline)", {noremap = false})
map("v", "<Leader>r", "<Plug>(Luadev-Run)",     {noremap = false})
