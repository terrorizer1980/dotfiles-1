local colors = require("config.galaxyline.colors")

local modes = {
  n        = {"NORMAL",    colors.cyan},
  no       = {"OPERATOR",  colors.blue5},
  nov      = {"OPERATOR",  colors.blue5},
  noV      = {"OPERATOR",  colors.blue5},
  ["no"] = {"OPERATOR",  colors.blue5},
  niI      = {"NORMAL",    colors.blue0},
  niR      = {"NORMAL",    colors.blue0},
  niV      = {"NORMAL",    colors.blue0},
  v        = {"VISUAL",    colors.orange},
  V        = {"V-LINE",    colors.orange},
  [""]   = {"V-BLOCK",   colors.orange},
  s        = {"SELECT",    colors.yellow},
  S        = {"S-LINE",    colors.yellow},
  [""]   = {"S-BLOCK",   colors.yellow},
  i        = {"INSERT",    colors.teal},
  ic       = {"COMPLETE",  colors.green1},
  ix       = {"COMPLETE",  colors.green1},
  R        = {"REPLACE",   colors.red1},
  Rc       = {"REPLACE",   colors.red1},
  Rv       = {"REPLACE",   colors.red1},
  Rx       = {"REPLACE",   colors.red1},
  c        = {"COMMAND",   colors.purple},
  cv       = {"EX",        colors.purple},
  ce       = {"EX",        colors.purple},
  r        = {"CONTINUE?", colors.purple},
  rm       = {"MORE...",   colors.purple},
  ["r?"]   = {"CONFIRM?",  colors.purple},
  ["!"]    = {"SHELL",     colors.purple},
  t        = {"TERMINAL",  colors.purple},
}

return {
  {
    Mode = {
      provider = function()
        local label = "???"
        local color = colors.comment
        local cfg = modes[vim.fn.mode()]
        if cfg then
          label = cfg[1] .. " "
          color = cfg[2]
        end
        vim.cmd("hi GalaxyMode guifg=" .. color .. " guibg=" .. colors.line_dk)
        vim.cmd("hi GalaxyLineColumnIcon guifg=" .. color)
        vim.cmd("hi GalaxyLinePercentIcon guifg=" .. color)
        vim.cmd("hi GalaxyGitIcon guifg=" .. color)
        return "▊ " .. label
      end,
      separator = " ",
      separator_highlight = {colors.none, colors.bg}
    },
  },
}
