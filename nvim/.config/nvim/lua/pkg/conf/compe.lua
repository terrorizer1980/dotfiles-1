local autopairs = require("nvim-autopairs")
local map = require("ngs.util").map
local fn = vim.fn

require("compe").setup({
  min_length = 1,
  source = {
    path = true,
    buffer = true,
    tag = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
  }
})

local function send(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function tab()
  if fn.pumvisible() == 1 then
    return send("<C-n>")
  elseif fn.call("vsnip#available", {1}) == 1 then
    return send("<Plug>(vsnip-expand-or-jump)")
  else
    return send("<Tab>")
  end
end

local function s_tab()
  if fn.pumvisible() == 1 then
    return send("<C-p>")
  elseif fn.call("vsnip#jumpable", {-1}) == 1 then
    return send("<Plug>(vsnip-jump-prev)")
  else
    return send("<S-Tab>")
  end
end

local function cr()
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](autopairs.esc("<LT><CR>", "i"))
    else
      return autopairs.esc("<cr>")
    end
  else
    return autopairs.autopairs_cr()
  end
end

map("i", "<CR>",    [[compe#confirm()]], {expr = true, silent = true})
-- map("i", "<CR>",    [[luaeval('require("pkg.conf.compe").cr()')]],    {expr = true})
map("i", "<Tab>",   [[luaeval('require("pkg.conf.compe").tab()')]],   {expr = true, noremap = false})
map("s", "<Tab>",   [[luaeval('require("pkg.conf.compe").tab()')]],   {expr = true, noremap = false})
map("i", "<S-Tab>", [[luaeval('require("pkg.conf.compe").s_tab()')]], {expr = true, noremap = false})
map("s", "<S-Tab>", [[luaeval('require("pkg.conf.compe").s_tab()')]], {expr = true, noremap = false})

return {tab = tab, s_tab = s_tab, cr = cr}
