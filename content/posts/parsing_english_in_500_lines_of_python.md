+++
title = "Parsing English in 500 Lines of Python"
author = ["Daniel Biasiotto"]
date = 2024-06-06T19:34:00+02:00
tags = ["article"]
draft = false
+++

-   Source: <https://explosion.ai/blog/parsing-english-in-python>
-   Author: Matthew Honnibal
-   Related: [TLN]({{< relref "tecnologie_del_linguaggio_naturale.md" >}}), [Python]({{< relref "20210328164122-python.md" >}}), [Artificial Intelligence]({{< relref "20210606005210-artificial_intelligence.md" >}}), [NLP]({{< relref "nlp.md" >}})


## Notes {#notes}

> They ate the pizza with anchovies

-   correct parsing links _with_ to _pizza_
-   incorrect parsing links _with_ to _eat_

{{< figure src="https://explosion.ai/blog/anchovies_parse.svg" >}}

-   implementation: <https://gist.github.com/syllog1sm/10343947>
-   idea: should be slightly easier to reason from the parse
    -   `parse-to-meaning` mapping simpler than `string-to-meaning` mapping
