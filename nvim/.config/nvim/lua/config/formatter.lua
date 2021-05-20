local util = require("ngs.util")

local function mix_format()
  return {
    exe   = "mix",
    args  = {"format"},
    stdin = false,
    tempfile_dir = "/tmp"
  }
end

local function prettier()
  return {
    exe   = "prettier",
    args  = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function luafmt()
  return {
    exe   = "lua-format",
    args  = {"--", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function rustfmt()
  return {
    exe   = "rustfmt",
    args  = {"--emit=stdout"},
    stdin = true
  }
end

local function shfmt()
  return {
    exe   = "shfmt",
    args  = {"-s", "-w", "--", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function dockfmt()
  return {
    exe   = "dockfmt",
    args  = {"--write", "--", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup({
  -- quiet = true,
  logging = true,

  filetype = {
    dockerfile      = {dockfmt},
    json            = {prettier},
    lua             = {luafmt},
    rust            = {rustfmt},
    toml            = {prettier},
    yaml            = {prettier},
    css             = {prettier},
    elixir          = {mix_format},
    html            = {prettier},
    javascript      = {prettier},
    markdown        = {prettier},
    sh              = {shfmt},
    typescript      = {prettier},
    typescriptreact = {prettier},
    zsh             = {shfmt}
  }
})

local exts = {
  "css",
  "ex",
  "exs",
  "html",
  "js",
  "markdown",
  "md",
  "toml",
  "ts",
  "tsx",
  "yaml",
}
exts = vim.tbl_map(function (x) return "*." .. x end, exts)
exts = table.concat(exts, ",")

util.augroup("format", {"BufWritePost " .. exts .. " FormatWrite"})
