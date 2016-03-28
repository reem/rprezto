RPrezto — My Instantly Awesome Zsh
==============================

RPrezto is my fork of Prezto - the configuration framework for [Zsh][1];
it enriches the command line interface environment with sane defaults,
aliases, functions, auto completion, and prompt themes.

RPrezto also has a convenient interface for creating user-defined modules
and organizing your zsh configuration, as well as many additional sane settings
and aliases for working with the terminal.

It is also my personal configuration, so you should fork it and modify it to
suit your needs if you have different tastes than mine. I do try to make good
choices, so let me know if there's anything you found particularly lacking or
particularly awesome!

Installation
------------

Installation is the same as for Prezto, but I've replaced the relevant URLs:

Prezto will work with any recent release of Zsh, but the minimum required
version is 4.3.17.

By default installs to $HOME, can be set to install elsewhere by setting
$ZDOTDIR.

  1. Launch Zsh:

        zsh

  2. Clone the repository:

        git clone --recursive https://github.com/reem/rprezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  3. Create a new Zsh configuration by linking the Zsh configuration files provided:

        zsh "${ZDOTDIR:-$HOME}"/link.zsh

  4. Set Zsh as your default shell:

        chsh -s `which zsh`

  5. Open a new Zsh terminal window or tab.

Updating
--------

Pull the latest changes and update submodules.

    git pull && git submodule update --init --recursive

Usage
-----

Prezto has many features disabled by default. RPrezto enables many of these
features so that you don't have to, but you may want to enable or disable some
modules.

Here's what Prezto has to say about their modules and themes:

Read the source code and accompanying README files to learn of what is available.

### Prezto Modules

  1. Browse */modules* to see what is available.
  2. Load the modules you need in *~/.zpreztorc* then open a new Zsh terminal
     window or tab.

### Themes

  1. For a list of themes, type `prompt -l`.
  2. To preview a theme, type `prompt -p name`.
  3. Load the theme you like in *~/.zpreztorc* then open a new Zsh terminal
     window or tab.

     ![sorin theme][2]

### User Modules

RPrezto also comes with a super-convenient way to split up and manage your
custom configuration on top of what is provided by Prezto and RPrezto:
`zshmodules`.

Located in `${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshmodules` and easily
accessible via the `modules` alias, `zshmodules` provides an easy way to split
up your configuration so it's not just one huge `.zshrc`.

Any `.zsh` file placed in the `zshmodules` directory is automatically `source`d on
startup in the `.zshrc` provided by RPrezto. Almost all functionality provided
by RPrezto is found in `.zsh` files in the `zshmodules` directory.

You should add your own new aliases and functions in new `.zsh` files in this
directory! Remember, you can quickly get to the `zshmodules` directory using
the `modules` alias.

Customization
-------------

RPrezto is already a fork of Prezto, but you should feel encouraged to fork it
yourself. Just don't forget to pull request anything cool you find :)

The project is managed via [Git][3]. It is highly recommended that you fork this
project; so, that you can commit your changes and push them to [GitHub][4] to
not lose them. If you do not know how to use Git, follow this [tutorial][5] and
bookmark this [reference][6].

Resources
---------

The [Zsh Reference Card][7] and the [zsh-lovers][8] man page are indispensable.

License
-------

(The MIT License)

Copyright (c) 2009-2011 Robby Russell and contributors.
Copyright (c) 2011-2015 Sorin Ionescu and contributors.
Copyright (c) 2014-2016 Jonathan Reem and contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[1]: http://www.zsh.org
[2]: http://i.imgur.com/nrGV6pg.png "sorin theme"
[3]: http://git-scm.com
[4]: https://github.com
[5]: http://gitimmersion.com
[6]: http://gitref.org
[7]: http://www.bash2zsh.com/zsh_refcard/refcard.pdf
[8]: http://grml.org/zsh/zsh-lovers.html
