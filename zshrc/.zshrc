export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

export PATH="$HOME/.local/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/nvim
export XDG_CONFIG_HOME="$HOME/.config"

plugins=(
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ───────────────────────────────────────────
# Completion & keybindings
# ───────────────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
bindkey '^e' autosuggest-accept
bindkey '^w' autosuggest-execute
bindkey '^u' autosuggest-toggle
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# ───────────────────────────────────────────
# Aliases — Git
# ───────────────────────────────────────────
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gre='git reset'

# ───────────────────────────────────────────
# Aliases — Docker
# ───────────────────────────────────────────
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# ───────────────────────────────────────────
# Aliases — Navigation
# ───────────────────────────────────────────
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cl='clear'
alias cat=bat

# ───────────────────────────────────────────
# Aliases — Eza
# ───────────────────────────────────────────
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2 --icons --git"

# ───────────────────────────────────────────
# Functions
# ───────────────────────────────────────────
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# ───────────────────────────────────────────
# FZF
# ───────────────────────────────────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ───────────────────────────────────────────
# Tools
# ───────────────────────────────────────────
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ───────────────────────────────────────────
# Starship
# ───────────────────────────────────────────
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export DOCKER_DEFAULT_PLATFORM=linux/amd64
