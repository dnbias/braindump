+++
title = "Screenshot to clipboard"
author = ["Daniel Biasiotto"]
date = 2022-06-09T17:50:00+02:00
tags = ["til", "linux"]
draft = false
+++

```bash
$ maim -s -u | xclip -selection clipboard -t image/png -i
```
