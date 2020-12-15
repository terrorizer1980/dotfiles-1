local packer = nil

local function config(plugin)
  return "require('plugins." .. plugin .. "')"
end

local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({})
  end

  local use = packer.use

  -- Package manager
  use {'wbthomason/packer.nvim', opt = true}

  ----------------------------------------------------------
  -- Editing
  ----------------------------------------------------------
  use 'andymass/vim-matchup'
  use 'junegunn/vim-easy-align'
  use 'justinmk/vim-sneak'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  ----------------------------------------------------------
  -- Language support
  ----------------------------------------------------------
  use 'euclidianAce/BetterLua.vim'
  use 'HerringtonDarkholme/yats.vim'
  use 'cespare/vim-toml'
  use 'elixir-editors/vim-elixir'
  use 'ericpruitt/tmux.vim'
  use 'hashivim/vim-terraform'
  use 'jparise/vim-graphql'
  use 'othree/html5.vim'
  use 'pangloss/vim-javascript'
  use 'plasticboy/vim-markdown'
  use 'rust-lang/rust.vim'

  ----------------------------------------------------------
  -- Code intelligence
  ----------------------------------------------------------
  use {
    'dense-analysis/ale',
    ft  = {'css', 'javascript', 'typescript', 'json', 'html'},
    config = config('ale'),
  }

  use {
    'neovim/nvim-lspconfig',
    opt = true,
    ft = {'elixir', 'lua'},
    requires = {'nvim-lua/completion-nvim'},
    config = "require('lsp')",
  }

  ----------------------------------------------------------
  -- UI enhancements
  ----------------------------------------------------------
  use 'airblade/vim-gitgutter'
  use {'cocopon/iceberg.vim', config = "vim.cmd('colorscheme iceberg')"}
  use {'liuchengxu/vim-which-key', config = config('vim-which-key')}
  use {'mhinz/vim-startify', config =  config('startify')}
  use 'gkeep/iceberg-dark'
  use {'hoov/tmuxline.vim', cmd = 'Tmuxline', branch = 'truecolor-lightline', setup = config('tmuxline')}
  use {'kyazdani42/nvim-web-devicons', config = "require('nvim-web-devicons').setup({})"}
  use {'itchyny/lightline.vim', config = config('lightline')}
  use 'romainl/vim-qf'

  ----------------------------------------------------------
  -- Tools
  ----------------------------------------------------------
  use {'bfredl/nvim-luadev', cmd = 'Luadev', config = config('nvim-luadev')}
  use 'editorconfig/editorconfig-vim'
  use 'janko/vim-test'
  use 'justinmk/vim-dirvish'
  use {'mileszs/ack.vim', cmd = 'Ack'}
  use 'norcalli/nvim-colorizer.lua'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = config('telescope'),
  }
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  -- use 'tpope/vim-obsession' -- handled by Startify
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rsi'
  use {'voldikss/vim-floaterm', config = config('floaterm')}
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
