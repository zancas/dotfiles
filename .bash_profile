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
export PS1='\033[1;31m${?} b: $(GITBRANCH)\n${PWD}\033[0m \033[1;32m:\033[0m$\n'
if [ -f ${HOME}/.bash_completion.d/git ]; then
    . ${HOME}/.bash_completion.d/git
fi

function gitfetchcheckoutreset() {
    git fetch --all;
    git checkout $1;
    git reset --hard origin/$1;
}

## aliases
alias a='ls -lrtca'
alias l='ls -lrtc'
#function "d" lists _all_ directories in "." or ${*} if parameters are passed in order from least to most recent
function d {
   OIFS=${IFS};
   IFS=" ";
   if [[ ${*} = '' ]]
   then
     ls -ldtr * | grep ^d;
   else
     ls -ldtr ${*}/* | grep ^d;
   fi
   export IFS=${OIFS}
}
umask 002

export PYTHONDONTWRITEBYTECODE=1
export PATH=/tools/bin:$PATH
#export PYTHONPATH=/tools/lib:/tools/bin:/home/jwilcox/build/lrs_release/core2/test/robot/lib
export PYTHONPATH=$(${HOME}/python_path_setter.py)

alias emacs="emacs -nw"
alias grep="grep --color"

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
}
export PROMPT_COMMAND=set_color_prompt
