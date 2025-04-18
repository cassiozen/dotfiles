autoload -Uz compinit vcs_info

# ------------
#  Completion
# ------------
compinit -C
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
[[ -n ${terminfo[kcbt]} ]] && bindkey "${terminfo[kcbt]}" reverse-menu-complete  # ⇧Tab ←

# ----------
#  History
# ----------
setopt APPEND_HISTORY SHARE_HISTORY HIST_EXPIRE_DUPS_FIRST EXTENDED_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

bindkey '\e[A' history-search-backward   # ↑ search
bindkey '\e[B' history-search-forward    # ↓ search

# ----------------------
#  Git prompt (vcs_info)
# ----------------------
zstyle ':vcs_info:*'   enable git
zstyle ':vcs_info:git*' formats        '[%b%u%c] '
zstyle ':vcs_info:git*' actionformats  '%F{14}⏱ %*%f '
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr   '+'
zstyle ':vcs_info:*:*'  check-for-changes true   # enables %u / %c
precmd() { vcs_info; print }          # refresh git & blank line

# ------------
# Prompt
# ------------
setopt PROMPT_SUBST
PROMPT='%~ %F{green}${vcs_info_msg_0_}%f%(?.%F{35}❯.%F{red}❯)%f '


# -------------
#  Environment
# -------------
export CLICOLOR=1                     # color‑aware coreutils

# ------------
#  Aliases
# ------------
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
# List directory contents
alias l='ls -lAh'
alias la='ls -A'

# Load local configuration file if it exists
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi