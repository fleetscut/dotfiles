Dotfiles
========

Repo for storing dotfiles

Usage
-----

Pull the repo to the machine to set up
```bash
$ git clone git@github.com:fleetscut/dotfiles $HOME/.dotfiles
```

Install GNUStow
```bash
$ sudo apt install stow
```

Setup worktrees for the branches that are needed. EX:
```
$ git worktree ~/.dotfiles/omarchy omarcy
$ git worktree ~/.dotfiles/terminal terminal
```

Copy the .stowrc from the main branch to ~

Change to the branch containing the needed configs and run stow to create the symlinks
```bash
$ cd $HOME/.dotfiles/<branch>
$ stow <DIR>
```
