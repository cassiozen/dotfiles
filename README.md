
# Cassio Zen’s dotfiles

A lightweight, dependency-free setup for Mac OS.

![Image](https://github.com/user-attachments/assets/bdfd22f2-1ceb-4de8-ad08-6183c72d4501)

## Features

### ZSH

- Minimal Prompt with GIT info: Shows current branch, staged (+) and unstaged (*) changes
- Enhanced Completion: Tab completion with menu selection
- Arrow Key History Search: Type a command prefix and use ↑/↓ to search history
- Directory Navigation: Convenient aliases for listing directories (`l`, `la`) & Shortcuts like `...` for faster directory traversal

### Git

- Aliases for common commands (`ci`, `co`, `st`)
- Better Logging: `git lol` and `git graph`
- Branch Management:
  - `git publish`: Push and set upstream tracking in one command
  - `git unpublish`: Remove remote branch easily
  - `git cleanup`: Safely delete merged branches
- Quality of Life Improvements:
  - Automatic stashing during rebases
  - Default branch set to main
  - Global gitignore configuration


## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review & update the config files. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`). The bootstrapper script will pull in the latest version and copy the files to your home folder.

```zsh
git clone git@github.com:cassiozen/dotfiles.git ~/.dotfiles
```
```zsh
cd ~/.dotfiles && source bootstrap.sh
```

To update, `cd` into `.dotfiles` then:

```zsh
source bootstrap.sh
```

### Local overrides

You can add custom settings on `~/.gitconfig.local` and `~/.zshrc.local`
