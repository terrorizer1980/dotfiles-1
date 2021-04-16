-- ==========================================================
-- Colors
-- ==========================================================

local util = require('ngs.util')
local cmd = vim.cmd

-- Set the colorscheme
local colorscheme = 'onebuddy'
pcall(cmd, 'colorscheme ' .. colorscheme)

-- Set the palette
util.set_palette()

-- Make matched parens less obtrusive
cmd [[highlight MatchParen guibg=bg gui=underline]]

-- Don't draw listchars in bold
cmd [[highlight NonText gui=none]]

return {
  set_custom = function()
    if vim.g.colors_name == 'onebuddy' then
      local pal = vim.g.ngs_palette
      local column_color = util.get_highlight_attr('CursorLine', 'bg')

      util.highlight('Normal', {bg = '#24282f'})
      util.highlight('LineNr', {fg = '#696b71', bg = column_color})
      util.highlight('SignColumn', {bg = column_color})
      util.highlight('gitgutteradd', {fg = pal.green, bg = column_color})
      util.highlight('gitgutterdelete', {fg = pal.red, bg = column_color})
      util.highlight('gitgutterchange', {fg = pal.orange, bg = column_color})
    end
  end
}
