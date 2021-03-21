local api = vim.api
local devicons = require('nvim-web-devicons')

local M = {}

-- Splits a string on `char`. If no char is provided, the '%s'
-- pattern is used.
function M.split(str, char)
  local tokens = {}
  char = char or '%s'

  for token in string.gmatch(str, '[^' .. char .. ']+') do
    table.insert(tokens, token)
  end

  return tokens
end

-- Removes leading and trailing whitespace from a string.
function M.trim(str)
  return str:match('^%s*(.*)%s$*')
end

-- Adds `map` and `noremap` functions for each mode.
local function map(mode, lhs, rhs, opts, buflocal)
  if opts == nil then opts = {} end
  if buflocal then
    api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

local modes = {'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't'}
for _, mode in pairs(modes) do
	M[mode .. 'map'] = function (lhs, rhs, opts, buflocal)
    map(mode, lhs, rhs, opts, buflocal)
  end

M[mode .. 'noremap'] = function (lhs, rhs, opts, buflocal)
  if opts == nil then opts = {} end
    opts.noremap = true
    map(mode, lhs, rhs, opts, buflocal)
	end
end

-- Gets filetype icon for the buffer with the given `index`. If
-- no index is provided, `0` (the current buffer) is used.
--
-- * Requires nvim-web-devicons.
--   https://github.com/kyazdani42/nvim-web-devicons
function M.get_buffer_icon(index)
  local filename
  local filetype = vim.bo[index or 0].filetype

  if filetype == 'dirvish' then
    filename = 'dirvish'
  elseif filetype == 'qf' then
    filename = 'quickfix'
  else
    filename = vim.fn.expand('%:t')
  end

  local extension = vim.fn.expand('%:t:e')
  local icon = devicons.get_icon(filename, extension)

  return icon or ''
end

-- Prints inspected expression.
function M.inspect(expr)
  print(vim.inspect(expr))
end

-- Returns a list of Neovim's built-in highlight groups.
-- * See :help highlight-default
function M.builtin_groups() 
  return {
    'ColorColumn', 'Conceal', 'Cursor', 'lCursor', 'CursorIM', 'CursorColumn',
    'CursorLine', 'Directory', 'DiffAdd', 'DiffChange', 'DiffDelete',
    'DiffText', 'EndOfBuffer', 'TermCursor', 'TermCursorNC', 'ErrorMsg',
    'VertSplit', 'Folded', 'FoldColumn', 'SignColumn', 'IncSearch',
    'Substitute', 'LineNr', 'CursorLineNr', 'MatchParen', 'ModeMsg', 'MsgArea',
    'MsgSeparator', 'MoreMsg', 'NonText', 'Normal', 'NormalFloat', 'NormalNC',
    'Pmenu', 'PmenuSel', 'PmenuSbar', 'PmenuThumb', 'Question', 'QuickFixLine',
    'Search', 'SpecialKey', 'SpellBad', 'SpellCap', 'SpellLocal', 'SpellRare',
    'StatusLine', 'StatusLineNC', 'TabLine', 'TabLineFill', 'TabLineSel',
    'Title', 'Visual', 'VisualNOS', 'WarningMsg', 'Whitespace', 'WildMenu',
    'Menu', 'Scrollbar', 'Tooltip',
  }
end

-- Sets the highlight group with the given name using a table of
-- highlight arguments.
-- * See :help highlight-args
function M.set_highlight(name, tbl)
  local args = ''
  local keys = {'cterm', 'ctermfg', 'ctermbg', 'gui', 'guifg', 'guibg'}

  for _, key in ipairs(keys) do
    if tbl[key] then
      args = args .. ' ' .. key .. '=' .. tbl[key]
    end
  end

  vim.cmd('highlight ' .. name .. args)
end

-- Returns the filename for the current buffer, or a useful alternative.
function M.get_filename()
  local filename
  local filetype = vim.bo.filetype

  if filetype == 'qf' then
    local is_loc = vim.fn.getbufvar(vim.fn.winbufnr(0), 'qf_isLoc')
    if is_loc then
      filename = 'Location List'
    else
      filename = 'Quickfix List'
    end
  else
    filename = vim.fn.expand('%:t')
  end

  return filename
end

return M
