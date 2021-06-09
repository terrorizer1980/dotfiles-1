local lsp_format = {}

local cmd, g = vim.cmd, vim.g

local format_types = {"lua"}
local augroup = "lsp_format"
local format_cmd = "lua require('ngs.lsp_format').format()"
local autocmd = string.format("au %s BufWritePre <buffer> %s", augroup,
  format_cmd)
cmd("augroup " .. augroup)

if g.lsp_format_enabled == nil then g.lsp_format_enabled = true end

function lsp_format.setup(filetypes)
  for _, i in ipairs(filetypes) do
    for _, j in ipairs(format_types) do
      if i == j then
        cmd(autocmd)
        return
      end
    end
  end
end

function lsp_format.format()
  if g.lsp_format_enabled then vim.lsp.buf.formatting_sync({}, 1000) end
end

function lsp_format.toggle_format()
  if g.lsp_format_enabled then
    g.lsp_format_enabled = false
  else
    g.lsp_format_enabled = true
  end
end

cmd [[command! LspFormatEnable let g:lsp_format_enabled = v:true]]
cmd [[command! LspFormatDisable let g:lsp_format_enabled = v:false]]
cmd [[command! LspFormatToggle lua require("ngs.lsp_format").toggle_format () ]]

return lsp_format
