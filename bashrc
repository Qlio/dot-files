# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias lg='lazygit'
alias k='kubectl'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export WINIT_X11_SCALE_FACTOR=1
export XDG_CONFIG_HOME="$HOME/.config"
export WALLPAPRES_DIR="$HOME/.wallpapers"
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=1000
export HISTSIZE=1000
export PYTHONDONTWRITEBYTECODE=1

alias ll='ls -laF'

complete -cf sudo
complete -cf man

stty -ixon

source /usr/bin/virtualenvwrapper_lazy.sh
export WORKON_HOME=~/.venvs
mkdir -p $WORKON_HOME

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# git
source /usr/share/git/completion/git-completion.bash

alias gp='git push'
__git_complete gp _git_push

alias gpu='git pull --rebase'
__git_complete gpu _git_pull

alias gb='git branch'
__git_complete gb _git_branch

alias gc='git checkout'
__git_complete gc _git_checkout

alias diff='colordiff'

alias gd='git diff --color'
__git_complete gd _git_diff

alias gdi='git diff --color --word-diff'
__git_complete gdi _git_diff

alias gdc='git diff --cached'
__git_complete gdc _git_diff

alias gm='git commit -m'
__git_complete gm _git_commit

alias gma='git commit -am'
__git_complete gma _git_commit

alias gr='git reset'
__git_complete gr _git_reset

alias gs='git status'
alias gss='git status -s'
alias gsi='git status --ignored'
alias gsii='git ls-files --others'
alias gl="git log -n 10 --pretty=format:\"%Cgreen%h %Creset%s %C(blue)by %an (%ar) %Cred %d\" --graph"
alias gll="git log --stat --max-count=3"

# Java
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default

PATH=$PATH:/opt/android-sdk/tools
PATH=$PATH:/home/qlio/.composer/vendor/bin
PATH=$PATH:/opt/android-studio/jre/bin
PATH=$PATH:/opt/android-studio/gradle/gradle-4.1/bin/

export ANDROID_HOME=/opt/android-sdk
PATH=$PATH:$ANDROID_HOME

# Bash prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
virtualenv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
WHITE='\[\033[00m\]';
GREEN='\[\033[32m\]';
BROWN='\[\033[33m\]';
VENV="\$(virtualenv_info)";
PS1="${VENV}[\u@\h]${GREEN}[\w]${BROWN}\$(parse_git_branch)${WHITE}\n$ "

# ruby
# export GEM_HOME=$HOME/.gem
# export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

export LANG=en_US.UTF-8

export PANEL_FIFO='/tmp/panel-fifo'
export VISUAL='vim'

export CHROME_BIN=chromium

# Utils
source $HOME/.config/utils/init

# keyboard rate
xset r rate 200 30

# source <(kubectl completion bash)
# xinput set-prop "Compx 2.4G Receiver Mouse" "libinput Accel Speed" -0.8
# xrandr --auto --output eDP1 --right-of HDMI1
# bspc wm -O eDP-1 HDMI-1

eval $(thefuck --alias)
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$PATH:/opt/flutter/bin"
