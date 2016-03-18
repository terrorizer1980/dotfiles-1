# Prezto!
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit

# Key Bindings
# https://github.com/JeanMertz/omz-to-prezto/blob/omz-to-prezto/zsh/key-bindings.zsh
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
bindkey -v                                          # Use vi key bindings

bindkey '\ew' kill-region                           # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                             # [Esc-l] - run command: ls
bindkey -s '\e.' '..\n'                             # [Esc-.] - run command: .. (up directory)
bindkey '^r' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^[[5~' up-line-or-history                  # [PageUp] - Up a line of history
bindkey '^[[6~' down-line-or-history                # [PageDown] - Down a line of history

bindkey '^[[A' up-line-or-search                    # start typing + [Up-Arrow] - fuzzy find history forward
bindkey '^[[B' down-line-or-search                  # start typing + [Down-Arrow] - fuzzy find history backward

bindkey '^[[H' beginning-of-line                    # [Home] - Go to beginning of line
bindkey '^[[1~' beginning-of-line                   # [Home] - Go to beginning of line
bindkey '^[OH' beginning-of-line                    # [Home] - Go to beginning of line
bindkey '^[[F'  end-of-line                         # [End] - Go to end of line
bindkey '^[[4~' end-of-line                         # [End] - Go to end of line
bindkey '^[OF' end-of-line                          # [End] - Go to end of line

bindkey ' ' magic-space                             # [Space] - do history expansion

bindkey '^[[1;5C' forward-word                      # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                     # [Ctrl-LeftArrow] - move backward one word

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char                   # [Delete] - delete backward
bindkey '^[[3~' delete-char                         # [fn-Delete] - delete forward
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char


# rbenv
eval "$(rbenv init -)"

function rbenv_prompt_info() {
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "‹$ruby_version" | sed 's/[ \t].*$/›/'
}

# nvm
source ~/.nvm/nvm.sh

# pyenv
eval "$(pyenv init -)"

# Docker
eval "$(docker-machine env default)"

# Aliases
alias git=hub
alias curlh="curl -s -D - -o /dev/null"
alias rbweb="ruby -run -e httpd . -p 5000"
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc && source ~/.zshenv"
alias sctl="sudo systemctl "
alias fuck='eval $(thefuck $(fc -ln -1))'
alias boilerplate="curl -LO https://raw.githubusercontent.com/ngscheurich/boilerplate/master/README.md; curl -LO https://raw.githubusercontent.com/ngscheurich/boilerplate/master/LICENSE"
alias dc-rails="docker-compose run app bin/rails"
alias dc-rake="docker-compose run app bin/rake"
alias dc-bundle="docker-compose run app bundle"
alias dc-rspec="docker-compose run app bundle exec rspec"
alias rspec="bundle exec rspec"
alias emacs="/usr/local/Cellar/emacs/24.5/bin/emacs"
alias docker-rm-dangling='docker rmi --force $(docker images -q -f dangling=true)'

# Ruby convenience stuff
function rails {
  if [ -x bin/rails ]; then
    bin/rails $@
  elif [[ (-f Gemfile || -f .bundle) ]]; then
    bundle exec rails $@
  else
    $HOME/.rbenv/shims/rails $@
  fi
}

function rake {
  if [ -x bin/rake ]; then
    bin/rake $@
  elif [[ (-f Gemfile || -f .bundle) ]]; then
    bundle exec rake $@
  else
    $HOME/.rbenv/shims/rake $@
  fi
}

# Get local config
source ~/.zshrc.local

# Lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# added by travis gem
[ -f /home/nick/.travis/travis.sh ] && source /home/nick/.travis/travis.sh

# added by travis gem
[ -f /Users/nscheurich/.travis/travis.sh ] && source /Users/nscheurich/.travis/travis.sh
