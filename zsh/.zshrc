# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"

zstyle ':omz:update' mode auto  # :auto; disabled; reminder
zstyle ':omz:update' frequency 15

# History
HISTSIZE=50000                # How many lines of history to keep in memory
HISTFILE=~/.zsh_history       # Where to save history to disk
SAVEHIST=50000                # Number of history entries to save to disk
setopt HIST_IGNORE_SPACE

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    docker
    docker-compose
    git
    gpg-agent
    iterm2
    kubectl
    mvn
    nvm
    sdk
)

zstyle ':omz:plugins:iterm2' shell-integration yes

# Actually load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load custom configs
typeset -a sources
ZSH_CONFIG_DIR="$HOME/.zsh.d"

sources+="$ZSH_CONFIG_DIR/alias.zsh"
sources+="$ZSH_CONFIG_DIR/exports.zsh"
sources+="$ZSH_CONFIG_DIR/functions.zsh"
sources+="$ZSH_CONFIG_DIR/private.zsh"

for file in $sources[@]; do
    if [[ -a $file ]]; then
       source $file
    fi
done

# override with local settings
source ~/.zshrc.local

# Anything below here was probably added automatically and should be re-adjusted or moved to ~/.zshrc.local
