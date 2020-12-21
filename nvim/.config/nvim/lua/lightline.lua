vim.g.lightline = {
  colorscheme = 'base16_default_dark',

  active = {
    left  = {{'mode', 'paste'}, {'git', 'readonly'}, {'filename', 'modified'}},
    right = {{'lineinfo'}, {'percent'}, {'method', 'obsesssion', 'filetype', 'fileinfo'}},
  },

  inactive = {
    left  = {{'git', 'readonly'}, {'filename', 'modified'}},
    right = {{'obsession', 'filetype', 'fileinfo'}}
  },

  component = {
    fileencoding = '%{&fenc!=#""?&fenc:&enc}',
    fileformat   = '%{&ff}',
    fileinfo     = '%{&ff}[%{&fenc!=#""?&fenc:&enc}]',
    filename     = '%t',
    filetype     = '%{&ft!=#""?&ft:"no ft"}',
    lineinfo     = '%3l:%-2v ',
    mode         = '%{lightline#mode()}',
    modified     = '[%M]',
    -- obsession    = '%{ObsessionStatus()}',
    paste        = '%{&paste?"PASTE":""}',
    percent      = '%3p%% ☰ ',
    readonly     = '%R',
  },

  component_function = {
    git = 'GitCurrentBranch'
  },
}

