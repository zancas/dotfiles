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
	git branch | grep ^\* | sed s"/^\* //";
    fi
}
function set_color_prompt {
    RC=${?};
    LINE1='HOST: \033[1;34m`hostname` \033[0m BRANCH: \033[1;35m$(GITBRANCH)\033[0m'
    if [  ${RC} -eq 0 ]
    then
        LINE2='\033[1;32m${PWD}\033[0m \033[1;31m: ${RC} \033[0m$'
    else
	    LINE2='\033[1;31m${PWD}\033[0m RC\033[1;32m: ${RC} \033[0m$'
    fi
    PS1=$LINE1'\n'$LINE2'\n'
}

export PROMPT_COMMAND=set_color_prompt

export PYTHONDONTWRITEBYTECODE=1
alias grep="grep --color"
