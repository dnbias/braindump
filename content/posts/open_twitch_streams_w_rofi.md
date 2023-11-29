+++
title = "Open Twitch Streams w/ rofi"
author = ["Daniel Biasiotto"]
date = 2022-12-11T02:35:00+01:00
tags = ["til", "script"]
draft = false
+++

-   <https://thisisnem.com/2020/07/06/simple-little-rofi-script/>

<!--listend-->

```bash
    #!/bin/bash

    chosen=$(echo -e “twitchchannelnamehere” | rofi -dmenu -i)

    if [[ $chosen = “twitchchannelnamehere” ]]; then

    firefox -new-window https://www.twitch.tv/popout/twitchchannelnamehere/chat?popout= ; streamlink –player mpv twitch.tv/twitchchannelnamehere best

    elif ##just used as an example to show how to add more channels



    fi
```
