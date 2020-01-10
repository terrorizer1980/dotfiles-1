# Defines environment variables.
#
# Author: Sorin Ionescu <sorin.ionescu@gmail.com>
# URL: https://github.com/ngscheurich/dotfiles

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
