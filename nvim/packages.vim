function! PackInit() abort
  packadd minpac

  " Package manager
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Code intelligence
  call minpac#add('dense-analysis/ale')
  call minpac#add('hrsh7th/vim-vsnip')
  call minpac#add('hrsh7th/vim-vsnip-integ')
  call minpac#add('neovim/nvim-lsp', {'type': 'opt'})
  call minpac#add('nvim-lua/completion-nvim', {'type': 'opt'})
  call minpac#add('nvim-lua/diagnostic-nvim', {'type': 'opt'})

  " Language/framework support
  call minpac#add('HerringtonDarkholme/yats.vim')
  call minpac#add('calviken/vim-gdscript3')
  call minpac#add('cespare/vim-toml')
  call minpac#add('elixir-editors/vim-elixir')
  call minpac#add('ericpruitt/tmux.vim')
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('jparise/vim-graphql')
  call minpac#add('othree/html5.vim')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('tbastos/vim-lua')
  call minpac#add('tpope/vim-git')

  " Editing
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')

  " Colorschemes
  call minpac#add('arzg/vim-colors-xcode')
  call minpac#add('cocopon/iceberg.vim')
  call minpac#add('lifepillar/vim-solarized8')

  " UI enhancements
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('hoov/tmuxline.vim', {'branch': 'truecolor-lightline'})
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('lambdalisue/fern.vim')
  call minpac#add('lambdalisue/nerdfont.vim')
  call minpac#add('lambdalisue/fern-renderer-nerdfont.vim')
  call minpac#add('lambdalisue/glyph-palette.vim')
  call minpac#add('nvim-lua/lsp-status.nvim')
  call minpac#add('romainl/vim-qf')

  " Utilities
  call minpac#add('andymass/vim-matchup')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('janko/vim-test')
  call minpac#add('jreybert/vimagit')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('mhinz/vim-mix-format')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('norcalli/nvim-colorizer.lua')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-rsi')

  " Evaluating
  call minpac#add('mbbill/undotree')
endfunction

function! PackInstall() abort
  silent !git clone https://github.com/k-takata/minpac.git
        \ ~/.config/nvim/pack/minpac/opt/minpac
  echo "✔ minpac was installed successfully"
endfunction

command! PackInstall call PackInstall()
command! PackUpdate  call PackInit() | call minpac#update()
command! PackClean   call PackInit() | call minpac#clean()
command! PackStatus  packadd minpac  | call minpac#status()
