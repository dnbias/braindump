+++
title = "Quality of Service in Computer Networks"
author = ["Daniel Biasiotto"]
date = 2023-02-27T10:57:00+01:00
tags = ["erasmus", "university", "compsci", "master"]
draft = false
+++

## Components &amp; Modules {#components-and-modules}

-   time-space multiplexer


## Homogeneous Markov Processes {#homogeneous-markov-processes}

For **irreducible aperiodic** `MC`
\\[p\_{j} = \sum\_{i\in S} p\_{i}P\_{ij}  \quad \forall j\in S\\]

Global balance
\\[\sum\_{i \in S / \\{j\\}}} p\_{i}p\_{j}\\]


### Non-stationary case {#non-stationary-case}

Probability density \\(q\\) are elegant solution to have simpler equations, independent of time-scale.

-   assuming transition probabilities where we zoom on the time axis to where the transition is smooth
    -   can be approximated to a linear function
    -   $$p<sub>ij</sub>(s)=q<sub>ij</sub>&sdot; s + o(s) \quad j&ne; i$

**Conditional** and **absolute** transition probability:
\\[p\_{ik}^{\star}(s)=p\_{i}(t)\cdot p\_{ik}(s)\\]

**Kolmogoroff Equation**


### Stationary case {#stationary-case}

\\[p\_{X}= \lim\_{t\to \infty}p\_{X}(t)\\]
\\[lim<sub>t&rarr;&infin;\\</sub>]

Statistical equilibrium for the states:
\\[q\_{k}p\_{k}=\sum\_{i\neq k} q\_{ik}\cdot p\_{i}\\]

**Generalised** state equations:

\begin{align\*}
p\_S = \sum\_{k\in S} p\_k \\\\
q\_k = \sum\_{i\neq k} q\_{ki}
\end{align\*}

You can generalize a set of state to abstract into a single bigger markov state that includes them.


## Communication Traffic as Random Process {#communication-traffic-as-random-process}

In formulas \\(t\\) and \\(\Delta t\\) are interchangeable.


### State process {#state-process}


### Call process {#call-process}

\begin{align\*}
q\_{A}= \lambda\\\\
F\_{A}(t)=P(T\_{A} \leq t)\\\\
E(T\_{A}) = \frac{1}{\lambda}\\\\
c = \lambda \\\\
F\_{A}(t) = P(T\_{A} \le t) = 1 - e^{-\lambda t} \\\\
F\_{A}^{C}(t) = P(T\_{A} > t) = e^{-\lambda t} \\\\
\end{align\*}


### End process {#end-process}

\begin{align\*}
F\_H(t) &= P(T\_H \leq t) = - e^{\frac{t}{h}}\\\\
\text{end rate: } \epsilon &= \frac{1}{h}\\\\
p\_{E1}&=1-e^{-\frac{\Delta t}{h}}+o(\Delta t)\\\\
\text{probability density: } q\_{E,x}&=\lim\_{\Delta t \to 0}\frac{P\_{E,x}(\Delta t)}{\Delta t} \text{ so } q\_{E,x}=\frac{x}{h}
\end{align\*}


## One-dimensional birth-death processes {#one-dimensional-birth-death-processes}

\beg
&sum; P_i = 1 <br />

\end
To not have \\(n\\) members to the equations we use a generalised state \\(S\_x\\) and consider only the interactions with the interactions with the neighbours crossing its limits.
Local balance:
\\[\lambda\_x P\_x = \mu\_{x+1}P\_{x+1}\\]
\\[P\_x = P\_0 \prod\_{i=1}^{x}\frac{\lambda\_{i-1}}{\mu\_i}\\]
where the product is defined as \\[L\_x\\], \\[L\_0=1\\]

\\[\sum\_x P\_x = P\_0 \cdot \sum\_x L\_x = 1 \iff P\_0 = \frac{1}{\sum\_{x}L\_x}\\]
\\[P\_x = \frac{L\_{x}}{\sum\_i L\_i}\\]


