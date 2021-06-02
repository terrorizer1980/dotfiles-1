local condition = require("galaxyline.condition")
local colors = require("config.galaxyline.colors")

return {
  {
    DiffAdd = {
      provider = "DiffAdd",
      condition = condition.hide_in_width,
      icon = " +",
      highlight = {colors.green, colors.line_md},
    }
  },

  {
    DiffModified = {
      provider = "DiffModified",
      condition = condition.hide_in_width,
      icon = " *",
      highlight = {colors.yellow, colors.line_md},
    }
  },

  {
    DiffRemove = {
      provider = "DiffRemove",
      condition = condition.hide_in_width,
      icon = " -",
      highlight = {colors.red1, colors.line_md},
    }
  }
}
