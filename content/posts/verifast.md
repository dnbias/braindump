+++
title = "VeriFast"
author = ["Daniel Biasiotto"]
date = 2022-05-03T03:23:00+02:00
tags = ["tool", "compsci"]
draft = false
+++

-   [Github Page of the project](https://github.com/verifast/verifast)
-   [VeriFast: Imperative Programs as Proofs]({{< relref "verifast_imperative_programs_as_proofs.md" >}})
-   [Verification of Imperative Programs: The VeriFast Approach]({{< relref "verification_of_imperative_programs_the_verifast_approach.md" >}})

A tool for modular formal verification (_static symbolic analysis_) of [Correctness]({{< relref "correctness.md" >}}) properties of single-threaded and multithreaded C and Java Programs, annotated with preconditions and postconditions written in [Separation Logic]({{< relref "separation_logic.md" >}}).


## Theoretical Syntax {#theoretical-syntax}

-   \\(\exists\\) and \\(\forall\\) can be defined as recursive `predicates`
-   a basic imperative language
-   the language has pointers


## Symbolic State {#symbolic-state}

\\((s,h,\pi)\\)

-   store
-   symbolic heap
-   pattern conditions


## Production - Consumption {#production-consumption}

1.  production of \\(a\\)
    -   instantiation of chunk
    -   we have an assumption
2.  consumption of \\(a\\)
    -   removal of chunk
    -   we prove the assumption

\\[\text{produce}(h,s,\pi,a,Q) =
\begin{cases}
\pi,s,h' \vdash\_{\text{SMT}} a \text{ with }h\perp h'\\\\
Q (s, h \uplus h', \pi') \text{ with }\pi \subseteq \pi'
\end{cases}\\]

\\[\text{consume}(h,s,\pi,a,Q) =
\begin{cases}
\pi,s,h' \vdash\_{\text{SMT}} a \text{ with }h = h' \uplus h''\\\\
Q (s, h'', \pi') \text{ with }\pi \subseteq \pi'
\end{cases}\\]

Then these are used by 2 routines:

-   `verify(h,s,$\pi$,f(e),Q) where $f(x)$ requires $A_{1}$; ensures $A_{2}$;`
-   `valid($f(x)$ requires $A_{1}$; ensures $A_{2}$; $\{\overline{s}\}$)`


## Branches {#branches}

Happens in 2 cases:

1.  there is an `if` statement
2.  there is an `heap` allocation
    -   there is the case where the allocation does not succeed