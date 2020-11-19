# Enable colors and change prompt:
export LSCOLORS='Gxfxcxdxbxegedabagacad'
PROMPT='%(?.%10F√.%9F?%?)%f %B%11F%1~%f%b %(!.#.🦠) '

# Auto/tab complete:
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
_comp_options+=(globdots)

# Set options:
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL
setopt EXTENDED_HISTORY

# History in home directory and options:
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="dd.mm.yyyy"
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# show substitute command
setopt  HIST_VERIFY
#====================================================
# ALIASES
#====================================================
alias -s txt="open -a Sublime\ Text.app"
alias -s log="open -a Console"

# Always use color output for `ls`
colorflag="-G"
alias ls='command ls ${colorflag}'
# List all files in long format
alias l='ls -Fl'
# List all files in long format, including . and ..
alias la='ls -aFl'
# List all files recursively
alias lll='ls -aFRl'
# List Everything human readable
alias lr='ls -tRFh'

# Get week number
alias week='date +%V'

# Flush the dns cache
alias flush='sudo arp -ad; dscacheutil -flushcache'

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec ${SHELL} -l'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Shortcuts
alias d='cd ~/Documents'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias p='cd ~/Projects'
alias pk='cd ~/Pictures'
