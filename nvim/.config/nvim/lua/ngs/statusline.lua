local g, exec = vim.g, vim.api.nvim_exec
local util = require('ngs.util')
local highlight = require('ngs.highlight')

local M = {}

local function set_highlight(color)
  return '%#' .. color .. '#'
end

local function restore_highlight()
  return '%*'
end

local function segment(str, highlight)
  local out = ''

  if highlight then out = out .. set_highlight(highlight) end
  out = out .. ' ' .. str .. ' '
  if highlight then out = out .. restore_highlight(highlight) end

  return out
end

local function mode_indicator(mode)
  local modes = {
    n = 'Normal', i = 'Insert',  v = 'Visual',
    V = 'Visual', R = 'Replace', c = 'Command',
  }

  local name = modes[mode] or 'Visual'

  if name then
    local highlight = 'StatusLine' .. name
    return segment(string.upper(name), highlight)
           .. set_highlight(highlight .. 'Rev')
           -- .. '▓▒░'
           .. '▒'
  else
    return segment(mode)
  end
end

local function git_current_branch()
  if vim.g.loaded_fugitive == nil then return end
  local head = vim.fn['fugitive#Head']()
  if head == '' then return '' else return '  ' .. head end
end

local function active_statusline(mode)
  local ft_icon = util.get_buffer_icon()

  return ''
    .. mode_indicator(mode)
    .. set_highlight('StatusLine')
    .. segment(ft_icon .. ' %t')
    .. set_highlight('StatusLineIndicator')
    .. '%{&mod ? " " : ""}'
    .. set_highlight('StatusLineNC')
    .. '%{&readonly ? "  " : ""}'
    .. '%='
    .. segment(util.git_current_branch())
    .. set_highlight('StatusLine')
    .. segment('%{&ft}')
    .. set_highlight('StatusLineBright')
    .. segment('%3l:%-2v  %3p%% ☰')
end

local function inactive_statusline(mode)
  return ''
    .. set_highlight('Statusline')
    .. segment('● %t')
    .. set_highlight('StatusLineIndicator')
    .. '%{&mod ? " " : ""}'
    .. set_highlight('StatusLine')
    .. '%='
    .. segment(util.git_current_branch())
    .. segment('%{&ft}')
end

-- Gets the statusline for the window with given `index`.
--
-- * If `status` is 'active', the active statusline is applied.
-- * If `status` is 'inactive', the inactive statusline is applied.
-- * `mode` should be the output of the Vim `mode()` function 
-- * If no `index` is provided, `0` (the current window) is used.
--
function M.get_statusline(status, mode, index)
  local statusline

  if status == 'active' then
    statusline = active_statusline(mode)
  elseif status == 'inactive' then
    statusline = inactive_statusline(mode)
  end

  return statusline
end

local function set_mode_highlights(name, fg, bg)
  util.set_highlight('StatusLine' .. name, {guifg = 'bg', guibg = bg, gui = 'bold'})
  util.set_highlight('StatusLine' .. name .. 'Rev', {guifg = bg, guibg = fg})
end

-- Sets `statusline_palette` global variable. Useful to call, e.g when
-- the colorscheme is changed.
function M.set_statusline_highlights()
  local pal = highlight.make_palette({
    'Comment', 'Constant', 'Special', 'PreProc', 'Character', 
    'Function', 'Conditional', 'DiffAdd', 'SignColumn', 'StatusLine',
    'StatusLineNC'
  })

  set_mode_highlights('Normal',  pal.StatusLine.guibg, pal.Function.guifg)
  set_mode_highlights('Insert',  pal.StatusLine.guibg, pal.DiffAdd.guifg)
  set_mode_highlights('Visual',  pal.StatusLine.guibg, pal.Conditional.guifg)
  set_mode_highlights('Command', pal.StatusLine.guibg, pal.Constant.guifg)

  util.set_highlight('StatusLineIndicator', {guifg = pal.PreProc.guifg, guibg = pal.StatusLineNC.guibg})

  util.set_highlight('StatusLineBright', {guifg = pal.StatusLine.guibg, guibg = pal.SignColumn.guifg})
end

return M
