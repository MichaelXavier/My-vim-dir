# Usage

*NOTE* This repo is no longer maintained because the author converted
to the church of emacs circa the year 2014. Please
see [this repo](https://github.com/michaelxavier/emacs.d) for an
updated configuration for a better editor.

In your home directory (Linux or Mac), run:

```
mv ~/.vim ~/vim_old # backup your old .vim folder
git clone git://github.com/michaelxavier/My-vim-dir.git ~/.vim

mv ~/.vimrc ~/vimrc_old
ln -s ~/.vim/vimrc ~/.vimrc

git submodule update --init --recursive
```
