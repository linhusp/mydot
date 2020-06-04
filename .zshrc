# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DISABLE_AUTO_TITLE=true

# enable notification eOS
# builtin . /usr/share/io.elementary.terminal/enable-zsh-completion-notifications || builtin true

# Use 256 colors
export TERM="xterm-256color"

# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Hide hostname and pcname in terminal
DEFAULT_USER=$USER

# Enable hyphen-insensitive
# _ and - will be interchangeable
# HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    tmux
    git 
    zsh-autosuggestions 
    vi-mode
    # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Manually set language environment
# export LANG=en_US.UTF-8

# Powerlevel9k ------------------------------------------------------

# left prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    ssh time virtualenv context dir_joined vcs
)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=' '
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''

# dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_DIR_BACKGROUND='clear'
POWERLEVEL9K_DIR_FOREGROUND='223'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='223'

# prompt
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{208}$ "

# time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M/%m.%d}"
POWERLEVEL9K_TIME_BACKGROUND='clear'
POWERLEVEL9K_TIME_FOREGROUND='251'

# vsc
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='clear'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='clear'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='red'

# delimiter
POWERLEVEL9K_SHORTEN_DELIMITER=".."
# virtualenv
POWERLEVEL9K_VIRTUALENV_BACKGROUND='clear'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='208'

# right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# -------------------------------------------------------------------
# Set python virtualenv's path
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source $HOME/.local/bin/virtualenvwrapper.sh

# disable tensorflow debug info
export TF_CPP_MIN_LOG_LEVEL="3"

# Enable ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# Some useful alias
alias py='python3'
alias co='code-insiders'
alias sai='sudo apt install'
alias sau='sudo apt update'
alias saug='sudo apt upgrade'
alias sar='sudo apt remove'
alias vim='nvim'
alias svim='sudo nvim'
alias pip='python3 -m pip'
alias hg='history | grep'
alias vimdiff='nvim -d'

# Set npm path
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Firefox smooth scrolling
export MOZ_USE_XINPUT2="1"

# Editor
export EDITOR=nvim
