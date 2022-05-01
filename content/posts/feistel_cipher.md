+++
title = "Feistel Cipher"
author = ["Daniel Biasiotto"]
date = 2022-03-09T17:35:00+01:00
draft = false
+++

{{< figure src="/ox-hugo/feistel-cipher.png" >}}

For the singular step, with a broader view:
![](/ox-hugo/feistel16.jpg)

The most important parts of this approach:

-   number of rounds
    -   more rounds = harder cryptanalysis
-   design of the function \\(F\\)
    -   best if nonlinear
    -   should have good _avalanche_ properties
        -   _strict avalanche criterion_ - `SAC`
        -   _bit independence criterion_ - `BIC`
-   key schedule algorithm