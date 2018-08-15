New Laptop Setup Protocol
=========================

Base configuration
------------------

### Set the hostname

```sh
$ sudo scutil --set HostName bienjensu
$ sudo scutil --set LocalHostName bienjensu
$ sudo scutil --set ComputerName bienjensu
$ dscacheutil -flushcache
```

### Set the shell

```sh
$ touch $HOME/.zshrc
$ chsh -s /bin/zsh
```

### Generate an SSH keypair

```sh
$ ssh-keygen
```

### Final steps

1. [Add your SSH public key to GitHub](https://github.com/settings/keys)
2. Restart the computer

System dependencies
-------------------

### Install Homebrew

```sh
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update
```

### Install Mac App Store CLI

```sh
$ brew install mas
$ mas signin user@example.com
```

### Clone dotfiles

Clone the dotfiles:

```sh
$ git clone git@github.com:ngscheurich/dotfiles.git $HOME/dotfiles
```

### Run the setup script

```sh
$ bash $HOME/dotfiles/scripts/setup.sh
```

Configure applications
----------------------

### Install (neo)vim plugins

```sh
$ $HOME/dotfiles/scripts/vim.sh
```

### Install VS Code extensions

```sh
$ $HOME/dotfiles/scripts/vscode.sh
```

Customize environment
---------------------

### Configure keyboard

The following preferences should be set up in Karabiner Elements.

#### For all devices

* Map caps_lock to left_control for all devices

#### For non-Apple keyboards

* Map left_command to left_option
* Map left_option to left_command
* Map right_command to right_option
* Map right_option to right_command

#### Complex modifications

* [Vi Style Arrows](https://pqrs.org/osx/karabiner/complex_modifications/#vi_style_arrows)

### Apply macOS customizations

```sh
$ $HOME/dotfiles/scripts/macos.sh
```