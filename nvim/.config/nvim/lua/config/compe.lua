local map = require("ngs.util").map
local fn, api = vim.fn, vim.api

require("compe").setup({
  min_length = 1,
  source = {
    path      = true,
    buffer    = true,
    tag       = true,
    nvim_lsp  = true,
    nvim_lua  = true,
    vsnip     = true,
  },
})

map("i", "<CR>",    "compe#confirm('<CR>')", {silent = true, expr = true})
map("i", "<C-l>",   "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true, noremap = false})
map("s", "<C-l>",   "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true, noremap = false})
map("i", "<Tab>",   [[luaeval('require("config.compe").tab(1)')]], {silent = true, expr = true, noremap = false})
map("i", "<S-Tab>", [[luaeval('require("config.compe").tab(-1)')]], {silent = true, expr = true, noremap = false})

local function replace_termcodes(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

local function check_backspace()
  local col = fn.col(".") - 1
  if col == 0 or fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

local function prev_next(dir)
  if dir == 1 then
    return replace_termcodes("<C-n>")
  elseif dir == -1 then
    return replace_termcodes("<C-p>")
  end
end

return {
  tab = function (dir)
    if fn.pumvisible() == 1 then
      return prev_next(dir)
    elseif fn.call("vsnip#available", {1}) == 1 then
      return replace_termcodes("<Plug>(vsnip-expand-or-jump)")
    elseif fn.call("vsnip#jumpable", {-1}) == 1 then
      return replace_termcodes("<Plug>(vsnip-jump-prev)")
    elseif check_backspace() and dir == 1 then
      return replace_termcodes("<Tab>")
    elseif dir == 1 then
      return fn["compe#complete"]()
    else
      return replace_termcodes("<S-Tab>")
    end
  end,

  cr = function ()
    if fn["vsnip#expandable"]() then
      return replace_termcodes("<Plug>(vsnip-expand)")
    else
      return replace_termcodes("<CR>")
    end
  end
}
