if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" Code intelligence
Plug 'dense-analysis/ale'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

" Language/framework support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'calviken/vim-gdscript3'
Plug 'cespare/vim-toml'
Plug 'elixir-editors/vim-elixir'
Plug 'ericpruitt/tmux.vim'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'tbastos/vim-lua'
Plug 'tpope/vim-git'

" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Colorschemes
Plug '~/Projects/dromad-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'cocopon/iceberg.vim'
Plug 'lifepillar/vim-solarized8'

" UI enhancements
Plug 'airblade/vim-gitgutter'
Plug 'hoov/tmuxline.vim', {'branch': 'truecolor-lightline'}
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'liuchengxu/vim-clap'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'romainl/vim-qf'

" Utilities
Plug 'andymass/vim-matchup'
Plug 'chrisbra/Colorizer'
Plug 'editorconfig/editorconfig-vim'
Plug 'janko/vim-test'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-vinegar'

" Evaluating
Plug 'mbbill/undotree'
Plug 'fsharpasharp/vim-dirvinist'

call plug#end()
