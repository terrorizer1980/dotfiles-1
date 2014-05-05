if ! [ -n "$TMUX" ]; then
  opts=(b d g p s t w y)
  opt=${opts[$[RANDOM % 7]]}
  echo $'\n'
  cowsay -$opt `fortune`
  echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fi

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bureau"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
export PATH="$PATH:/bin:/usr/sbin:$HOME/.local/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.pyenv/versions/2.7.6/bin/"
export PATH="$PYENV_ROOT/bin:$PATH"

export EDITOR='vim'
export PYENV_ROOT="$HOME/.pyenv"

eval "$(rbenv init -)"
eval "$(pyenv init -)"

alias rweb="ruby -run -e httpd . -p 5000"
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias wtfpl="curl -o LICENSE 'http://www.wtfpl.net/txt/copying/'"
alias mm="middleman"

function zshtheme {
  sed -i "s/\(ZSH_THEME=\"\).*\(\"\)/\1$1\2/g" ~/.zshrc
  source ~/.zshrc
}

function rbenv_prompt_info() {
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "‹$ruby_version" | sed 's/[ \t].*$/›/'
}
