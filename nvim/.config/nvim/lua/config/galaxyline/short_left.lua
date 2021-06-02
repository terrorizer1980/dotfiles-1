local condition = require("galaxyline.condition")
local colors = require("config.galaxyline.colors")

return {
  {
    SLeftPad = {
      provider = function () return " " end,
      highlight = colors.muted_highlight,
    },
  },
  {
    SFileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = colors.muted_highlight,
    },
  },
  {
    SFileName = {
      provider = "FileName",
      condition = condition.buffer_not_empty,
      highlight = colors.muted_highlight,
    },
  }
}
