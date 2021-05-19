local function mix()
  return {
    exe = "mix",
    args = {"format"},
    stdin = false,
    tempfile_dir = "/tmp"
  }
end

local function rustfmt()
  return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
end

local function prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function luafmt()
  return {
    exe = "lua-format",
    args = {"--", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function shfmt()
  return {
    exe = "shfmt",
    args = {"-s", "-w", "--", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function dockfmt()
  return {
    exe = "dockfmt",
    args = {"--write", "--", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup({
  -- quiet = true,
  logging = true,

  filetype = {
    dockerfile = {dockfmt},
    json = {prettier},
    lua = {luafmt},
    rust = {rustfmt},
    toml = {prettier},
    yaml = {prettier},
    css = {prettier},
    elixir = {mix},
    html = {prettier},
    javascript = {prettier},
    markdown = {prettier},
    sh = {shfmt},
    typescript = {prettier},
    typescriptreact = {prettier},
    zsh = {shfmt}
  }
})

vim.api.nvim_exec([[
augroup format
  autocmd!
  autocmd BufWritePost *.ex,*.exs,*.js,*.ts,*.tsx,*.yaml,*.toml,*.css,*.html,*.md FormatWrite
augroup END
]], true)
