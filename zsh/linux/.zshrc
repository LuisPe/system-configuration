autoload -Uz compinit && compinit -i

setopt PROMPT_SUBST
autoload colors
colors

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  # Download zimfw script if missing.
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# use extended color palette if available
if (( terminfo[colors] >= 256 )); then
  : ${USER_COLOR=255}
  : ${HOST_COLOR=166}
  : ${PWD_COLOR=255}
  : ${BRANCH_COLOR=110}
  : ${UNINDEXED_COLOR=167}
  : ${INDEXED_COLOR=108}
  : ${UNTRACKED_COLOR=167}
  : ${LOGO_COLOR=255}
else
  : ${USER_COLOR=grey93}
  : ${HOST_COLOR=yellow}
  : ${PWD_COLOR=grey93}
  : ${BRANCH_COLOR=cyan}
  : ${UNINDEXED_COLOR=yellow}
  : ${INDEXED_COLOR=green}
  : ${UNTRACKED_COLOR=red}
  : ${LOGO_COLOR=white}
fi
: ${UNINDEXED_IND=●}
: ${INDEXED_IND=●}
: ${UNTRACKED_IND=●}
VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:action' format '(%F{${INDEXED_COLOR}}%s%f)'
  zstyle ':zim:git-info:unindexed' format '%F{${UNINDEXED_COLOR}}${UNINDEXED_IND}'
  zstyle ':zim:git-info:indexed' format '%F{${INDEXED_COLOR}}${INDEXED_IND}'
  zstyle ':zim:git-info:untracked' format '%F{${UNTRACKED_COLOR}}${UNTRACKED_IND}'
  if [[ -n ${STASHED_IND} ]]; then
    zstyle ':zim:git-info:stashed' format '%F{${STASHED_COLOR}}${STASHED_IND}'
  fi
  zstyle ':zim:git-info:keys' format \
      'prompt' ' (%F{${BRANCH_COLOR}}%b%c%I%i%u%f%S%f)%s'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

function prompt_exit_code() {
    local EXIT="$?"
 
    if [ $EXIT -eq 0 ]; then
      echo -n $USER_COLOR
    else
      echo -n $UNINDEXED_COLOR
    fi
 }

NEWLINE=$'\n'
PS1='%F{$(prompt_exit_code)}%D{%d %b} %T%f %F{${PWD_COLOR}}%~%f${(e)git_info[prompt]}${VIRTUAL_ENV:+" (%F{blue}${VIRTUAL_ENV:t}%f)"}${NEWLINE}%F{$(prompt_exit_code)}%B➔%b%f '

unset RPS1

alias sc="source ~/.zshrc"

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
export PATH=$PATH:/home/luispe/.local/bin/

export GODEBUG=asyncpreemptoff=1
