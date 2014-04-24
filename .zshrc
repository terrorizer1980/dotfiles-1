if ! [ -n "$TMUX" ]; then
  opts=(b d g p s t w y)
  opt=${opts[$[RANDOM % 7]]}
  echo $'\n'
  cowsay -$opt `fortune`
  echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fi

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bprd"
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
export PATH=$PATH:~/.local/bin
export PATH=$PATH:$HOME/.pyenv/versions/2.7.6/bin/
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

export POWERLINE_HOME="$HOME/.local/lib/python3.3/site-packages/powerline"
# export MANPATH="/usr/local/man:$MANPATH"
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
