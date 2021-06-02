local colors = require("config.galaxyline.colors")

return {
  {
    SLineColumn = {
      provider = "LineColumn",
      highlight = colors.muted_highlight,
    }
  },
  {
    SLinePercent = {
      provider = "LinePercent",
      highlight = colors.muted_highlight,
      separator = " ",
      separator_highlight = colors.muted_highlight,
    }
  },
}
