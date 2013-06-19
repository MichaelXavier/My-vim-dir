# Usage

In your home directory (Linux or Mac), run:

```
mv ~/.vim ~/vim_old # backup your old .vim folder
git clone git://github.com/michaelxavier/My-vim-dir.git ~/.vim

mv ~/.vimrc ~/vimrc_old
ln -s ~/.vim/vimrc ~/.vimrc

git submodule update --init --recursive
```
