#!/usr/bin/env zsh

git pull origin main;

# Prompt once for the user’s identity
function gitIdentity() {
  if [[ ! -f ~/.gitconfig.local ]]; then
    echo ""
    echo "Let's set your Git identity (saved to ~/.gitconfig.local)"
    read "gname?Name: "
    read "gemail?Email: "

    cat > ~/.gitconfig.local <<EOF
[user]
    name = ${gname}
    email = ${gemail}
EOF
    echo "✓ Saved to ~/.gitconfig.local."
  fi
}

function doIt() {
    rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms . ~
    gitIdentity
    source ~/.zshrc
}

read "reply?This may overwrite existing files in your home directory. Are you sure? (y/n) "
echo ""
if [[ $reply =~ ^[Yy]$ ]]; then
    doIt
fi

unset -f doIt