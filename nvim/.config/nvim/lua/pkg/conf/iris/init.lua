require("iris").setup({
  palettes = {
    tokyonight = require("pkg.conf.iris.tokyonight"),
    moonfly = require("pkg.conf.iris.moonfly"),
  },

  callbacks = {
    function(_) require("pkg.conf.galaxyline") end,
    require("pkg.conf.iris.nvim"),
    require("pkg.conf.iris.tmux"),
    require("pkg.conf.iris.kitty"),
  }
})
