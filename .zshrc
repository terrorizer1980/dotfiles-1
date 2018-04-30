# Prezto!
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/share/dotnet:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands"
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin/core_perl"
export PATH="$PATH:/usr/local/Cellar/node/7.1.0/bin"
export PATH="$PATH:/usr/local/share/dotnet"
export PATH="$HOME:/.composer/vendor/bin"
export PATH="$PATH:/usr/local/Cellar/mysql/5.7.13/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/Applications/PICO-8/PICO-8.app/Contents/MacOS"
export PATH="$PATH:~/.asdf/installs/python/3.6.1/lib/python3.6/site-packages"
export PATH="$PATH:/Users/nscheurich/.asdf/installs/elixir/1.4.4/.mix/escripts"
export PATH="$PATH:$HOME/pear/bin"
export PATH="$PATH:/Applications/love.app/Contents/MacOS"
eval `/usr/libexec/path_helper -s`

# Less Colors for Man Pages
# http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;246m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Editor
export EDITOR="vim"

# Get rid of lag when entering vi mode
export KEYTIMEOUT=1

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export FZF_DEFAULT_COMMAND='/usr/local/bin/ag -g ""'

export ERL_AFLAGS="-kernel shell_history enabled"

# Aliases
alias aseprite="/Applications/Aseprite.app/Contents/MacOS/aseprite"
alias cask="brew cask"
alias curlh="curl -s -D - -o /dev/null"
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
alias emacsclient="/usr/local/Cellar/emacs-mac/HEAD-7403929/bin/emacsclient"
alias exunit="mix test"
alias git=hub
alias hk=heroku
alias hkstaging='heroku --remote staging'
alias mm='bundle exec middleman'
alias sctl="sudo systemctl "
alias vboxls="VBoxManage list runningvms"
alias vim="nvim"
alias virtualenv="python /Users/nscheurich/.asdf/installs/python/3.6.1/lib/python3.6/site-packages/virtualenv.py"
alias weather="curl wttr.in/Baton+Rouge"
alias pyhttp="python -m http.server"
alias zshconfig="$EDITOR ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias vimconfig="$EDITOR $HOME/.config/nvim/init.vim"
alias virtualenv="~/.asdf/installs/python/3.6.4/lib/python3.6/site-packages/virtualenv.py"
alias php="/usr/local/bin/php"

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
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

if [ -f $HOME/.zshrc.local ]; then
  source $HOME/.zshrc.local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/.bin/tmuxinator.zsh
eval "$(direnv hook zsh)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/nscheurich/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/nscheurich/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/nscheurich/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/nscheurich/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# OPAM configuration
. /Users/nscheurich/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

now-playing() {
  s=`spotify-cli now-playing`
  a=("${(f)s}")

  x=$(echo ${a[1]} | grep -Eo '"(.*)"' | sed 's/"//g')
  y=$(echo ${a[2]} | grep -Eo '"(.*)"' | sed 's/"//g')

  echo "$x - $y"
}
###-begin-graphql-completions-###
#
# yargs command completion script
#
# Installation: ../../.asdf/installs/nodejs/6.12.3/.npm/bin/graphql completion >> ~/.bashrc
#    or ../../.asdf/installs/nodejs/6.12.3/.npm/bin/graphql completion >> ~/.bash_profile on OSX.
#
_yargs_completions()
{
    local cur_word args type_list

    cur_word="${COMP_WORDS[COMP_CWORD]}"
    args=("${COMP_WORDS[@]}")

    # ask yargs to generate completions.
    type_list=$(../../.asdf/installs/nodejs/6.12.3/.npm/bin/graphql --get-yargs-completions "${args[@]}")

    COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

    # if no match was found, fall back to filename completion
    if [ ${#COMPREPLY[@]} -eq 0 ]; then
      COMPREPLY=( $(compgen -f -- "${cur_word}" ) )
    fi

    return 0
}
complete -F _yargs_completions graphql
###-end-graphql-completions-###

eval $(thefuck --alias)

. $HOME/.secrets

eval "$(fasd --init auto)"
