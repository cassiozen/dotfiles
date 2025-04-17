#!/usr/bin/env zsh

git pull origin main;

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms . ~
    source ~/.zshrc
}

read "reply?This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo ""
if [[ $reply =~ ^[Yy]$ ]]; then
    doIt
fi

unset -f doIt