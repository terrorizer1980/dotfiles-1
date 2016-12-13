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

- [Atom](https://atom.io/)
- [Homebrew](http://brew.sh/)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [Pry](http://pryrepl.org/)
- [Rubocop](http://batsov.com/rubocop/)
- [The Silver Searcher](http://geoff.greer.fm/ag/)
- [Zsh](http://www.zsh.org/)
- [tmux](https://tmux.github.io/)

To configure the installation, copy `.install.defaults` to `.install` and modify the file such that applications
you’d like configured have a `+` in front and applications you aren’t interested in have a `-`.

## Installation demo

<a href="https://asciinema.org/a/au4cjsltj2qgdijp8iy79buul">
    <img src="https://asciinema.org/a/au4cjsltj2qgdijp8iy79buul.png" width="100%" alt="Dotfiles installation screenshot">
</a>

## License

This project is licensed under the [MIT License (MIT)](https://opensource.org/licenses/MIT).
