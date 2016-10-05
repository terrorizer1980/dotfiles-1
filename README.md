# My system config files

<img src="https://media.giphy.com/media/DBfYJqH5AokgM/giphy.gif" width="100%" alt="I HATE THIS HACKER CRAP">

## Usage

Clone this repo to your home directory:

    $ git clone https://github.com/ngscheurich/dotfiles.git $HOME/dotfiles
    
Run the installation script:

    $ $HOME/dotfiles/bin/install
    
## Configuration

The installation script will install the configs for the default applications if no `.install` file is found.
Currently, those are:

- Prezto
- Pry
- Rubocop
- Spacemacs
- Zsh

To configure the installation, copy `.install.defaults` to `.install` and modify the file such that applications
you’d like configured have a `+` in front and applications you aren’t interested in have a `-`.

## Prerequisites

Some configs expect their respective application to be installed.

- Prezto requires [Prezto](https://github.com/sorin-ionescu/prezto) (or a `~/.prezto directory`)
- Spacemacs requires [Spacemacs](http://spacemacs.org/) (or a `~/.emacs.d directory`)
- Sublime Text requires [Sublime Text 3](https://www.sublimetext.com/3) (only works on macOS)

## License

This project is licensed under the [MIT License (MIT)](https://opensource.org/licenses/MIT)
