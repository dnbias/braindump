+++
title = "Opening books w/ zathura and rofi"
author = ["Daniel Biasiotto"]
date = 2022-12-11T04:02:00+01:00
tags = ["til", "script"]
draft = false
+++

```bash
#!/usr/bin/env sh
bookdir="/home/dnbias/Dropbox/Books/EBooks/"
exrofi="rofi -theme $HOME/.repos/rofi-collection/minimal/minimal.rasi -i -lines 10 -dmenu -p Read"

cd $bookdir || exit
chosen="$(ls {*.pdf,*.epub,*/*.pdf,*/*.epub} -R | $exrofi)"
zathura "$chosen" || exit
```
