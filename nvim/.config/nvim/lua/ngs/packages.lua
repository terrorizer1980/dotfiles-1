-- ==========================================================
-- Packages
-- ==========================================================

local util = require('ngs.util')
local fn = vim.fn

local function config(name)
  return 'require("config.' .. name .. '")'
end

local function init()
  vim.cmd [[packadd packer.nvim]]

  local packer = require('packer')
  local use = packer.use

  local variant = fn['ngs#variant#Name']()

  local level = 1
  if variant == 'lo-fi' then
    level = 0
  elseif variant == 'experimental' then
    level = 2
  end

  packer.init({
    package_root = util.join_paths(fn['ngs#variant#Pack'](), 'pack'),
    compile_path = fn['ngs#variant#File'](),
    disable_commands = true,
  })

  -- Packer
  use {'wbthomason/packer.nvim', opt = true}

  -- Editing
  if level >= 1 then
    use 'andymass/vim-matchup'
    use 'junegunn/vim-easy-align'
  end
  use 'justinmk/vim-sneak'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  -- Language support
  use 'HerringtonDarkholme/yats.vim'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'calviken/vim-gdscript3'
  use 'cespare/vim-toml'
  use 'elixir-editors/vim-elixir'
  use 'ericpruitt/tmux.vim'
  use 'euclidianAce/BetterLua.vim'
  use 'hashivim/vim-terraform'
  use 'jparise/vim-graphql'
  use 'othree/html5.vim'
  use 'pangloss/vim-javascript'
  use 'plasticboy/vim-markdown'
  use 'rust-lang/rust.vim'

  --  User interface
  if level >= 1 then
    use {'airblade/vim-gitgutter', config = config('gitgutter')}
    use {'glepnir/galaxyline.nvim', disabled = level >= 1}
    use {'glepnir/lspsaga.nvim', config = config('saga')}
    use {'hoov/tmuxline.vim', opt = true, cmd = {'Tmuxline', 'TmuxlineSnapshot'}}
    use {'kyazdani42/nvim-tree.lua', config = config('tree')}
    use {'kyazdani42/nvim-web-devicons', config = config('devicons')}
    use 'romgrk/doom-one.vim'
    use {'mhinz/vim-startify', config = config('startify')}
    use {'onsails/lspkind-nvim', config = config('lspkind')}
    use 'romainl/vim-qf'
    use 'voldikss/vim-floaterm'

    use {'Th3Whit3Wolf/onebuddy', requires = {'tjdevries/colorbuddy.nvim'}}
    use 'joshdick/onedark.vim'
    use 'arzg/vim-colors-xcode'
    use 'chriskempson/base16-vim'
    use 'axvr/photon.vim'
  end

  -- Notes and Prose
  if level >= 1 then
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'reedes/vim-pencil'
    use 'wincent/corpus'
  end

  -- Utilities
  if level >= 1 then
    use {'bfredl/nvim-luadev', opt = true, cmd = {'Luadev'}}
    use {'dense-analysis/ale', config = config('ale')}
    use 'editorconfig/editorconfig-vim'
    use {'hrsh7th/nvim-compe', config = config('compe')}
    use {'hrsh7th/vim-vsnip', config = config('vsnip')}
    use 'hrsh7th/vim-vsnip-integ'
    use {
      'janko/vim-test',
      opt = true,
      config = config('test'),
      cmd = {'TestFile', 'TestSuite', 'TestNearest', 'TestLast'}
    }
    use 'liuchengxu/vista.vim'
    use {'mhinz/vim-mix-format', config = config('mix_format')}
    use {'neovim/nvim-lspconfig', config = config('lsp')}
    use 'norcalli/nvim-colorizer.lua'
    use {
      'nvim-telescope/telescope.nvim',
      config = config('telescope'),
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-projectionist'
  end
  use {'dstein64/vim-startuptime', opt = true, cmd = {'StartupTime'}}
  use 'tpope/vim-rsi'
  use 'justinmk/vim-dirvish'

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()
    return packer[key]
  end
})
