typeset -U path cdpath fpath manpath


export DEFAULT_USER="ivan"
export EDITOR="nvim"
export PROMPT="|%F{153}%n@%m%f|%F{174}%1~%f> "
export ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"

# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/rycee/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


# vim mode config
# ---------------

# Activate vim mode.
bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# Fix backspace
bindkey "^?" backward-delete-char

# Aliases
alias ..='cd ..'
alias ls='ls -hlNa --color=auto'
alias v='vim'
alias vi='vim'
alias vim='nvim'
