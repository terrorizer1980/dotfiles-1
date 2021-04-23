-- ==========================================================
-- Colors
-- ==========================================================

local util = require("ngs.util")

local colors = {}

local colorscheme
if vim.fn["ngs#variant#Name"]() == "normal" then
  colorscheme = "iceberg"
end
pcall(vim.cmd, "colorscheme " .. colorscheme)

function colors.get_palette()
  local pal = {
    black   = util.get_highlight_attr("Normal", "bg"),
    red     = util.get_highlight_attr("ErrorMsg", "fg"),
    green   = util.get_highlight_attr("String", "fg"),
    yellow  = util.get_highlight_attr("Structure", "fg"),
    blue    = util.get_highlight_attr("Function", "fg"),
    magenta = util.get_highlight_attr("Keyword", "fg"),
    cyan    = util.get_highlight_attr("Special", "fg"),
    white   = util.get_highlight_attr("Normal", "fg"),
    orange  = util.get_highlight_attr("Boolean", "fg"),
    purple  = util.get_highlight_attr("Conditional", "fg"),
    gray    = util.get_highlight_attr("CursorLine", "bg"),
    sign    = util.get_highlight_attr("SignColumn", "bg"),
  }

  return pal
end

function colors.set_custom()
  local pal = colors.get_palette()

  -- util.highlight("gitgutteradd",    {fg = pal.green, bg = pal.bg})
  -- util.highlight("gitgutterdelete", {fg = pal.red, bg = pal.bg})
  -- util.highlight("gitgutterchange", {fg = pal.orange, bg = pal.bg})

  if vim.g.colors_name == "one" and vim.o.background == "dark"  then
    util.highlight("Normal",          {bg = "#24282f"})
    util.highlight("LineNr",          {fg = "#696b71", bg = pal.gray})
    util.highlight("CursorLineNr",    {fg = "#696b71", bg = pal.gray})
    util.highlight("SignColumn",      {bg = pal.gray})
  elseif vim.g.colors_name == "iceberg" then
  end


  util.highlight("LspDiagnosticsDefaultError",      {fg = pal.red})
  util.highlight("LspDiagnosticsDefaultWarning",    {fg = pal.yellow})
  util.highlight("LspDiagnosticsDefaultInformtion", {fg = pal.cyan})
  util.highlight("LspDiagnosticsDefaultHint",       {fg = pal.blue})

  util.highlight("LspDiagnosticsSignError",       {fg = pal.red, bg = pal.sign})
  util.highlight("LspDiagnosticsSignWarning",     {fg = pal.yellow, bg = pal.sign})
  util.highlight("LspDiagnosticsSignInformation", {fg = pal.cyan, bg = pal.sign})
  util.highlight("LspDiagnosticsSignHint",        {fg = pal.blue, bg = pal.sign})
end

return colors
