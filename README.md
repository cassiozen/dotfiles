
# Cassio Zen’s dotfiles

A lightweight, dependency-free setup for development environments that prioritizes simplicity and usability.

![Image](https://github.com/user-attachments/assets/ea748cdd-0a4d-4178-a490-4abf9a79ec2f)

## Features

### ZSH

- Minimal Prompt with GIT info: Shows current branch, staged (+) and unstaged (*) changes
- Tab completion with menu selection
- History Search: Type a the first characters of a given command and use ↑/↓ to search history
- Directory Navigation: Convenient aliases for listing directories (`l`, `la`) & Shortcuts like `...` for faster directory traversal

### Git

- Aliases for common commands: `ci` (commit), `co` (checkout), `st` (clean status view - shows your branch and changes without the clutter)
- Aliases for Listings: Git has inconsistent ways to list things, these aliases provide a consistent 'noun' interface: `git branches`, `git tags`, `git stashes` and `git remotes`.
- Better Logging: `git lol` (compact log view) and `git graph` (see how your branches connect).

Quality of Life Improvements:

- Default branch set to main
- Global gitignore configuration
- Cleaner diffs with to the histogram algorithm
- Branches track their remotes automatically when you push
- Automatic stashing during rebases

### Others

- `.hushlogin`:  Skips the "Last login" message and other system information displayed at terminal startup. Note that this file is intentionally empty — its presence alone activates this functionality.
- `.editorconfig`: 120 columns of text by default (because we're not in the 80s anymore)

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

This makes it easy to keep your core configuration in version control while maintaining machine-specific settings separately.
