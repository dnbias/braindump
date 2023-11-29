+++
title = "Introduction to Automata Theory, Languages, and Computation"
author = ["Daniel Biasiotto"]
tags = ["book"]
draft = false
+++

[John Hopcroft]({{< relref "20210604122707-john_hopcroft.md" >}}), [Jeffrey Ullman]({{< relref "20210604122759-jeffrey_ullman.md" >}}), _Introduction to Automata Theory, Languages, and Computation_, Addison-Wesley, 1979, pp.521

`def` Automata is the study of abstract computing devices - machine


## A finite-state automaton {#a-finite-state-automaton}

has a finite number of states to remember his history

-   Inputs cause the automa to change its state


#### automaton part of a lexer {#automaton-part-of-a-lexer}

{{< figure src="/home/dan/Pictures/screenshots/lexerAutomaton.png" >}}


## Basic Concepts {#basic-concepts}


### Alphabets {#alphabets}

\\(\Sigma\\)
a finite, nonempty  set of symbols


#### powers of alphabets {#powers-of-alphabets}

with \\(\Sigma^k\\) we express the set of strings in the \\(\Sigma\\) alphabet with length \\(k\\)


### Strings {#strings}

a finite sequence of symbols chosen from some alphabet
\\(\epsilon\\) - the empty string


### Languages {#languages}

a set of strings chosen from \\(\Sigma^\*\\)


## Regular Languages {#regular-languages}

A language \\(L\\) is regular if there is a `DFA` \\(A\\) so that
     \\(L(A)=\\{w \mid \hat{\delta}(q\_0,w) \textrm{ is in }F\\}\\)


## Deterministic Finite Automata {#deterministic-finite-automata}

An automata that is in a <span class="underline">single state</span> after reading any sequence of inputs
The five-tuple describing a `DFA`:
     \\(A = (Q,\Sigma,\delta,q\_0,F)\\)

The transition function can be extended:
     \\(\hat{\delta}(q,w)=\delta(\hat{\delta}(q,x),a)\\)

The language is defined as
    \\(L(A)=\\{w \mid \hat{\delta}(q\_0,w) \textrm{ is in }F\\}\\)


## Nondeterministic Finite Automata {#nondeterministic-finite-automata}

Can be in <span class="underline">several states at once</span>
they accept the exact same regular languages that dfa do

-   they are easier to design
-   always possible to convert an NFA to a DFA
    -   in the worst case a DFA can have \\(2^n\\) states with \\(n\\) being the number of states of the NFA
    -   proof through <span class="underline">subset construction</span>

The language is defined as
    \\(L(a) = \\{w\mid\hat{\delta}(q\_0,w)\cap F\neq 0\\}\\)


## Regular Expressions {#regular-expressions}

denote the structure of data
<span class="underline">they describe exactly the same patterns as what can be described by finite automata</span>


## Complexity {#complexity}


### Decidability {#decidability}

What can a computer do?


### Intractability {#intractability}

What can a computer do efficiently?

`def` NPhard - intractable problems
