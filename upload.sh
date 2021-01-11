#!/bin/bash --


function pool-commit {
    local msg="$1"
    echo "$msg"
    date > docs/last-change.html
    git commit --all --message "$msg"
    git push
}

git pull --rebase
git add docs/*

package=$(git status -s | grep ^A | grep .dsc$ | head -1 | awk '{print $2}')

if [[ "$package" ]]; then
    name=$(basename "$package" .dsc)
    echo "git commiting new package: $name"
    pool-commit "upload $name"
    exit
fi


package=$(git status -s | grep ^D | grep .dsc$ | head -1 | awk '{print $2}')

if [[ "$package" ]]; then
    name=$(basename "$package" .dsc)
    echo "git commiting removed package: $name"
    pool-commit "remove $name"
fi
