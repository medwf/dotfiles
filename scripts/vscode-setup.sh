#!/bin/bash

# Create directories if they don't exist
mkdir -p ~/.config/Code/User/

# Symlink or copy config files
ln -sf ~/Repository/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -sf ~/Repository/dotfiles/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
cp -r ~/Repository/dotfiles/.config/Code/User/snippets ~/.config/Code/User/

# Install extensions
while read -r extension; do
    code --install-extension "$extension"
done < ~/Repository/dotfiles/scripts/vscode-extensions.txt
