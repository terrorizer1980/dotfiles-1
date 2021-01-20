local util = require("ngs.util")
local statusline = {}

function statusline.filename()
  local icon = util.get_buffer_icon()
  return icon .. " " .. vim.fn.expand("%")
end

function statusline.git_branch()
  local head = vim.fn["fugitive#Head"]
  if vim.g.loaded_fugitive and head() then
    return " " .. head()
  end
  return ""
end

return statusline
