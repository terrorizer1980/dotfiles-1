#!/bin/bash

c1="\33[1;34m"
c2="\33[1;33m"
c3="\33[0;32m"
c4="\33[0;31m"
c5="\33[0;90m"
nc="\33[0m"

setup ()
{
    file="$HOME/dotfiles/.install"

    if [[ ! -f "$file" ]]; then
        printf "\n${c3}Using default options.${nc}\n"
        file="$HOME/dotfiles/.install.defaults"
    else
        printf "\n${c3}Configuration file detected.${nc}\n"
    fi

    while read -r line; do
        pre_install "$line"
    done < $file

    printf "\n${c3}Happy hacking!${nc}\n"
}

pre_install ()
{
    line=$1
    opt=${line:0:1}
    name=${line:2}

    if [[ "$opt" == "+" ]]; then
        install "$name"
    fi
}

install ()
{
    name=$1

    echo -e "\nInstalling $name config..."

    case "$name" in
        "Atom")
            symlink "editors/.atom" ".atom";;
        "Prezto")
            symlink "shell/.zpreztorc" ".zpreztorc"
            symlink "shell/prompt_ngscheurich_setup"\
                    ".zprezto/modules/prompt/functions/prompt_ngscheurich_setup";;
        "Pry")
            symlink "tools/.pryrc" ".pryrc";;
        "Rubocop")
            symlink "tools/.rubocop" ".rubocop";;
        "Slate")
            symlink "tools/slate/.slate.js" ".slate.js";;
        "Spacemacs")
            symlink "editors/.spacemacs" ".spacemacs";;
        "Sublime Text")
            symlink "editor/Preferences.sublime-settings"\
                    "Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings";;
        "Vim")
            symlink "editors/.vimrc" ".vimrc";;
        "Zsh")
            symlink "shell/.zshrc" ".zshrc"
            symlink "shell/.zshenv" ".zshenv";;
        "tmux")
            symlink "tools/.tmux.conf" ".tmux.conf";;
        *)
            echo "$name is not a recognized application"
    esac
}

symlink ()
{
  orig="$HOME/dotfiles/$1"
  dest="$HOME/$2"

  ln -fs $orig $dest

  printf "${c5}>${nc} Linked ${c1}$orig${nc} to ${c2}$dest${nc}\n"
}

# And awaaaaaaay we go!
setup