Dotfiles
========

Repo for storing dotfiles

Usage
-----

Pull the repo to the machine to set up
```bash
$ git clone git@github.com:fleetscut/dotfiles $HOME/dotfiles
```

Install GNUStow
```bash
$ sudo apt install stow
```

Change to the repo and run stow to create the symlinks
```bash
$ cd $HOME/.dotfiles
$ stow <DIR>
```
