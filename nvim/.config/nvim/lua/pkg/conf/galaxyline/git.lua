local condition = require("galaxyline.condition")
local vcs = require("galaxyline.provider_vcs")
local colors = require("iris.palette").get_color_fn

return {
  {
    GitIcon = {
      provider = function() return "  " end,
      highlight = {"NONE", colors("line_base")},
    },
  },
  {
    GitBranch = {
      provider = function() return vcs.get_git_branch() .. " " end,
      condition = condition.check_git_workspace,
      highlight = {colors("white"), colors("line_base")},
    },
  },
}
