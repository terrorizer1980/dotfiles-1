local exists, lspkind  = pcall(require, 'lspkind')

if not exists then return end

lspkind.init({
  symbol_map = {
    Function = ''
  }
})
