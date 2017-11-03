export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin/core_perl:$PATH"
export PATH="/usr/local/Cellar/node/7.1.0/bin:$PATH"
export PATH="/usr/local/share/dotnet:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/Cellar/mysql/5.7.13/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/Applications/PICO-8/PICO-8.app/Contents/MacOS:$PATH"
export PATH="$PATH:~/.asdf/installs/python/3.6.1/lib/python3.6/site-packages"
export PATH="$PATH:/Users/nscheurich/.asdf/installs/elixir/1.4.4/.mix/escripts"
export PATH="$PATH:$HOME/pear/bin"
export PATH="$PATH:/Applications/love.app/Contents/MacOS"
# export PATH="$PATH:/Users/nscheurich/.mix/escripts"

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
export EDITOR="nvim"

# Get rid of lag when entering vi mode
export KEYTIMEOUT=1

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export FZF_DEFAULT_COMMAND='ag -g ""'
