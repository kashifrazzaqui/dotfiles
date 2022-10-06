# My Vim configuration

## Installation
You can install this configuration wither using `curl` or `wget` or by manually cloning it down and
executing the installation script.

Fastest way to install is to use `curl`

```
curl -fsSL https://raw.githubusercontent.com/Gufran/vimconfig/master/install.sh | sh
```

or `wget`

```
wget https://raw.githubusercontent.com/Gufran/vimconfig/master/install.sh -O - | sh
```

If you dont want to pipe the script to sh directly, you can clone the repository in your home
directory and rename to `.vim`. Run `install.sh` to setup everything.

    git clone https://github.com/Gufran/vimconfig ~/.vim
    ~/.vim/install.sh

All of the configuration and plugin definitions are in `configuration` directory.
You can create a directory `private` for all kind of private configuration, `private` directory is
same as configuration directory except it is excluded from git repository, make sure your custom
config files have an extension `.vim` or they will not be sourced.

### What does the installation script do?
If you choose to go the curl or wget way, the script will move you old configuration to .vim_old
and download the new configuration. This step is skipped if you execute the script from a terminal.

It will then proceed to install the plugin manager, required plugins and move your existing
.vimrc file to .vimrc_old. Your New .vimrc file will be a symlink to .vim/vimrc file available
in this configuration.

## Plugins

[vim-plug][] is chosen as default plugin manager. A list of plugins available and configured in this
configuration is as follows:

 1. [You Complete Me][] For omni completion
 1. [Auto Pairs][] To insert a closing pair
 1. [Gundo][] To visualise vim undo tree
 1. [Supertab][] To reconcile conflicting tab key mappings
 1. [Unite][] For a lot of stuff, more details Unite section
 1. [Bbye][] To close last buffer without quitting vim
 1. [Commentary][] To comment and uncomment lines
 1. [Fugitive][] To operate on git repository
 1. [Git Gutter][] To show diff symbols in symbol column
 1. [Vim Go][] Golang developement environment with a lot of cool stuff
 1. [Unimpaired][] Pairs of bracket mappings
 1. [Vimproc][] For interactive command execution
 1. [Vimfiler][] A file explorer

Auxiliary plugins to add more functionality to plugins listed above:

 1. [NeoYank][] To manage yank history in Unite
 1. [Unite Outline][] To show and navigate to headings in vim buffer
 1. [Unite Tag][] Tag source for Unite
 1. [Vim Misc][] Miscellaneous autoload scripts

Included colorschemes are:

 1. [Flat Color][]
 1. [Apprentice][]

[vim-plug]: https://github.com/junegunn/vim-plug
[You Complete Me]: https://github.com/Valloric/YouCompleteMe
[Auto Pairs]: https://github.com/jiangmiao/auto-pairs
[Gundo]: https://github.com/sjl/gundo.vim
[Supertab]: https://github.com/ervandew/supertab
[Unite]: https://github.com/Shougo/unite.vim
[Bbye]: https://github.com/moll/vim-bbye
[Commentary]: https://github.com/tpope/vim-commentary
[Fugitive]: https://github.com/tpope/vim-fugitive
[Git Gutter]: https://github.com/airblade/vim-gitgutter
[Vim Go]: https://github.com/fatih/vim-go
[Vim Misc]: https://github.com/xolox/vim-misc
[Unimpaired]: https://github.com/tpope/vim-unimpaired
[Vimproc]: https://github.com/Shougo/vimproc.vim
[Vimfiler]: https://github.com/Shougo/vimfiler.vim
[NeoYank]: https://github.com/Shougo/neoyank.vim
[Unite Outline]: https://github.com/h1mesuke/unite-outline
[Unite Tag]: https://github.com/tsukkee/unite-tag
[Flat Color]: https://github.com/MaxSt/FlatColor
[Apprentice]: https://github.com/romainl/Apprentice

## Keybindings
A number of keybindings are available within this configuration

 - `,` is the default leader key
 - `F1` key is mapped to `NOP` in all three modes. This is to protect `ESC` from fatfinger.
 - `CTRL+h` will set focus to left split
 - `CTRL+l` will set focus to right split
 - `CTRL+j` will set focus to lower split
 - `CTRL+k` will set focus to upper split
 - `<Leader> k` will toggle file explorer
 - `F5` will toggle Gundo history viewer
 - `CTRL+p` will open a quick file navigtor, much like the `CTRL+p` popup in sublime text
 - `CTRL-n` will open the outline
 - `CTRL-m` will open a git command menu
 - `<leader> y` will show the yank history and can paste selected entry on presing enter key
 - `space` key will toggle folds
 - `<leader> c` clears search highlightings
 - `<leader> d` deletes current buffer

### Inside file explorer

 - `a` will create a new file
 - `Space` will mark the file for batch operations
 - `d` will delete selected file
 - `m` will rename or move selected file
 - `c` will copy selected file and further paste it in a directory
 - `o` will expand a directory tree or open the file in existing buffer
 - `s` will open selected file in a vertical split
 - `i` will open selected file in a horizontal split
 - `r` will refresh the file explorer
 - `gg` will navigate to the top directory
 - `I` will toggle hidden files
 - `CTRL+g` will print full filename in echo area
 - `CTRL-p` will start a find buffer with selected directory as root
 - `?` will show full help for VimFiler

### FileType specific bindings
#### Golang

  - `K` will open Go Doc for highlighted keyword in vertical split
  - `<leader> K` will open symbol definition for highlighted keyword in vertical split
  - `CTRL-g` will navigate to the symbol definition
