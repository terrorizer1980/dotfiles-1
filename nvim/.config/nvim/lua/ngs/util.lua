local api = vim.api
local devicons = require("nvim-web-devicons")

local util = {}

-- String helpers
function util.str_split(str, char)
  local tokens = {}
  for token in string.gmatch(str, "[^" .. char .. "]+") do
    table.insert(tokens, token)
  end
  return tokens
end

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

-- Get icon for current buffer
function util.get_buffer_icon()
  local filename
  local filetype = vim.bo.filetype

  if filetype == "dirvish" then
    filename = "dirvish"
  elseif filetype == "qf" then
    filename = "quickfix"
  else
    filename = vim.fn.expand("%:t")
  end

  local extension = vim.fn.expand("%:t:e")
  local icon = devicons.get_icon(filename, extension)

  if icon then return icon else return "" end
end

return util
