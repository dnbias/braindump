+++
title = "git new initial commit to current status"
author = ["Daniel Biasiotto"]
date = 2023-12-14T00:49:00+01:00
tags = ["til"]
draft = false
+++

-   Source: <https://stackoverflow.com/a/13102849>

<!--listend-->

```text
git checkout --orphan newBranch
git add -A  # Add all files and commit them
git commit
git branch -D master  # Deletes the master branch
git branch -m master  # Rename the current branch to master
git push -f origin master  # Force push master branch to github
git gc --aggressive --prune=all     # remove the old files
```
