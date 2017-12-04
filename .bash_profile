if [ -n "$TMUX" ] && [ -n "$SESSION_LINK" ];
    then
    export SSH_AUTH_SOCK=$SESSION_LINK
fi
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

umask 002
shopt -s checkwinsize
function GITBRANCH {
    if [[ `git branch 2>&1` == *"Not a git repository"* ]]
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
function ssh_key_fps_and_fns {
    if [[ `ssh-add 2>&1` == *"Could not open a connection"* ]]
    then
        echo No ssh-agent
    else
        KEYFNAMES=''
        for FNAME in `ssh-add -l | cut -d ' ' -f 3`;
        do
            KEYFNAMES=$KEYFNAMES' '${FNAME##*/}
        done
        echo $KEYFNAMES
    fi
}


function set_color_prompt {
    RC=$?;
    DATE="\033[1;36m`date` \033[0m||"
    USERHOSTBRANCH='\033[1;34m`hostname`\033[0m \033[1;34m`whoami`\033[0m \033[1;35m$(GITBRANCH)\033[0m'
    if [  ${RC} -eq 0 ]
    then
        PWDRC='\033[1;32m${PWD}\033[0m\033[1;31m: ${RC} \033[0m$'
    else
        PWDRC='\033[1;31m${PWD}\033[0m RC\033[1;32m: ${RC} \033[0m$'
    fi
    LINE0=$DATE' '$USERHOSTBRANCH'\n'
    #LINE1=$(ssh_key_fps_and_fns)'\n'
    LINE2=$PWDRC'\n'
    PS1=$LINE0$LINE2 #$LINE2
}
export PROMPT_COMMAND=set_color_prompt

export PYTHONDONTWRITEBYTECODE=1
alias grep="grep --color"
#source ~/.containenv/.loginrc

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi
