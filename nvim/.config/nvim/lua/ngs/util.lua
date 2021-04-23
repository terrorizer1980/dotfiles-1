-- ==========================================================
-- Utilities
-- ==========================================================

local util = {}

local api, cmd = vim.api, vim.cmd

local function apply_default_opts(opts)
  local defaults = {noremap = true}
  if opts then
    return vim.tbl_extend("force", defaults, opts)
  else
    return defaults
  end
end

function util.map(mode, lhs, rhs, opts)
  local options = apply_default_opts(opts)
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function util.bufmap(buffer, mode, lhs, rhs, opts)
  local options = apply_default_opts(opts)
  api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
end

function util.get_packer()
  local url = "https://github.com/wbthomason/packer.nvim"
  local dest = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if vim.fn.input("Download packer? (y/N) ") == "y" then
    cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
    print("✔ packer downloaded successfully")
  end
end

function util.set(opt, val, scopes)
  for  _, scope in ipairs(scopes) do
    vim[scope][opt] = val
  end
end

function util.get_highlight_attr(group, attr)
  local syntax_id = vim.fn.synIDtrans(vim.fn.hlID(group))
  return vim.fn.synIDattr(syntax_id, attr)
end

function util.split(str, char)
  local tokens = {}
  char = char or "%s"

  for token in string.gmatch(str, "[^" .. char .. "]+") do
    table.insert(tokens, token)
  end

  return tokens
end

function util.inspect(obj, opts)
  if opts == nil then opts = {} end
  print(vim.inspect(obj, opts))
end

function util.augroup(name, defs)
  cmd("augroup " .. name)
  cmd("autocmd!")
  for _, def in ipairs(defs) do
    vim.api.nvim_exec("autocmd " .. def, "")
  end
  cmd("augroup END")
end

function util.globally_exists(name)
  if _G[name] then return true else return false end
end

function util.join_paths(...)
  return table.concat({...}, "/")
end

function util.highlight(group, opts)
  local fg = opts.fg or "none"
  local bg = opts.bg or "none"
  local command = string.format("highlight %s guifg=%s guibg=%s", group, fg, bg)
  cmd(command)
end

function util.toggle_qflist()
  for _, winnr in ipairs(vim.api.nvim_list_wins()) do
    if vim.fn.getwininfo(winnr)[1].quickfix then
      cmd("cclose")
      return
    end
  end
  cmd("copen")
end

function util.palette()
  local palette = {
    bg = util.get_highlight_attr("CursorLine", "bg"),
    fg = util.get_highlight_attr("Normal", "fg"),

    black   = util.get_highlight_attr("Normal", "bg"),
    red     = util.get_highlight_attr("Constant", "fg"),
    green   = util.get_highlight_attr("String", "fg"),
    yellow  = util.get_highlight_attr("Label", "fg"),
    blue    = util.get_highlight_attr("Function", "fg"),
    magenta = util.get_highlight_attr("Keyword", "fg"),
    cyan    = util.get_highlight_attr("Special", "fg"),
    white   = util.get_highlight_attr("Normal", "fg"),
    orange  = util.get_highlight_attr("Boolean", "fg"),
    purple  = util.get_highlight_attr("Conditional", "fg"),
    gray    = util.get_highlight_attr("StatusLine", "bg"),
  }

  return palette
end

function util.lightline_reload()
  vim.fn["lightline#init"]()
  vim.fn["lightline#colorscheme"]()
  vim.fn["lightline#update"]()
end

return util
