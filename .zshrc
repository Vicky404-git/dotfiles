# === OH-MY-ZSH SETUP ===
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnosterzak"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# === PATH & ENVIRONMENT ===
. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"

# === ALIASES (lsd is much better!) ===
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# === STARTUP VISUALS ===
# If you want a random Pokemon, uncomment the next line:
#pokemon-colorscripts --no-title -s -r

# This is your single, clean ASCII fastfetch call:
fastfetch -c $HOME/.config/fastfetch/config.jsonc
