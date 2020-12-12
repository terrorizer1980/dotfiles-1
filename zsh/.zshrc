# ----------------------------------------------------------
# Zsh interactive shell configuration
# ----------------------------------------------------------
# Author: N. G. Scheurich <nick@scheurich.me>
# Repo:   https://github.com/ngscheurich/dotfiles

# ---------------------------------------------------------
# Setup
# ---------------------------------------------------------
source $HOME/.zbundle
source $HOME/.fzf.zsh
source $(brew --prefix asdf)/asdf.sh

eval "$(fasd --init auto)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(direnv hook zsh)"
# eval "$(luarocks path --bin)"

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

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
alias la="exa --long --all"
alias lg="lazygit"
alias ll="exa --long"
alias love="/Applications/love.app/Contents/MacOS/love"
alias ls="exa"
alias pico8="/Applications/PICO-8.app/Contents/MacOS/pico8"
alias vboxls="VBoxManage list runningvms"
alias vim="$EDITOR"
alias vimconfig="$EDITOR $HOME/.config/nvim/init.vim"
alias vimdiff="nvim -d"
alias weather="curl wttr.in/Denham+Springs"
alias zbundle="antibody bundle < .zsh_plugins > .zbundle"
alias zshconfig="$EDITOR $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
