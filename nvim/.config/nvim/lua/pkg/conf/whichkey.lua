local whichkey = require("which-key")

whichkey.setup({
  icons = {
    breadcrumb = "»",
    separator = "",
    group = "+",
  },
})

whichkey.register({
  [" "] = {
    name = "external",
    e = "explore",
    g = "git",
  },
  b = {
    name = "buffer",
    d = "delete",
    h = "home",
    n = "next",
    p = "previous",
  },
  e = {
    name = "explore",
    e = "toggle-tree",
    f = "tree-file",
  },
  f = {
    name = "find",
    b = "buffers",
    f = "files",
    g = "grep",
    h = "help",
    r = "registers",
    t = "tree-sitter",
  },
  t = {
    name = "toggle",
    i = "indent-guides",
    n = "line-numbers",
    s = "signcolumn",
    g = {
      name = "git",
      s = "signs",
      b = "blame",
    },
  },
  w = {
    name = "windows",
    s = "horizontal-split",
    v = "vertical-split",
    o = "only",
    ["="] = "equalize",
  },
}, {
  prefix = "<Leader>",
})
