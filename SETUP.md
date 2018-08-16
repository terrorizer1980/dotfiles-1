💻 Laptop Setup Protocol
========================

* [Base configuration](#base-configuration)
  * [Set the hostname](#set-the-hostname)
  * [Set the shell](#set-the-shell)
  * [Generate an SSH keypair](#generate-an-ssh-keypair)
  * [Final steps](#final-steps)
* [System setup](#system-setup)
  * [Install Homebrew](#install-homebrew)
  * [Install Mac App Store CLI](#install-mac-app-store-cli)
  * [Clone dotfiles](#clone-dotfiles)
  * [Run the setup script](#run-the-setup-script)
* [Customize environment](#customize-environment)
  * [Configure keyboard](#configure-keyboard)
      * [For all devices](#for-all-devices)
      * [For non-Apple keyboards](#for-non-apple-keyboards)
      * [Complex modifications](#complex-modifications)


Base configuration
------------------

### Set the hostname

```sh
$ sudo scutil --set ComputerName "0x6269656e6a656e7375"
$ sudo scutil --set HostName "0x6269656e6a656e7375"
$ sudo scutil --set LocalHostName "0x6269656e6a656e7375"
$ sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6269656e6a656e7375"
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
It would be handy to have your public key on the clipboard at this point.

```sh
$ cat $HOME/.ssh/id_rsa.pub | pbcopy
```

### Final steps

1. [Add your SSH public key to GitHub](https://github.com/settings/keys)
2. Restart the computer

System setup
------------

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

```sh
$ git clone git@github.com:ngscheurich/dotfiles.git $HOME/dotfiles
```

### Run the setup script

```sh
$ cd $HOME/dotfiles
$ rake
```

See `rake --tasks` for a listing of individual setup tasks.

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
