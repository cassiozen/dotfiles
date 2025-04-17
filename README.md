
# Cassio Zen’s dotfiles

## A lightweight, dependency-free setup.

These are config files to set up Mac OS X command line the way I like it using.

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review & update the config files. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`). The bootstrapper script will pull in the latest version and copy the files to your home folder.

```zsh
git clone git@github.com/cassiozen/dotfiles ~/.dotfiles
cd ~/.dotfiles && source bootstrap.sh
```

Don't forget to configure your own Git user name and emal:

```zsh
git config --global user.name "You"
git config --global user.email "you@xample.com"
```

To update, `cd` into `.dotfiles` then:

```zsh
source bootstrap.sh
```

## Features

### ZSH

- Zero Dependencies: Works with a standard Zsh installation, no external frameworks or plugins required.
- Minimal Prompt: Simple, informative prompt that doesn't clutter your terminal. Includes GIT info: Shows current branch, staged (+) and unstaged (*) changes
- Enhanced Completion: Tab completion with menu selection
- Arrow Key History Search: Type a command prefix and use ↑/↓ to search history
- Directory Navigation: Convenient aliases for listing directories (l, la) & Shortcuts like ... for faster directory traversal

### Git

- Aliases for common commands (ci, co, st)
- Better Logging: `git lol` and `git graph`
- Branch Management:
  - `git publish`: Push and set upstream tracking in one command
  - `git unpublish`: Remove remote branch easily
  - `git cleanup`: Safely delete merged branches
- Quality of Life Improvements:
  - Automatic stashing during rebases
  - Default branch set to main
  - Global gitignore configuration
