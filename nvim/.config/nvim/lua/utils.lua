local api = vim.api
local lsp = vim.lsp
local fn  = vim.fn

local M = {}

-- Conveniences for key mapping
local function map(mode, lhs, rhs, opts, buflocal)
  if opts == nil then opts = {} end
  if buflocal then
    api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

local modes = {'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't'}
for _, mode in pairs(modes) do
	M[mode .. 'map'] = function (lhs, rhs, opts, buflocal)
    map(mode, lhs, rhs, opts, buflocal)
  end

	M[mode .. 'noremap'] = function (lhs, rhs, opts, buflocal)
	  if opts == nil then opts = {} end
	  opts.noremap = true
    map(mode, lhs, rhs, opts, buflocal)
	end
end

-- Install packer.nvim, then add to packpath
function M.install_packer()
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	local packer_path = '/site/pack/packer/opt/packer.nvim'
	local install_path = fn.stdpath('data') .. packer_path

	if fn.empty(fn.glob(install_path)) > 0 then
    vim.cmd('!git clone  ' .. packer_url .. ' ' .. install_path)
    vim.cmd('packadd packer')
	end
end

-- LSP functions
function M.lsp_restart()
  M.lsp_stop()
  vim.cmd('edit')
end

function M.lsp_stop()
  lsp.stop_client(lsp.get_active_clients())
end

function M.lsp_info()
  print(vim.inspect(vim.lsp.buf_get_clients()))
end

-- Check if `plugin` is on the runtimepath
function M.plugin_loaded(plugin)
	print(string.find(vim.o.rtp, '/' .. plugin .. ',') ~= nil)
end

return M
