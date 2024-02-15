#!/bin/bash --


function pool-commit {
    local msg="$1"
    echo "$msg"
    date > docs/last-change.html
    git commit --all --message "$msg"
    git push
}


function pool-sync {
    git add docs/*

    package=$(git status -s | grep ^A | grep .deb$ | head -1 | awk '{print $2}' | sed 's/_[^_]*$//')

    if [[ "$package" ]]; then
	name=$(basename "$package" .dsc)
	echo "git commiting NEW package: $name"
	pool-commit "upload $name"
	exit
    fi

    package=$(git status -s | grep ^D | grep .dsc$ | head -1 | awk '{print $2}')

    if [[ "$package" ]]; then
	name=$(basename "$package" .dsc)
	echo "git commiting REMOVED package: $name"
	pool-commit "remove $name"
    fi
}

cd "$(dirname "$(readlink -f "$0")")"
pool-sync
