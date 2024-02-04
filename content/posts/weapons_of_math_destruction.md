+++
title = "Weapons of Math Destruction"
author = ["Daniel Biasiotto"]
date = 2023-12-13T22:14:00+01:00
tags = ["ml", "book", "concept"]
draft = false
+++

[Cathy O'Neil]({{< relref "cathy_o_neil.md" >}}), _Weapons of Math Destruction_, 2016, Crown

> Most troubling, they reinforce discrimination: If a poor student can't get a loan because a lending model deems him too risky (by virtue of his zip code), he's then cut off from the kind of education that could pull him out of poverty, and a vicious spiral ensues. Models are propping up the lucky and punishing the downtrodden, creating a "toxic cocktail for democracy."


## Notes {#notes}

-   `WMD` are problematic mathematical tools that are:
    -   opaque
    -   unregulated
    -   difficult to contest
-   they are highly scalable and in this way amplify the biases the human already have applying them to a larger population
-   they create _pernicious feedback loops_ in that these models **create** the world that confirms their bias
    -   these models make predictions based off data (usually **proxies** for what is being predicted, and poor ones often) and these predictions end up being new data points that confirm and reinforce the bias
-   they end up damaging minorities and people from poor backgrounds, difficult upbringing
-   they advantage people who are already advantaged in job selection, credit, judgement of any kind
-   humans have a hard enough time explaining and understanding concepts like ethics, justice, empathy that it is obvious that models wouldn't reason through them as it is
-   Cathy suggests three ways in which these instruments can be improved
    -   use a lot of data
    -   get feedback from the results to improve the data and the model
    -   it should be clear how the model works, the types and amount of data, criteria, weights, why it makes a prediction
        -   especially important when using proxies


## Q/E/C {#q-e-c}

-   [Do WMD create and reinforce disparity?]({{< relref "do_wmd_create_and_reinforce_disparity.md" >}})
-   [Do WMD have a political bias?]({{< relref "do_wmd_have_a_political_bias.md" >}})
-   [Are WMD a threat to democracy?]({{< relref "are_wmd_a_threat_to_democracy.md" >}})
