require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "c_sharp",
    "css",
    "dockerfile",
    "erlang",
    "gdscript",
    "graphql",
    "javascript",
    "lua",
    "nix",
    "python",
    "regex",
    "swift",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {enable = true},
  indent = {enable = true},
  incremental_selection = {enable = true}
})
