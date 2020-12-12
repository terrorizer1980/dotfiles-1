local api = vim.api
local lsp = vim.lsp
local fn  = vim.fn

local M = {}

-- Conveniences for key mapping
local modes = {'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't'}
for _, v in pairs(modes) do
	M[v .. 'map'] = function (lhs, rhs, opts)
	  if opts == nil then opts = {} end
    api.nvim_set_keymap(v, lhs, rhs, opts)
  end

	M[v .. 'noremap'] = function (lhs, rhs, opts)
	  if opts == nil then opts = {} end
	  opts.noremap = true
    api.nvim_set_keymap(v, lhs, rhs, opts)
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

-- Restart LSP client
function M.restart_lsp()
  lsp.stop_client(lsp.get_active_clients())
  vim.cmd('edit')
end

-- Check if `plugin` is on the runtimepath
function M.plugin_loaded(plugin)
	print(string.find(vim.o.rtp, '/' .. plugin .. ',') ~= nil)
end

return M
