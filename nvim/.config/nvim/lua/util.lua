local api = vim.api

local util = {}

-- Adds `map` and `noremap` functions for each mode, e.g.
-- nmap, nnoremap, xmap.
local function map(mode, lhs, rhs, opts, buflocal)
  if opts == nil then opts = {} end
  if buflocal then
    api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

local modes = {"n", "v", "s", "x", "o", "i", "l", "c", "t"}
for _, mode in pairs(modes) do
	util[mode .. "map"] = function (lhs, rhs, opts, buflocal)
    map(mode, lhs, rhs, opts, buflocal)
  end

	util[mode .. "noremap"] = function (lhs, rhs, opts, buflocal)
	  if opts == nil then opts = {} end
	  opts.noremap = true
    map(mode, lhs, rhs, opts, buflocal)
	end
end

return util
