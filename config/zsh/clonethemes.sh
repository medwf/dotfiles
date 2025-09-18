#! /bin/bash
mkdir ~/.config
echo "clone oh my zsh"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/.oh-my-zsh 
echo "done"

# clone p10k
echo "clone p10k"
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/.oh-my-zsh/themes/powerlevel10k
echo "done"


