local nnoremap = require('utils').nnoremap

local function telescope_map(key, fn, opts)
  if opts == nil then opts = '{}' end
  local lhs = '<Leader>f' .. key
  local rhs = "<Cmd>lua require('telescope.builtin')['" .. fn .. "'](" .. opts .. ")<CR>"
  nnoremap(lhs, rhs)
end

telescope_map('f', 'find_files')
telescope_map('g', 'live_grep')
telescope_map('b', 'buffers', '{show_all_buffers = true}')
telescope_map('h', 'help_tags')
telescope_map('r', 'registers')
telescope_map('t', 'builtin')
