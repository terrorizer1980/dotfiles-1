local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.provider_fileinfo")
local colors = require("config.galaxyline.colors")

return {
  {
    FileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, colors.bg},
    },
  },
  {
    FileName = {
      provider = "FileName",
      condition = condition.buffer_not_empty,
      highlight = {colors.magenta, colors.bg},
      separator = " ",
      separator_highlight = {"NONE", colors.line_md},
    },
  },
}
