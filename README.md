```
 ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||. |||d |||o |||t |||f |||i |||l |||e |||s ||
||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
```

Usage
-----
Just symlink these bad boys into your home directory:

```bash
$ ln -s .vimrc ~
```

If your Vim doesn’t support Python, you dislike cool, angular symbols, or you want super lightweight status bars, use the `*.airline` alternatives:

```bash
$ ln -s .vimrc.airline ~/.vimrc
```

Pre-flight
---------
No matter *what* you do, don’t forget to install all the required Vim plugins before you get started.

If you aren’t using [NeoBundle](https://github.com/Shougo/neobundle.vim) already:

```bash
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

Install those plugins:

```bash
$ vim +NeoBundleInstall +qall
```

Requirements
------------
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
- [Prezto](https://github.com/sorin-ionescu/prezto)
- [pyenv](https://github.com/yyuu/pyenv)
- [rbenv](https://github.com/sstephenson/rbenv)

Thanks
------
ASCII art font is [smkeyboard.flf by Kent Nassen](http://www.forkable.eu/utils/fonts/figlet/smkeyboard.flf)

---

Do What The Fuck You Want To Public License (WTFPL). Copyright (c) 2014 Nicholas Scheurich.