## Process for unlimited number of traffic sources {#process-for-unlimited-number-of-traffic-sources}

Definition of _announcement_:
\\[\lambda \cdot h =: A\\]
**Erlang-equation**:
\\[P_x=\frac{}{}]

Definition of _loss probability_:[^fn:1]
\\[B := P\_n = \frac{\frac{A^{n}}{n!}}{\sum\_{i=0}^{n}\frac{A^{i}}{i!}}\\]
_Expectation value_ is calculated over all probabilities.
\\[E\\{n}\\}\\]
_Traffic intensity_
\\[Y =\\]
_Residual traffic_
\\[R= Y - A = A\cdot B\\]


## Queues with Priorities {#queues-with-priorities}

Priorities for tasks and each one has a service rate in the `CPU`.
The network is basically a `M/G/1`.
Can have preemptive or non-preemptive priorities.

By applying the non-preemptive model in the case of 2 priority classes the result is that to save time compared to a basic `M/G/1`:
\\[x\_2 > x\_1\\]
Meaning the longest jobs need to be placed in the lowest priority class of the network.


## Queueing Networks {#queueing-networks}

A network of queues can be computed by computing independently the single queues based on some assumptions.
**Kleinrock's Independence Assumption**, 4 conditions

1.  packet streams at the inputs of the network are Poisson distributed
2.  packet length exponentially distributed
3.  no dependency between arrival time of a packet in the next queue and its service times
4.  the nodes of the network are sufficiently close to each other

In general this assumption gives a good first approximation of the network, it is well known that the `OWTT` is overestimated using this independence assumption.

**Jackson network** helps find exact solutions under certain conditions. This is the case assuming the first 3 conditions of the Kleinrock's assumption.
These networks are called product networks[^fn:2] or [Tandem Queues]({{< relref "tandem_queues.md" >}}).
In these networks packets can go through the network (and spend each queue delay time as well) multiple times.
So in addition to the delay for the independent queues one needs to compute an average of passes for a packet stream through the network.

\begin{align\*}
T\_{in,1} &= 3T\_1 + 2T\_2\\\\
T\_{in,2} &= \frac{3}{2}T\_1 + 2T\_2
\end{align\*}


## Quality of Service in Computer Networks {#quality-of-service-in-computer-networks}

Show that `QoS` and _anonimity_ and _privacy_ are in constant tension.
The contract signing needs to be fair (_fair exchange_). For a pair of agents, both must succeed or both must fail.
There are limitations to network security:

-   impossibility of consensus
-   asynchronous setting

Solution can be a **Trusted Third Party** (`TTP`)

-   it is a bottleneck
-   should be fair
-   should be timely
-   receives signatures and distributes the contracts

`TTP` can

-   issue a replacement contract
-   issue an abort token
-   acts only when requested


## Anonymity {#anonymity}

-   Chaum's MIX, anonymous email[^fn:3]
    -   bad for spam of course
    -   the `MIX` stands between senders and receivers and masks direct communications, to an attacker the `MIX` will look like flows of incoming and outgoing messages
        -   it needs _traffic padding_ and _buffering_ to prevent timing correlation attacks
    -   this protocol allows _secrecy_ without _authentication_ where \\(A\\) knows it is talking with \\(B\\) but \\(B\\) does not know, it simply responds to the `MIX` using fresh public keys generated by \\(A\\).
    -   the adversary needs to control all cascade mixes, one good mix is enough for anonymity
-   Dining cryptographers[^fn:4]
    -   information-theoretic anonymity
    -   needs incredible amount of randomness, unpractical
    -   we need \\(n\\) bits to in the end broadcast a single bit

[^fn:1]: This is the probability that the network is full.
[^fn:2]: This name is due to the fact that the queues remain statistically independent of each other, and can therefore be concatenated using the logical AND (product).
[^fn:3]: "Untraceable electronic mail, return addresses, and digital pseudonyms", Communications of the ACM, 1981
[^fn:4]: "The dining cryptographers problem: unconditional sender and recipient untraceability", Journal of Cryptology, 1988
