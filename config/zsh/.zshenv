# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"


# ---------- GPG ----------
# export GPG_TTY=$(tty)


# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

# nvm node.js
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# mimocode
export PATH=/home/medwf/.mimocode/bin:$PATH

# opencode
export PATH=/home/medwf/.opencode/bin:$PATH


# ---------- powerlevel10k ----------
# how ti install it
# 1. clone powerlevel10k: `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZDOTDIR/powerlevel10k`
# 2. source echo 'source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.config/zsh/.zshenv

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
