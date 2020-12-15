local nnoremap = require('utils').nnoremap

vim.cmd("call which_key#register('<Space>', 'g:which_key_map')")

nnoremap('<Leader>', "<Cmd>WhichKey '<Space>'<CR>", {silent = true})

vim.g.which_key_timeout = 500

vim.g.which_key_map = {
  b = {
    name = '+buffers',
    d = 'delete-buffer',
    h = 'home',
    n = 'next-buffer',
    p = 'prev-buffer',
  },

  c = {
    name = '+close',
    c = 'quickfix-list',
    l = 'location-list',
  },

  e = 'explore',

  f = {
    name = '+find',
    b = 'buffers',
    f = 'files',
    g = 'grep',
    h = 'help-tags',
    r = 'registers',
    t = 'telescope-builtins',
  },

  l = {
    name = '+lsp',
    a = 'code-action',
    c = {
      name = '+control',
      r    = 'restart',
      s    = 'stop',
    },
    d = 'line-diagnostics',
    f = 'format',
    h = 'hover',
    i = 'info',
    r = 'references',
    R = 'rename',
    s = 'document-symbol',
    S = 'workspace-symbol',
    g = {
      name = '+goto',
      d = 'definition',
      t = 'type-definition',
      i = 'implementation',
    },
  },

  r = {
    name = '+replace',
    b    = 'buffer',
    l    = 'line',
  },

  w = {
    name = '+window',
    h = 'home',
    s = 'horizontal-split',
    v = 'vertical-split',
    q = 'quit',
  },
}
