# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export WINIT_X11_SCALE_FACTOR=1
export XDG_CONFIG_HOME="${HOME}/.config"
export WALLPAPRES_DIR="${HOME}/.wallpapers"
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=3000
export HISTSIZE=3000
export PYTHONDONTWRITEBYTECODE=1
export LANG=en_US.UTF-8
export PANEL_FIFO="/tmp/panel-fifo"
export VISUAL=vim                     # setting vim as default editor
export EDITOR="${VISUAL}"             # setting vim as default editor

export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=/opt/android-sdk

export http_proxy=""
export https_proxy=""
export ftp_proxy=""
export socks_proxy=""

PATH=$PATH:/opt/android-sdk/tools
PATH=$PATH:/home/qlio/.composer/vendor/bin
PATH=$PATH:/opt/android-studio/jre/bin
PATH=$PATH:/opt/android-studio/gradle/gradle-4.1/bin/
PATH=$PATH:$ANDROID_HOME

complete -cf sudo
complete -cf man

xset r rate 200 30                    # keyboard rate

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

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

source $HOME/.config/utils/init
source "${XDG_CONFIG_HOME}/_aliasrc"
source "${XDG_CONFIG_HOME}/_git_complete"

# Python VirtualEnvWrapper
source /usr/bin/virtualenvwrapper_lazy.sh
export WORKON_HOME=~/.venvs
mkdir -p $WORKON_HOME
