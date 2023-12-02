+++
title = "GitWatch"
author = ["Daniel Biasiotto"]
date = 2022-12-30T08:04:00+01:00
tags = ["til", "unix"]
draft = false
+++

-   <https://github.com/gitwatch/gitwatch>

`gitwatch.sh [-r <remote> [-b <branch>]] <file or directory to watch>`

`mkdir -p "$HOME/.config/systemd/user" && cp gitwatch@.service $HOME/.config/systemd/user`

`systemctl --user --now enable gitwatch@$(systemd-escape "'-r url/to/repository' /path/to/folder").service`

Works fairly well, use `ssh` and be happy.
