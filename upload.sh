#!/bin/bash --
git pull
git add docs/*
package=$(git status -s | grep ^A | grep .dsc$ | python3 -c "import pathlib; print(pathlib.Path(input()).stem)")
git ci -a -m "upload $package"
git push
