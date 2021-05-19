-- ==========================================================
-- Packages
-- ==========================================================

local util = require("ngs.util")
local fn, cmd = vim.fn, vim.cmd

local packages = {}

function packages.packer_get()
  local url = "https://github.com/wbthomason/packer.nvim"
  local dest = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  if vim.fn.input("Download packer? (y/N) ") == "y" then
    cmd("silent execute '!git clone " .. url .. " " .. dest .. "'")
    print("✔ packer downloaded successfully")
  end
end

function packages.pack()
  if vim.env.NVIM_PACK then
    return vim.env.NVIM_PACK
  end
  return "standard"
end

function packages.path()
  return util.join_paths(fn.stdpath("data"), "packs", packages.pack())
end

function packages.file()
  local file = packages.pack() .. ".vim"
  return util.join_paths(fn.stdpath("data"), "packfiles", file)
end

function packages.load()
  cmd("set packpath+=" .. packages.path())
  cmd("source " .. packages.file())
end

local function init()
  vim.cmd("packadd packer.nvim")

  local packer = require("packer")

  packer.init({
    package_root = util.join_paths(packages.path(), "pack"),
    compile_path = packages.file(),
    disable_commands = true,
  })

  local levels = {
    lofi         = 0,
    standard     = 1,
    experimental = 2,
  }
  local level = levels[packages.pack()]
  local use = packer.use

  local function config(name)
    return "require('config." .. name .. "')"
  end

  -- Package manager
  use {"wbthomason/packer.nvim", opt = true}

  -- Editing
  use "andymass/vim-matchup"
  use {"junegunn/vim-easy-align", config = config("easyalign")}
  use "justinmk/vim-sneak"
  use "tpope/vim-abolish"
  use "tpope/vim-commentary"
  use "tpope/vim-eunuch"
  use "tpope/vim-repeat"
  use "tpope/vim-sleuth"
  use "tpope/vim-speeddating"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"

  -- Language support
  use "HerringtonDarkholme/yats.vim"
  use "MaxMEllon/vim-jsx-pretty"
  use "calviken/vim-gdscript3"
  use "cespare/vim-toml"
  use "elixir-editors/vim-elixir"
  use "ericpruitt/tmux.vim"
  use "euclidianAce/BetterLua.vim"
  use "hashivim/vim-terraform"
  use "jparise/vim-graphql"
  use "othree/html5.vim"
  use "pangloss/vim-javascript"
  use "plasticboy/vim-markdown"
  use "rust-lang/rust.vim"

  --  User interface
  if level >= 1 then
    use {"hoov/tmuxline.vim", opt = true, cmd = {"Tmuxline", "TmuxlineSnapshot"}}
    use {"hrsh7th/nvim-compe", config = config("compe")}
    use {"itchyny/lightline.vim", config = config("lightline")}
    use {"kyazdani42/nvim-tree.lua", config = config("nvim_tree")}
    use {"kyazdani42/nvim-web-devicons", config = config("devicons")}
    use "liuchengxu/vista.vim"
    use {"mhinz/vim-startify", config = config("startify")}
    use {"norcalli/nvim-colorizer.lua"}
    use "nvim-lua/lsp-status.nvim"
    use {"onsails/lspkind-nvim", config = config("lspkind")}
    use "romainl/vim-qf"
    use {"voldikss/vim-floaterm", config = config("floaterm")}
  end

  -- Colorschemes
  if level >= 1 then
    use "axvr/photon.vim"
    use "rakr/vim-one"
    use "rakr/vim-two-firewatch"
  end
  if level >= 2 then
    use "bluz71/vim-moonfly-colors"
  end

  -- Notes and prose
  if level >= 1 then
    use "junegunn/goyo.vim"
    use "junegunn/limelight.vim"
    use "reedes/vim-pencil"
  end

  -- Navigation
  if level >= 1 then
    use {
      "nvim-telescope/telescope.nvim",
      config = config("telescope"),
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use "tpope/vim-projectionist"
  end
  use "justinmk/vim-dirvish"

  -- Code intelligence
  if level >= 1 then
    use {"neovim/nvim-lspconfig", config = config("lspconfig")}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  end

  -- Tools
  if level >= 1 then
    use {"bfredl/nvim-luadev", opt = true, cmd = {"Luadev"}}
    use {"hrsh7th/vim-vsnip", config = config("vsnip")}
    use "hrsh7th/vim-vsnip-integ"
    use {"janko/vim-test", config = config("vim_test")}
    use "mhartington/formatter.nvim"
    use "tpope/vim-fugitive"
  end
  use "editorconfig/editorconfig-vim"
  use {"dstein64/vim-startuptime", opt = true, cmd = {"StartupTime"}}
  use "tpope/vim-rsi"

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()

    if packer[key] then
      return packer[key]
    else
      return packages[key]
    end
  end
})
