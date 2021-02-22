local compe = require('compe')
local util = require('ngs.util')
local fn, api = vim.fn, vim.api

local M = {}

compe.setup({
  min_length = 1,
  source = {
    path      = true,
    buffer    = true,
    tag       = true,
    nvim_lsp  = true,
    nvim_lua  = true,
    -- ultisnips = true,
    vsnip     = true,
  },
})

local function t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

local function check_backspace()
  local col = fn.col('.') - 1
  if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local function prev_next(dir)
  if dir == 1 then
    return t'<C-n>'
  elseif dir == -1 then
    return t'<C-p>'
  end
end

function M.tab(dir)
  if fn.pumvisible() == 1 then
    return prev_next(dir)
  elseif fn.call('vsnip#available', {1}) == 1 then
    return t'<Plug>(vsnip-expand-or-jump)'
  elseif fn.call('vsnip#jumpable', {-1}) == 1 then
    return t'<Plug>(vsnip-jump-prev)'
  elseif check_backspace() and dir == 1 then
    return t'<Tab>'
  elseif dir == 1 then
    return fn['compe#complete']()
  else
    return t'<S-Tab>'
  end
end

function M.cr()
  if fn['vsnip#expandable']() then
    return t'<Plug>(vsnip-expand)'
  else
    return t'<CR>'
  end
end

return M
