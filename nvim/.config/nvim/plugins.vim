call plug#begin(stdpath('data') . '/plugged')

" Editing
Plug 'andymass/vim-matchup'
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

" Language/framework support
Plug 'euclidianAce/BetterLua.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cespare/vim-toml'
Plug 'elixir-editors/vim-elixir'
Plug 'ericpruitt/tmux.vim'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'

" Code intelligence
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" UI enhancements
Plug 'airblade/vim-gitgutter'
Plug 'hoov/tmuxline.vim', {'branch': 'truecolor-lightline'}
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'romainl/vim-qf'

" Tools
Plug 'bfredl/nvim-luadev'
" Plug 'editorconfig/editorconfig-vim'
Plug 'lambdalisue/fern.vim'
Plug 'janko/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'mileszs/ack.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tjdevries/nlua.nvim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'

call plug#end()

" Install vim-plug by cloning to autoload dir from GitHub
function! InstallVimPlug() abort
  let l:url  = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let l:dest = '$HOME/.local/share/nvim/site/autoload/plug.vim'
  execute '!curl -fLo ' . l:dest . ' --create-dirs ' . l:url
endfunction
