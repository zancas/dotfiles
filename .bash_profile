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
    LOCAL_QM=${?};
    VENV='virt';
    if [ -n "$VIRTUAL_ENV" ]
    then
     	VENV="(`basename \"$VIRTUAL_ENV\"`) ";
    else
     	VENV='';
    fi
    if [  ${LOCAL_QM} -eq 0 ]
    then
	PS1='${VENV}\033[1;32m${LOCAL_QM} b: $(GITBRANCH)\n${PWD}\033[0m \033[1;31m:\033[0m$\n';
    else
	PS1='${VENV}\033[1;31m${LOCAL_QM} b: $(GITBRANCH)\n${PWD}\033[0m \033[1;32m:\033[0m$\n';
    fi
    echo -ne "\033];${HOSTNAME%%.int.lineratesystems.com}\007";
    export PS1;
    if [[ '/build/haiti/jwilcox/lrs_release_venv' == ${VIRTUAL_ENV} ]]
    then
	export PYTHONPATH=${HOME}/tlc/tlc_client/tlc_client_base:/tools/lib:/tools/bin:${HOME}/build/lrs_release_venv/lrs_release/core2/test/robot/lib
    else
	export PYTHONPATH=/tools/lib:/tools/bin:${HOME}/build/lrs_release/core2/test/robot/lib
    fi
}


export PROMPT_COMMAND=set_color_prompt

export PS1='\033[1;31m${?} b: $(GITBRANCH)\n${PWD}\033[0m \033[1;32m:\033[0m$\n'
if [ -f ${HOME}/.bash_completion.d/git ]; then
    . ${HOME}/.bash_completion.d/git
fi

function gitfor() {
    STARTBRANCH=`git branch | grep -e"^* " | sed s"/^* //"`
    git fetch --verbose --all &&\
    git merge --verbose --ff-only origin/$STARTBRANCH &&\
    git rebase --verbose origin/$STARTBRANCH
}

umask 002

export PYTHONDONTWRITEBYTECODE=1
alias grep="grep --color"
