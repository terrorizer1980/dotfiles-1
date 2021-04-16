local exists, devicons = pcall(require, 'nvim-web-devicons')

if not exists then return end

devicons.setup({
  override = {
    dirvish  = {icon = ''},
    zsh      = {icon = ''},
    quickfix = {icon = ''},
    erlang   = {color = '#A1022B'},
    NvimTree = {icon = '滑'},
    text     = {icon = ''},
  }
})
