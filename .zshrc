export PATH="/usr/local/sbin:$PATH"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable colors and change prompt:
export LSCOLORS='Gxfxcxdxbxegedabagacad'
#PROMPT='%n@%m %1~ %#'
#PROMPT='%(?.%10F√.%9F?%?)%f %B%11F%1~%f%b %(!.#.🦠) '
PROMPT='%(?.%10F√.%9F?%?)%f %B%11F%1~%f%b %(!.#.🧨) '
#PROMPT='%10F%m%f:%B%11F%1~%f%b %(!.#.🕯) '

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && [ "$color_prompt" = yes ]; then
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi


if which brew &>/dev/null
then
  [ -w "$HOMEBREW_PREFIX/bin/brew" ] && \
    [ ! -f "$HOMEBREW_PREFIX/share/zsh/site-functions/_brew" ] && \
    mkdir -p "$HOMEBREW_PREFIX/share/zsh/site-functions" &>/dev/null && \
    ln -s "$HOMEBREW_PREFIX/Library/Contributions/brew_zsh_completion.zsh" \
          "$HOMEBREW_PREFIX/share/zsh/site-functions/_brew"
  FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

# Git Intergration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Auto/tab complete:
autoload -Uz compinit && compinit
compinit -d ~/.cache/zcompdump
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
HISTFILE=~/.zsh_history

# report the status of background jobs immediately
setopt NOTIFY
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
# ignore commands that start with space
setopt HIST_IGNORE_SPACE
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# show substitute command
setopt  HIST_VERIFY

#====================================================
# ALIASES
#====================================================
# force zsh to show the complete history
alias history="history 0"
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
# Change exit command
alias bye='exit'
# Get week number
alias week='date +%V'
# Flush the dns cache
alias flush='sudo arp -ad; dscacheutil -flushcache'
# Reload the shell (i.e. invoke as a login shell)
alias reload='exec ${SHELL} -l'
# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
# Change exit command
alias bye='exit'

# Homebrew Shortcuts
alias bl='brew list'
alias bi='brew install'
alias bs='brew search'
alias bu='brew upgrade'
alias bup='brew update'
alias bc='brew cleanup'
alias bui='brew uninstall'