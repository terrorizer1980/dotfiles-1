local colors = require("config.galaxyline.colors")

local text_highlight = {colors.fg_dark, colors.bg}

return {
  {
    LineColumn = {
      provider = "LineColumn",
      highlight = text_highlight,
      separator = " ",
      separator_highlight = text_highlight,
    }
  },
  {
    LineColumnIcon = {
      provider = function () return "  " end,
      highlight = {"NONE", colors.bg},
    },
  },
  {
    LinePercent = {
      provider = "LinePercent",
      highlight = text_highlight,
      separator = " ",
      separator_highlight = text_highlight,
    }
  },
  {
    LinePercentIcon = {
      provider = function () return " ☰ " end,
      highlight = {"NONE", colors.bg},
    },
  }
}
