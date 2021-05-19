local colorscheme = 'powerline'
local colors_name = vim.g.colors_name

if colors_name == 'one' then
  colorscheme = 'one'
elseif colors_name == 'base16-tomorrow-night' then
  colorscheme = 'Tomorrow_Night'
elseif colors_name == 'iceberg' then
  colorscheme = 'iceberg'
elseif colors_name == 'two-firewatch' then
  colorscheme = 'twofirewatch'
end
colorscheme = 'twofirewatch'

local lightline = {}
lightline.colorscheme = colorscheme

lightline.active = {
  left = {{'mode', 'paste'}, {'readonly', 'filename'}, {'lspstatus'}},
  right = {{'lineinfo'}, {'filetype'}, {'gitbranch'}},
}

lightline.inactive = {
  left = {{'readonly', 'filename', 'modified'}},
  right = {{'lineinfo'}},
}

lightline.component = {
  lineinfo = '%3l:%-2v %3p%% ☰',
}

lightline.component_function = {
  filename = 'ngs#statusline#Filename',
  lspstatus = 'ngs#statusline#LspStatus',
  filetype =  'ngs#statusline#Filetype',
  gitbranch = 'ngs#statusline#GitBranch',
}

vim.g.lightline = lightline
