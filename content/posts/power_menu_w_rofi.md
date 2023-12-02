+++
title = "Power Menu w/ rofi"
author = ["Daniel Biasiotto"]
date = 2022-12-11T02:39:00+01:00
tags = ["til", "script"]
draft = false
+++

-   <https://github.com/kataklasm/rofi-menus/blob/master/scripts/powermenu.sh>

<!--listend-->

```bash
#!/bin/bash

# options to be displayed
option0="lock"
option1="logout"
option2="suspend"
option3="scheduled suspend (10min)"
option4="scheduled suspend (20min)"
option5="scheduled suspend (30min)"
option6="reboot"
option7="shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7"

chosen="$(echo -e "$options" | rofi -lines 8 -dmenu -p "power")"
case $chosen in
    $option0)
        i3lock;;
    $option1)
        i3-msg exit;;
    $option2)
        systemctl suspend;;
	$option3)
		sleep 600 && systemctl suspend;;
	$option4)
		sleep 1200 && systemctl suspend;;
	$option5)
		sleep 1800 && systemctl suspend;;
    $option6)
        systemctl reboot;;
	$option7)
        systemctl poweroff;;
esac
```
