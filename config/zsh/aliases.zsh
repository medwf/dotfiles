
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
# package manager `dnf : fedora`
# =========================================================
alias i='sudo dnf install '
alias u='sudo dnf upgrade '
alias s='sudo dnf search '
alias r='sudo dnf remove '
alias l='sudo dnf list '


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
