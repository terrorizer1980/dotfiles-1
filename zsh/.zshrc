# ----------------------------------------------------------
# Zsh interactive shell configuration
# ----------------------------------------------------------
# Author: N. G. Scheurich <nick@scheurich.me>
# Repo:   https://github.com/ngscheurich/dotfiles

# ---------------------------------------------------------
# Setup
# ---------------------------------------------------------
source ~/.zbundle

eval "$(fasd --init auto)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(direnv hook zsh)"
eval "$(luarocks path --bin)"

. $(brew --prefix asdf)/asdf.sh

fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit
compinit

kitty + complete setup zsh | source /dev/stdin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---------------------------------------------------------
# Options
# ---------------------------------------------------------
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY

# ---------------------------------------------------------
# Aliases
# ---------------------------------------------------------
alias curlh="curl -s -D - -o /dev/null"
alias giga="gigalixir"
alias git="hub"
alias http="python -m http.server"
alias l="exa"
alias la="lsd --all"
alias lg="lazygit"
alias ll="lsd --long --all"
alias ls="lsd"
alias vboxls="VBoxManage list runningvms"
alias vim="$EDITOR"
alias vimconfig="$EDITOR $HOME/.config/nvim/init.vim"
alias vimdiff="nvim -d"
alias weather="curl wttr.in/Baton+Rouge"
alias zbundle="antibody bundle < .zsh_plugins > .zbundle"
alias zshconfig="$EDITOR $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"
