+++
title = "Dynamic Edit Distance"
author = ["Daniel Biasiotto"]
tags = ["university", "project"]
draft = false
+++

In [C]({{< relref "20200929150429-c.md" >}})


## Libraries {#libraries}


### Naif ver. {#naif-ver-dot}


### Recursive ver. {#recursive-ver-dot}


### Dynamic ver. {#dynamic-ver-dot}

The structure of the algorithm should still be recursive


## Application using the Dynamic Version {#application-using-the-dynamic-version}

Taking a `dictionary` and a `sentence` as inputs:

-   For all words with at least one possible correction suggests all the minimal possible corrections

Where:

-   any word with a `edit_distance` &gt; 0 has at least a correction found in the dictionary used