+++
title = "CPU to performance in Linux"
author = ["Daniel Biasiotto"]
date = 2023-04-18T20:48:00+02:00
tags = ["til", "linux"]
draft = false
+++

-   Source: <https://www.rodolfocarvalho.net/blog/how-to-disable-cpu-powersave-on-linux/>

<!--listend-->

```text
echo performance | sudo tee /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_governor
```
