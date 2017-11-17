# My system config files

<img src="https://media.giphy.com/media/DBfYJqH5AokgM/giphy.gif" width="100%" alt="I HATE THIS HACKER CRAP">

## Usage

Clone this repo to your home directory:

    $ git clone https://github.com/ngscheurich/dotfiles.git $HOME/dotfiles
    
Run the installation script:

    $ $HOME/dotfiles/bin/install

## Configuration

The installation script will install the default configuration files if no
`.install` file is found. Currently this setup is macOS-focused, and the
default configuration files are for:

- [Exuberant Ctags](http://ctags.sourceforge.net/)
- [Homebrew](http://brew.sh/)
- [Neovim](https://vim.sourceforge.io/)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [Pry](http://pryrepl.org/)
- [Rubocop](http://batsov.com/rubocop/)
- [The Silver Searcher](http://geoff.greer.fm/ag/)
- [Zsh](http://www.zsh.org/)
- [tmux](https://tmux.github.io/)

To configure the installation, copy `.install.defaults` to `.install` and
modify the file such that the setups you’d like configured have a `+` in front
and the ones you aren’t interested in have a `-`.

## Installation demo

<a href="https://asciinema.org/a/au4cjsltj2qgdijp8iy79buul">
  <img
    src="https://asciinema.org/a/au4cjsltj2qgdijp8iy79buul.png"
    width="100%"
    alt="Dotfiles installation screenshot"
  >
</a>

## License

This project is licensed under the [MIT License (MIT)](https://opensource.org/licenses/MIT).
