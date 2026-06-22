# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    flutter
    vscode
)

source $ZSH/oh-my-zsh.sh


# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos



### From this line is for pywal-colors
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# My alias
# command
alias cd='z'
alias cat='bat'
alias n='nvim'
alias py='python3'
alias c='sudo rsync -avhW --no-compress --progress '
alias code='code --ozone-platform=x11'
alias y='yazi'

# generation password
alias genpass="tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c 24; echo"

# tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias tl='tmux ls'
alias tk='tmux kill-server'

# ls aliases
alias ls='lsd --group-dirs first'
alias ll='ls -Alh'

# git aliases
alias gc='git clone '
alias ga='git add . '
alias gcm='git commit -m '
alias gp='git push -u origin '
alias gs='git status '
alias gl='git log --oneline --graph --decorate --all '
alias gd='git diff'
alias gco='git checkout '
alias gb='git branch '
alias gpl='git pull '

# yay aliases
alias i='yay -S '
alias u='yay -Syu '
alias s='yay -Ss '
alias r='yay -Rns '
alias l='yay -Q '

# pnpm alias
alias pi='pnpm install'
alias pr='pnpm run '
alias pu='pnpm update'
alias pre='pnpm remove'
alias pl='pnpm list'
alias px='pnx'

# return aliases
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# others
# alias ntest='bash /home/medwf/.config/hypr/UserScripts/networkTest.sh'
# alias md1='sudo mount /dev/sda5 /mnt/Mohamed'
# alias md2='sudo mount /dev/sda4 /mnt/windows-drive'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# exports
export LC_ALL=en_US.UTF-8
export PATH="$HOME/.tmuxifier/bin:$PATH"
export LIBVIRT_DEFAULT_URI='qemu:///system'
eval "$(zoxide init zsh)"
eval "$(tmuxifier init -)"
# export PATH=$PATH:/home/ahmad/.spicetify
# [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/medwf/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"

# bun completions
[ -s "/home/medwf/.bun/_bun" ] && source "/home/medwf/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
