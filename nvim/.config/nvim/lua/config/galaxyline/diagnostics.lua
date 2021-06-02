local colors = require("config.galaxyline.colors")

return {
  {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = {colors.red, colors.line_md}
    }
  },

  {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors.yellow, colors.line_md},
    }
  },

  {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      icon = "  ",
      highlight = {colors.cyan, colors.line_md},
    }
  },

  {
    DiagnosticInfo = {
      provider = "DiagnosticInfo",
      icon = "  ",
      highlight = {colors.blue, colors.line_md},
    }
  },
}
