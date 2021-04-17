vim.g.lightline = {
  colorscheme = "one",

  active = {
    left =  {{"mode", "paste"}, { "readonly", "filename", "modified"}},
    right = {{"lineinfo"}, {}, {"gitbranch", "filetype"}},
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
    gitbranch = "ngs#statusline#GitBranch",
  },
}
