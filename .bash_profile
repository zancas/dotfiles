# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

#export TERM=vt100
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
    if [  ${RC} -eq 0 ]
    then
	PS1='\033[1;34m`hostname`\033[0m\033[1;32m ${RC} $(GITBRANCH)\n${PWD}\033[0m \033[1;31m:\033[0m$\n';
    else
	PS1='\033[1;34m`hostname`\033[0m\033[1;32m ${RC} $(GITBRANCH)\n${PWD}\033[0m \033[1;32m:\033[0m$\n';
    fi
    export PS1;
}

export PROMPT_COMMAND=set_color_prompt

function gitfor() {
    STARTBRANCH=`git branch | grep -e"^* " | sed s"/^* //"`
    git fetch --verbose --all &&\
    git merge --verbose --ff-only origin/$STARTBRANCH &&\
    git rebase --verbose origin/$STARTBRANCH
}

umask 002

export PYTHONDONTWRITEBYTECODE=1
alias grep="grep --color"
