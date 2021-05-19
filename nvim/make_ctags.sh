#! /usr/bin/sh

make_ctags_when_in_repo() {
    if git show >> /dev/null 2>&1; then
        cd git rev-parse --show-toplevel;
        if ls -a | grep -q \"Cargo\\.toml\"; then
            ctags --exclude=target -R *;
        else
            ctags -R *;
        fi
    else
        echo Not a git repository;
    fi 
};
make_ctags_when_in_repo
