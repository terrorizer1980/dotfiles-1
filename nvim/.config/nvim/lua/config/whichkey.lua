local whichkey = require("whichkey_setup")

vim.g.which_key_timeout = 300
vim.g.which_key_centered = 0

local keymap = {
  b = {
    name = "+buffers",
    d = "delete",
    h = "home",
    n = "next",
    p = "previous",
  },

  f = {
    name = "+find",
    b = "buffers",
    c = "in-buffer",
    f = "files",
    g = "grep",
    h = "help-tags",
    r = "registers",
    t = "treesitter",
  },

  l = {
    name = "+lsp",
    a = "code-action",
    d = "preview-definition",
    D = "goto-definition",
    e = "line-diagnostics",
    f = "format-file",
    h = "hover",
    r = "references",
    s = "document-symbols",
    S = "workspace-symbols",
  },

  r = {
    name = "run",
  },

  t = {
    name = "+toggle",
    l = "location-list",
    q = "quickfix-list",
  },

  w = {
    name = "+windows <C-w>",
    o = "only",
    s = "split-horizontal",
    q = "close",
    v = "split-vertical",
    ["="] = "set-equal",
  }
}

whichkey.register_keymap("leader", keymap)
