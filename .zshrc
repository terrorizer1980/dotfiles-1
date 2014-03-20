ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bureau"
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
export PATH=~/.rvm/gems/ruby-2.1.0/bin
export PATH=$PATH:~/.gem/ruby/2.1.0/bin
export PATH=$PATH:~/.local/bin

export POWERLINE_HOME="~/.local/lib/python3.3/site-packages/powerline"
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'

alias rweb="ruby -run -e httpd . -p 5000"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

function zshtheme {
  sed -i "s/\(ZSH_THEME=\"\).*\(\"\)/\1$1\2/g" ~/.zshrc
  source ~/.zshrc
}
