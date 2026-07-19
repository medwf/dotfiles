
# My alias
# command
alias open='nvim'
alias py='python3'
alias y='yazi'

# =========================================================
# Navigation
# =========================================================
alias cd='z'
alias - -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# zsh follow lf navigation
lf() {
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}


# =========================================================
# package manager `pacman`
# =========================================================
alias pi='sudo pacman -S '
alias pu='sudo pacman -Syu '
alias ps='sudo pacman -Ss '
alias pr='sudo pacman -R '
alias pra='sudo pacman -Rns '
alias pl='sudo pacman -Q '

# =========================================================
# package manager `paru`
# =========================================================
alias i='paru -S '
alias u='paru -Syu '
alias s='paru -Ss '
alias r='paru -R '
alias ra='paru -Rns '
alias l='paru -Q '


# =========================================================
# Better ls
# =========================================================
# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls
alias ls='eza --icons="always" '
alias ll='eza -lh --icons="always"  --git'
alias la='eza -lah --icons="always"  --git'
alias tree='eza --tree --icons="always" '


# =========================================================
# generation password
# =========================================================
alias genpass="tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c 24; echo"


# =========================================================
# Core utilities
# =========================================================
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'


# =========================================================
# Git
# =========================================================
alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
