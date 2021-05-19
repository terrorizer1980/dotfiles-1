local map = require("ngs.util").map

map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
map("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
map("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")
map("n", "<Leader>fr", "<Cmd>Telescope registers<CR>")
map("n", "<Leader>ft", "<Cmd>Telescope treesitter<CR>")
