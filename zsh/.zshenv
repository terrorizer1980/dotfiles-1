# ----------------------------------------------------------
# Zsh environment variables
# ----------------------------------------------------------
# Author: N. G. Scheurich <nick@scheurich.me>
# Repo:   https://github.com/ngscheurich/dotfiles

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANTIBODY_HOME=~/.antibody
export BROWSER='open'
export EDITOR='nvim'
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export GPG_TTY=$(tty)
export HAXE_STD_PATH=/usr/local/lib/haxe/std
export KERL_CONFIGURE_OPTIONS="--without-javac"
export LANG='en_US.UTF-8'
export PAGER='less'
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/dev/flutter/bin
export PATH=$PATH:$HOME/elixir-ls
export PATH=$PATH:$HOME/go/bin
export TWEEGO_PATH=$HOME/.local/share/twine/story-formats
