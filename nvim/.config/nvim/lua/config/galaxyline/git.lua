local condition = require("galaxyline.condition")
local vcs = require("galaxyline.provider_vcs")
local colors = require("config.galaxyline.colors")

return {
  {
    GitIcon = {
      provider = function () return "  " end,
      highlight = {"NONE", colors.line_md},
    }
  },
  {
    GitBranch = {
      provider = function ()
        return  vcs.get_git_branch() .. " "
      end,
      condition = condition.check_git_workspace,
      highlight = {colors.fg_dark, colors.line_md},
    }
  }
}
