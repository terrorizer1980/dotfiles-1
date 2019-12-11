source ~/.asdf/asdf.fish

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set SPACEFISH_TIME_SHOW true
set SPACEFISH_VI_MODE_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_BATTERY_THRESHOLD 6
set SPACEFISH_EXIT_CODE_SYMBOL ✖
# set SPACEFISH_NODE_SHOW false
set SPACEFISH_CHAR_SYMBOL "->"

thefuck --alias | source
source $HOME/.cargo/env
source ~/.asdf/asdf.fish
direnv hook fish | source

eval (starship init fish)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

