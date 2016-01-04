# Usage

In your home directory (Linux or Mac), run:

```
mv ~/.vim ~/vim_old # backup your old .vim folder
git clone git://github.com/dplummer/My-vim-dir.git ~/.vim

mv ~/.vimrc ~/vimrc_old
ln -s ~/.vim/vimrc ~/.vimrc

git submodule update --init --recursive
```

## Adding a new Pathogen bundle

```
git submodule add [git url] bundle/[name]
```

## Getting updates from remotes

```
git submodule foreach git pull origin master
```
