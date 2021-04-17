-- ==========================================================
-- Colors
-- ==========================================================

local colorscheme = "onedark"
if vim.fn["ngs#variant#Name"]() == "experimental" then
  colorscheme = "onebuddy"
end

pcall(vim.cmd, "colorscheme " .. colorscheme)
