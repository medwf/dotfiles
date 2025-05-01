#!/bin/bash

# Create directories if they don't exist
mkdir -p ~/.config/Code/User/

# Symlink or copy config files
ln -sf ~/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -sf ~/dotfiles/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
cp -r ~/dotfiles/.config/Code/User/snippets ~/.config/Code/User/

# Install extensions
while read -r extension; do
    code --install-extension "$extension"
done < ~/dotfiles/scripts/vscode-extensions.txt
