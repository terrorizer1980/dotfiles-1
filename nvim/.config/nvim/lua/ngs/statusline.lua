local util = require("ngs.util")
local statusline = {}

function statusline.filename()
  local icon = util.get_buffer_icon()

  local filename
  local filetype = vim.bo.filetype

  if filetype == "qf" then
    filename = "quickfix"
  else
    filename = vim.fn.expand("%:t")
  end

  return icon .. " " .. filename
end

function statusline.git_branch()
  local head = vim.fn["fugitive#Head"]
  if vim.g.loaded_fugitive and head() then
    return " " .. head()
  end
  return ""
end

return statusline
