# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------------------------------------------------------
# Zsh interactive shell configuration
# ----------------------------------------------------------
# Author: N. G. Scheurich <nick@scheurich.me>
# Repo:   https://github.com/ngscheurich/dotfiles

# ---------------------------------------------------------
# Setup
# ---------------------------------------------------------
# eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"
eval "$(docker-machine env default)"

# ---------------------------------------------------------
# Completion
# ---------------------------------------------------------
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
alias weather="curl wttr.in"
alias zbundle="antibody bundle < .zsh_plugins > .zbundle"
alias zshconfig="$EDITOR $HOME/.zshrc"
alias zshsource="source $HOME/.zshrc"

# ---------------------------------------------------------
# Functions
# ---------------------------------------------------------

# ---------------------------------------------------------
# Sources
# ---------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsecrets ] && source ~/.zsecrets
source $HOME/.zbundle
source $HOME/.fzf.zsh
source $(brew --prefix asdf)/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Don't complain about direnv output
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
