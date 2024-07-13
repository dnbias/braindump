+++
title = "Markovian Queueing Network Theory"
author = ["Daniel Biasiotto"]
date = 2022-10-06T06:39:00+02:00
tags = ["compsci", "simulation"]
draft = false
+++

Theory of queueing networks based on these assumptions:

-   system modeled by a _stationary stochastic model_
-   jobs _stochastically independent_
-   jobs steps from device to device follow a [Markov Chain]({{< relref "markov_chain.md" >}})
-   system in _stochastic equilibrium_
-   service time requirements for each device comform to a _exponential distribution_
-   system is _ergotic_[^fn:1]

[^fn:1]: long-term time averages converge to the values computed for stochastic equilibrium
