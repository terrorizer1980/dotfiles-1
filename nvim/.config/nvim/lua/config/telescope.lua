local map = require('ngs.util').map

map('n', '<Leader>ff', ' <Cmd>lua require("telescope.builtin").find_files()<CR>')
map('n', '<Leader>fg', ' <Cmd>lua require("telescope.builtin").live_grep()<CR>')
map('n', '<Leader>fb', ' <Cmd>lua require("telescope.builtin").buffers()<CR>')
map('n', '<Leader>fh', ' <Cmd>lua require("telescope.builtin").help_tags()<CR>')
map('n', '<Leader>fr', ' <Cmd>lua require("telescope.builtin").registers()<CR>')
map('n', '<Leader>fc', ' <Cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
map('n', '<Leader>ft', ' <Cmd>lua require("telescope.builtin").treesitter()<CR>')
