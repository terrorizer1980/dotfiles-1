local util = require("ngs.util")
local fzf = {}

function fzf.variables()
  local vars = vim.fn.execute("let")
  local opts = {source = util.str_split(vars, "\n")}
  local wrap = vim.fn["fzf#wrap"](opts)
  vim.fn["fzf#run"](wrap)
end

function fzf.packages()
  local packs = vim.fn["ngs#packages#List"]()
  local opts = {source = util.str_split(packs, "\n")}
  local wrap = vim.fn["fzf#wrap"](opts)
  vim.fn["fzf#run"](wrap)
end

return fzf
