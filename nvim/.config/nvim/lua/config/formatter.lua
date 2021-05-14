local config = {
  mix_format =
    function ()
      return {
        exe = 'mix',
        args = {'format'},
        stdin = false,
        tempfile_dir = "/tmp",
      }
    end,

  prettier =
    function ()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
      }
    end
}

require('formatter').setup({
  quiet = true,

  filetype = {
    elixir = {config.mix_format},
    javascript = {config.prettier},
    typescript = {config.prettier},
    typescriptreact = {config.prettier},
  }
})

vim.api.nvim_exec([[
augroup format
  autocmd!
  autocmd BufWritePost *.ex,*.exs,*.js,*.ts,*.tsx FormatWrite
augroup END
]], true)
