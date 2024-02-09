# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

umask 002
shopt -s checkwinsize
function GITBRANCH {
    if [[ `git branch 2>&1` == *"ot a git repository"* ]]
    then
	    echo No git repo
    else
    STATUS='[ '
    set -f
    for S in `git status -s | cut -c 1-2`;
    do
        STATUS=${STATUS}${S}' '
    done
    BRANCH=`git branch | grep ^\* | sed s"/^\* //"`
	echo ${BRANCH}${STATUS}']'
    unset -f
    fi
}
function set_color_prompt {
    RC=$?;
    DATE="\033[1;36m`date "+%s"` \033[0m||"
    USERHOSTBRANCH='\033[1;34m`cat /etc/hostname`\033[0m \033[1;34m`whoami`\033[0m \033[1;35m$(GITBRANCH)\033[0m'
    if [  ${RC} -eq 0 ]
    then
        PWDRC='\033[1;32m${PWD}\033[0m\033[1;31m: ${RC} \033[0m$'
    else
        PWDRC='\033[1;31m${PWD}\033[0m RC\033[1;32m: ${RC} \033[0m$'
    fi
    LINE0=$DATE' '$USERHOSTBRANCH'\n'
    LINE2=$PWDRC'\n'
    PS1=$LINE0$LINE2
}
export PROMPT_COMMAND=set_color_prompt
export PYTHONDONTWRITEBYTECODE=1
alias grep="grep --color"
if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
export VISUAL="hx"
export GPG_TTY=$(tty)

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 6 ]; then
    startx
fi
export NVM_DIR="$HOME/.config/nvm"

. ~/dotfiles/git-completion.bash
. "$HOME/.cargo/env"
export ANDROID_SDK_ROOT=${HOME}/Android/Sdk
export JAVA_HOME=${HOME}/java_home/jdk-18.0.2
export PATH=$PATH:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${JAVA_HOME}/bin
