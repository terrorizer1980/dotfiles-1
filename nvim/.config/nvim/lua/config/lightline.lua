local colorscheme = "powerline"
if vim.g.colors_name == "iceberg" then
  colorscheme = "iceberg"
end

vim.g.lightline = {
  colorscheme = colorscheme,

  active = {
    left =  {{"mode", "paste"}, {"readonly", "filename"}, {"lspstatus"}},
    right = {{"lineinfo"}, {"filetype"}, {"gitbranch"}},
  },

  inactive = {
    left =  {{ "readonly", "filename", "modified"}},
    right = {{"lineinfo"}},
  },

  component = {
    lineinfo  = "%3l:%-2v  %3p%% ☰",
    fileinfo  = "%{&ff} [%{&fenc!=#''?&fenc:&enc}]",
  },

  component_function = {
    filename  = "ngs#statusline#Filename",
    lspstatus = "ngs#statusline#LspStatus",
    filetype  = "ngs#statusline#Filetype",
    gitbranch = "ngs#statusline#GitBranch",
  },
}
