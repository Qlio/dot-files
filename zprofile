eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias vim=nvim
alias gp='git push'
alias gpu='git pull --rebase'
alias gb='git branch'
alias gc='git checkout'

alias diff='colordiff'

alias gd='git diff --color'
alias gdn='git diff --name-only'
alias gdi='git diff --color --word-diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gr='git reset'
alias gs='git status'
alias gss='git status -s'
alias gsi='git status --ignored'
alias gsii='git ls-files --others'
alias gl="git log -n 20 --pretty=format:\"%Cgreen%h %Creset%s %C(blue)by %an (%ar [%ad]) %Cred %d\" --graph --date=format-local:'%Y-%m-%d %H:%M:%S'"
alias gll="git log --stat --max-count=3"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
WHITE='\[\033[00m\]';
GREEN='\[\033[32m\]';
BROWN='\[\033[33m\]';
VENV="\$(virtualenv_info)";
PS1="${VENV}[\u@\h]${GREEN}[\w]${BROWN}\$(parse_git_branch)${WHITE}\n$ "

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

##
# Your previous /Users/bg/.zprofile file was backed up as /Users/bg/.zprofile.macports-saved_2025-09-06_at_14:04:50
##

# MacPorts Installer addition on 2025-09-06_at_14:04:50: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


ding() {
  "$@"
  osascript -e 'display notification "Ding!" with title "Ding!"'
  afplay /System/Library/Sounds/Glass.aiff
}
