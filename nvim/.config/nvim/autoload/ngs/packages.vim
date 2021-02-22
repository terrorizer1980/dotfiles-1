" ----------------------------------------------------------
" Package management functions
" ----------------------------------------------------------

let s:packdir = stdpath('data') . '/site'

function! ngs#packages#Init() abort
  " Load minpac
  packadd minpac

  " Initialize minpac, setting preferred `dir`
  call minpac#init({'dir': s:packdir})

  " Let minpac manage itself
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " --------------------------------------------------------
  "  Editing
  " --------------------------------------------------------
  call minpac#add('andymass/vim-matchup')
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

  " --------------------------------------------------------
  "  Language support
  " --------------------------------------------------------
  call minpac#add('HerringtonDarkholme/yats.vim')
  call minpac#add('MaxMEllon/vim-jsx-pretty')
  call minpac#add('cespare/vim-toml')
  call minpac#add('elixir-editors/vim-elixir')
  call minpac#add('ericpruitt/tmux.vim')
  call minpac#add('euclidianAce/BetterLua.vim')
  call minpac#add('hashivim/vim-terraform')
  call minpac#add('jparise/vim-graphql')
  call minpac#add('othree/html5.vim')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('rust-lang/rust.vim')

  " --------------------------------------------------------
  "  Code intelligence
  " --------------------------------------------------------
  call minpac#add('dense-analysis/ale')
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('nvim-lua/completion-nvim')"
  " call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})

  " --------------------------------------------------------
  "  User interface
  " --------------------------------------------------------
  call minpac#add('arzg/vim-colors-xcode')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('mhinz/vim-startify')
  call minpac#add('hoov/tmuxline.vim', {'type': 'opt'})
  " call minpac#add('nvim-treesitter/playground')
  call minpac#add('kyazdani42/nvim-tree.lua')
  call minpac#add('kyazdani42/nvim-web-devicons')
  call minpac#add('romainl/vim-qf')

  " --------------------------------------------------------
  " Utilities
  " --------------------------------------------------------
  call minpac#add('bfredl/nvim-luadev', {'type': 'opt'})
  call minpac#add('dstein64/vim-startuptime', {'type': 'opt'})
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('janko/vim-test', {'type': 'opt'})
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('mhinz/vim-mix-format', {'type': 'opt'})
  call minpac#add('mileszs/ack.vim')
  call minpac#add('norcalli/nvim-colorizer.lua')
  call minpac#add('sirver/UltiSnips')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-git')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('voldikss/vim-floaterm')
  call minpac#add('vimwiki/vimwiki')
endfunction

function! ngs#packages#List() abort
  call ngs#packages#Init()
  return join(sort(keys(minpac#getpluglist())), "\n")
endfunction

function! ngs#packages#OpenDir(packname) abort
  call ngs#packages#Init()

    call termopen(split(&shell), {
          \ 'cwd': minpac#getpluginfo(a:packname).dir,
          \ 'term_finish': 'close'
          \ })
endfunction

function! ngs#packages#MinpacInstall() abort
  let l:url = 'https://github.com/k-takata/minpac.git'
  let l:dest = s:packdir . '/pack/minpac/opt/minpac'

  if input('Download minpac? (y/N) ') == 'y'
  	silent execute '!git clone ' . l:url . ' ' . l:dest
  	echo '✔ minpac downloaded successfully'
  end
endfunction
