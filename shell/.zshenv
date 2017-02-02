export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin/core_perl:$PATH"
export PATH="/usr/local/Cellar/node/7.1.0/bin:$PATH"
export PATH="/usr/local/share/dotnet:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/Cellar/mysql/5.7.13/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

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
export EDITOR="/usr/local/Cellar/emacs-mac/emacs-25.1-z-mac-6.0/bin/emacsclient"

# Get rid of lag when entering vi mode
export KEYTIMEOUT=1
