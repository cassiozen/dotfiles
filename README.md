
# Cassio Zen’s dotfiles

## A lightweight, dependency-free setup.

These are config files to set up Mac OS X command line the way I like it using.

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review & update the config files. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

Run the `bin/install` command to copy files over. It will prompt you before replacing if the files already exist.

```sh
git clone git@github.com/cassiozen/dotfiles ~/.dotfiles
cd ~/.dotfiles
./bin/install
```

### Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```sh
unlink ~/.gitignore
unlink ~/.gitconfig
rm ~/.zshrc # careful here
rm -rf ~/.dotfiles
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
