autoload -Uz compinit vcs_info

# ------------
#  Completion
# ------------
compinit -C
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
[[ -n ${terminfo[kcbt]} ]] && bindkey "${terminfo[kcbt]}" reverse-menu-complete  # ⇧Tab ←

# ----------------------
#  Git prompt (vcs_info)
# ----------------------
zstyle ':vcs_info:*'   enable git
zstyle ':vcs_info:git*' formats        '%F{245}%b%f%F{167}%u%f%F{178}%c%f '
zstyle ':vcs_info:git*' actionformats  '%F{245}⏱ %b|%a%f '
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr   '+'
zstyle ':vcs_info:*:*'  check-for-changes true   # enables %u / %c
precmd() { vcs_info; print }          # refresh git & blank line

# ------------
# Prompt
# ------------
setopt PROMPT_SUBST
local user_prompt_symbol="❯" 
local root_prompt_symbol="#"
PROMPT='%F{blue}%~ ${vcs_info_msg_0_}%(?.%F{083}.%F{197})%(!.${root_prompt_symbol}.${user_prompt_symbol})%f '


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

# ----------
#  History
# ----------
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS EXTENDED_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

# To search history by typing the first few letters of a command than arrow keys,
# all you need is bindkey to history-search-backward and history-search-forward:
# bindkey '\e[A' history-search-backward   # ↑ search
# bindkey '\e[B' history-search-forward    # ↓ search
# 
# Here we're implementing a slighly more sofisticated search that 
# allows for substring matching (requiring a custom ZSH widget):
# (Based on https://github.com/zsh-users/zsh-history-substring-search)
typeset -g HS_NEEDLE="" HS_IDX=0     # search text and last hit’s index

_hs_maybe_refresh_needle() {         # refresh only when the user *edits*
  if [[ $LASTWIDGET != history-substring-search-up &&
        $LASTWIDGET != history-substring-search-down ]]; then
    HS_NEEDLE=$BUFFER
    HS_IDX=$HISTNO                    # start just above current line
  fi
}

_history_cycle() {              # $1 = +1 or -1
  local step=$1 i=$HS_IDX max=$HISTNO \
        pat=${HS_NEEDLE//(#m)[\][()|\\*?#<>~^]/\\$MATCH}  # glob‑escaped needle

  while true; do
    (( i += step ))
    (( i < 1 ))  && i=$max
    (( i > max ))&& i=1
    (( i == HS_IDX )) && return 1         # full loop, nothing else
    [[ ${history[$i]} == *${pat}* ]] && {
      HS_IDX=$i
      BUFFER=${history[$i]}
      CURSOR=$#BUFFER
      zle -R
      return 0
    }
  done
}

history-substring-search-up() {
  _hs_maybe_refresh_needle
  [[ -z $HS_NEEDLE ]] && zle up-line-or-history && return
  _history_cycle -1 || zle beep
}

history-substring-search-down() {
  _hs_maybe_refresh_needle
  [[ -z $HS_NEEDLE ]] && zle down-line-or-history && return
  _history_cycle +1 || zle beep
}

zle -N history-substring-search-up
zle -N history-substring-search-down

bindkey '\e[A' history-substring-search-up   # ↑
bindkey '\e[B' history-substring-search-down # ↓

# -----------------
#  local override
# -----------------

# Load local configuration file if it exists
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi