local whichkey = require("which-key")

whichkey.setup({icons = {breadcrumb = "»", separator = "", group = "+"}})

whichkey.register({
  [" "] = {name = "more"},
  b = {name = "buffer", d = "delete", h = "home", n = "next", p = "previous"},
  e = {name = "explore", e = "toggle-tree", f = "goto-file"},
  f = {
    name = "find",
    b = "buffers",
    f = "files",
    g = "grep",
    h = "help",
    r = "registers",
    t = "tree-sitter",
  },
  l = {
    name = "lsp",
    d = "goto-definition",
    h = "hover",
    a = "code-action",
    D = "line-diagnostics",
    f = "format-buffer",
    r = "references",
    s = "document-symbols",
    S = "workspace-symbols",
  },
  t = {
    name = "test",
    f = "file",
    l = "last",
    n = "nearest",
    s = "suite",
    v = "visit",
  },
  u = {
    name = "ui-toggle",
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
  x = {name = "external", e = "explore", g = "git"},
}, {prefix = "<Leader>"})
