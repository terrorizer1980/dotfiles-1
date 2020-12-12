local nnoremap = require('utils').nnoremap

local function telescope_map(key, fn)
  local lhs = '<Leader>f' .. key
  local rhs = "<Cmd>lua require('telescope.builtin')['" .. fn .. "']()<CR>"
  nnoremap(lhs, rhs)
end

telescope_map('f', 'find_files')
telescope_map('g', 'live_grep')
telescope_map('b', 'buffers')
telescope_map('h', 'help_tags')
telescope_map('r', 'registers')
