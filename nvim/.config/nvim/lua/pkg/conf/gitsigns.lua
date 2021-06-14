local map = require("ngs.util").map

require("gitsigns").setup({
  signs = {
    add          = {text = '┃'},
    change       = {text = '┃'},
    delete       = {text = '┃'},
    topdelete    = {text = '┃'},
    changedelete = {text = '┃'},
  },
  keymaps = {},
})

-- General functionality
local function gsmap(fn)
  return '<Cmd>lua require("gitsigns").'..fn.."()<CR>"
end

map("n", "<Leader>gs", gsmap("stage_hunk"))
map("n", "<Leader>gu", gsmap("undo_stage_hunk"))
map("n", "<Leader>gr", gsmap("reset_hunk"))
map("n", "<Leader>gR", gsmap("reset_buffer"))
map("n", "<Leader>gp", gsmap("preview_hunk"))
map("n", "<Leader>gb", gsmap("blame_line"))

-- UI toggles
map("n", "<Leader>ugs", "<Cmd>Gitsigns toggle_signs<CR>")
map("n", "<Leader>ugb", "<Cmd>Gitsigns toggle_current_line_blame<CR>")

-- Motions
map("n", "[c", [[&diff ? ']c' : '<cmd>lua require"gitsigns".prev_hunk()<CR>']], {expr = true})
map("n", "]c", [[&diff ? ']c' : '<cmd>lua require"gitsigns".next_hunk()<CR>']], {expr = true})

-- Text objects
map("o", "ih", ":<C-U>lua require'gitsigns'.select_hunk()<CR>")
map("x", "ih", ":<C-U>lua require'gitsigns'.select_hunk()<CR>")
