local fn, cmd, g = vim.fn, vim.cmd, vim.g
local util = require('ngs.util')

local M = {}

-- Returns the given highlight `group` as a string. If the group
-- links to another, then the linked group is returned.
-- Example: "ctermfg=6 guifg=#86c1b9"
function M.get_highlight_group(group)
  fn.execute('silent redir => g:ngs_output')
  pcall(fn.execute, 'highlight ' .. group)
  fn.execute('redir END')

  if g.ngs_output == '' then return end

  local linked = string.match(g.ngs_output, 'links to (.*)')
  if linked then
    return M.get_highlight_group(linked)
  end

  local output = g.ngs_output
  vim.cmd('unlet g:ngs_output')

  return string.match(output, '%a+%s+xxx%s(.*)')
end

-- Returns the given highlight `group` as a table.
-- Example: {ctermfg: "6", guifg: "#86c1b9"}
function M.get_highlight_group_tbl(group)
  local str = M.get_highlight_group(group)
  if str == nil then return end

  local tbl = {}
  for _, token in ipairs(util.split(str)) do
    local kv = util.split(token, '=')
    tbl[kv[1]] = kv[2]
  end
  return tbl
end

-- Returns a table containing definitions for the given highlight
-- `groups`. If `groups` is not specified, NeoVim's built-in
-- highlight groups are used.
-- Example: {GroupName: {ctermfg: "6", guifg: "#86c1b9"}}
function M.make_palette(groups)
  local tbl = {}

  if groups == nil then groups = util.builtin_groups() end

  for _, group in ipairs(groups) do
    tbl[group] = M.get_highlight_group_tbl(group)
  end

  return tbl
end

return M
