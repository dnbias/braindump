+++
title = "Intelligent Agents I"
author = ["Daniel Biasiotto"]
date = 2023-02-27T10:55:00+01:00
tags = ["erasmus", "university", "compsci", "master"]
draft = false
+++

Course taught by **Leon van der Torre** in the University of Luxembourg.


## Agent {#agent}

-   interacts with an _environment_
    -   could be anything
    -   has **perception** of this environment (sensors)
    -   can take **action** based on this perception (actuators)
-   **reasoning** takes the agent from perception to action
    -   this is the aspect studied in this course


## Classical Logic {#classical-logic}

-   propositional logic
-   first order logic

Can't classical logics be used?

-   the problem is the information we have is not purely mathematical
-   how do you model **Knowing**
    -   \\(\text{Knowing}(X,Y)\\)
    -   problem of extensionality
        -   knowledge is not extentional
            -   knowing something that is true **does not mean** knowing everything that is true
            -   in `CL` true formulas are equivalent
    -   facts can be inconsistent
        -   \\(A\\) is the case **and** \\(\lnot A\\) is perceived \\(\implies\\) anything
            -   false implies anything
            -   **principle of explosion**
    -   monotone logic is not what we want
        -   in implications we can add anything to the left side and the right will still hold
        -   does not model exceptions to a rule
-   **material implication** is not intuitive and does not make sense in real world applications

So the `CL` need to be extended to allow for reasoning in real world context.


## Logics {#logics}


### Modal Logics {#modal-logics}

`ML`


#### Syntax {#syntax}

-   alphabet
    -   connectives
    -   propositional symbols
    -   parenthesis
    -   2 new connectives
        -   \\(\square \quad \diamond\\)
-   formula
    -   $p &isin; PS | A &and; B | ...$

The _box_ and _diamond_ can be interpreted as:

-   depends of the context
-   alethic logic
    -   \\(\square A\\) - necessarily \\(A\\)
    -   \\(\diamond A\\) - possibly \\(A\\)
-   doxastic logic
    -   \\(\square A\\) - \\(A\\) is believed to be true
-   epistemic logic
    -   \\(\square A\\) - \\(A\\) is known


#### Modal {#modal}

_Qualifies the truth of a statement_

-   can qualify if the truth is temporally qualified or necessarily qualified etc.


#### Epistemic Logics {#epistemic-logics}

-   equivalence relations
-   common knowledge
    -   adds induction in the language
-   everyone knows
-   updates with public announcements
    -   reduction


#### Temporal Logics {#temporal-logics}

-   order relations
    -   total order
    -   partial order
-   until
    -   something holds until something else holds
    -   binary operation
-   quantification with \\(A\\), \\(E\\)

Properties about

-   assertions that
    -   might hold in the future
    -   held in the past
    -   will hold eventually

Used for reasoning about temporal aspects in natural language, evolution in multi-agents systems, formal methods reasoning and verification

From a computation point of view the easiest way to think about time is one that is

-   backward-linear, branches in the future
    -   partial order
    -   can be a decision tree
    -   can be a probabilistic tree
-   discrete

Operators:

-   Next: \\(X\phi\\), sometimes a \\(\circ \phi\\)
    -   accessible worlds
    -   not transitive
-   Globally: \\(G \phi\\)
    -   all worlds in the future
    -   transitive
-   Future: \\(F\phi\\)
    -   holds eventually
-   Until: \\(\phi U \psi\\), can be strong on weak (inclusive or not)
    -   \\(\phi\\) holds until \\(\psi\\) holds
    -   \\(\psi\\) holds in the future
    -   \\(\phi\\) holds until the moment in the future where \\(\psi\\) holds
        -   \\(\lnot \psi \land \phi \to \lnot \psi \land \phi \to \psi \land \lnot \phi\\)

-   safeness properties
    -   something bad never happens, uses \\(G\\)
-   liveness properties
    -   something good eventually happens (infinitely often)
    -   uses \\(G\\) and \\(F\\)

<!--list-separator-->

-  Linear temporal logics

    `LTL`

    -   prop symbols
    -   negation
    -   conjunction
    -   \\(X\\)
        -   its the same as \\(\square\\) and \\(\diamond\\) but being linear now they are the same
    -   \\(U\\)

    We can define

    -   \\(F\\) is the tautology of \\(F \phi = \text{T} U \phi\\)
    -   \\(G\\) is defined as the dual of future \\(G \phi = \lnot F \lnot \phi\\)

    The set of worlds represent the infinite set of time instants.
    For the semantics we define \\(\lambda\\) as the possible worlds model

    -   can think about the trace a system
    -   used to simplify notation of the accessibility relation \\(R\\) (which is a total order)
    -   access a point (world) in the sequence as \\(\lambda(i) = w\_i\\)
    -   have a new _trace_ starting from \\(i\\) with \\(\lambda^i = w\_i w\_{i+1} w\_{i+2}\cdots\\)

<!--list-separator-->

-  Computation Tree logic

    `CTL`
    We want to talk about partial orders.
    It is an extention of `LTL`, temporal operators and path quantifiers.

    -   path formulas (`LTL`) and reference to state formulas
    -   state formulas and reference to path formulas with new operators \\(A\\) (all trace) and \\(E\\) (exists, one formula)


#### First-order modal Logics {#first-order-modal-logics}

-   \\(\Sigma\\) signature
-   \\(I\\) interpretation
-   \\(D\\) domain
    -   set of individuals
    -   same or different in the various worlds
-   \\(M = (D,I)\\) model

Quantifiers:

-   \\(\square\\) quantifies over accessible words
-   \\(\forall\\) quantifies over individuals

**Constant domain augmented frame** \\((W,R,D)\\), constant because the domain doesn't change world to world.
The interpretation of constants and functions do not depend on a world, while propositions do.

**Varying domains** \\((W,R,D,I)\\), domains depend on a single worlds.

Both versions can simulate each other.

**Correspondance**

-   \\(\forall x \square P(x) \equiv \square \forall x P(x) \iff M \text{ is constant domains }\\)


### Proof Systems {#proof-systems}


#### Hilbert style {#hilbert-style}

A **Hilbert style** proof system is more difficult to use as it requires creativity.
You start from any tautology and with it's rules it generates all true statements, this is elegant but it is not good for proof search. It is a so called **synthetic** proof system.
On the other hand a **Gentzen system** you start from the formula you want to prove and it is an **analytic** and **sequential**. It has a decision procedure, it is applicable by machines.

It is very small with only 2 axioms and 3 rules for the $K$-proof.
Axioms:

-   K
-   Dual

Rules:

-   Modus Ponens
-   Uniform substitution
-   Generalization/Necessitation

**NB** in Hilbert systems you cannot use assumptions as input to generalization.


#### Semantic Tableaux {#semantic-tableaux}

**Semantic Tableaux** is a indirect proof system, **analytic** (so it's similar to sequent calculus).

-   formulas are prefixed by numbers
    -   i.e. `1.1.2,1`
-   root is `1.`
    -   to try and prove \\(A\\) then the root is the negation \\(\lnot A\\)
-   application of tableaux rules build the tree
-   branch gets closed `iff` a formula and its negation both occur in it
-   \\(A\\) is proven when each branch is closed
    -   if all rules have been applied but there is still an open branch \\(A\\) cannot be proven
-   it is **sound and complete**

<!--list-separator-->

-  Inference rules

    Prefix is indicated by \\(\sigma\\).
    The whole idea is to simplify formulas by removing connectives.
    The | is the representation of the tree. It creates two branches where one side is true or the other is.
    The reasoning is by cases and proceeds by proving contradictions (closing the branch) in all these cases.


### Multi-agent Logics {#multi-agent-logics}

Express the individual knowledge.


## Knowledge Representation and Reasoning {#knowledge-representation-and-reasoning}

Commonsense reasoning and [non-monotonic logic]({{< relref "non_monotonic_logic.md" >}}) (used to be refered to as informal logic)

-   going beyond formal logic


### Fatio {#fatio}

How reasons are used in dialogue

-   **axiomatic semantic**
-   **Dialectic Obligation Store**
    -   triples of the form participant, formula, argument
    -   publicly viewable
        -   private-write, public read
-   modal operators
    -   \\(B,\phi\\), **believes**
    -   \\(D,\phi\\), **desires**


#### Semantics {#semantics}

\\(assert(P\_{i}, \phi)\\)

-   Pre-condition
    -   \\(((P\_{i}, \phi, +) \notin DOS(P\_{i})) \land (\forall j \neq i) (D\_{i}B\_{j}B\_{i}\phi)\\)
-   Post-condition
    -   \\(((P\_{i}, \phi, +) \in DOS(P\_{i})) \land (\forall k \neq i) (\forall j \neq i)(B\_{k}D\_{i} B\_{j} B\_{i}\phi)\\)
-   adds to `DOS`

\\(question(P\_{j} , P\_{i}, \phi)\\)

-   no effect on `DOS`

\\(justify(P\_{i} , \Phi \vdash^+ \phi)\\)

-   adds to `DOS` of speaker \\(i\\)

\\(challenge(P\_{j} , P\_{i}, \phi)\\)

\\(retract( P\_{i}, \phi)\\)

-   either a supporting argument (+) or an attacking one (-) to &phi; is removed from `DOS` of agent \\(i\\)

Different levels of logic in dialogues with these sentences

-   logic reasoning using \\(\vdash^+ \vdash^-\\)
-   static at a moment in time
    -   commitment expressed with obligations and `DOS`
    -   \\(B, D\\)
-   dynamic (operational)
    -   considering the whole set of sentences
    -   higher level of reasoning

<!--list-separator-->

-  Operational semantics

    -   indicates how the states of a system change as a result of execution of the commands in a programming language
        -   commands here are in an argumentation dialogue according to the rules of the protocol (Fatio)
    -   define the **locutions**

    **Agent Decision Mechanisms**

    -   D1(&phi;): Claim or Not
    -   D2: React or Not
    -   D3(&phi;): Defend or Not
    -   D4(&phi;): Fold or Not
    -   D5: Listen or Do, can continue listening or acting with any other mechanism
        -   this is a meta-level decision mechanism


### Historical view {#historical-view}

-   Formal Logic - **Aristotle**
-   Informal Logic - 60' **Toulmin**, use of argument
-   Non-monotonic logic &amp; logic programming - 90'
-   AI &amp; Law
-   Formal argumentation

Two possibilities:

-   argumentation as inference
    -   static
    -   abstract
    -   structured
-   argumentation as dialogue
    -   dynamic
    -   strategic


### Toulmin argument scheme {#toulmin-argument-scheme}

-   data
-   warrant
-   backing
-   rebuttal


### Non-monotonic reasoning {#non-monotonic-reasoning}

-   **Pollock** in 1987
-   no more simple deductive reasoning where the validity of the premise _guarantees_ the validity of the conclusion

Different types of attacks

-   undercutting (inference rules)
    -   interrupting the inference rules
-   undermining
    -   attacking the premise
-   rebutting
    -   attacking the conclusion


### Dung {#dung}

Relating arguments, graph theory

-   nodes are arguments
-   edges are attacks


### ASPIC+[^fn:1] {#aspic-plus}

Structured argumentation, from reasons to arguments
Abstract:

-   from zoomed in arguments and attacks to simple nodes attacking each other

labellings:

-   argument in \iff all attackers are out
-   argument out \iff an attacker is in
-   argument undec \iff not all attackers are out and no attackers is in

Maximal in/out/undec

-   a set that has no possible superset that is a solution of the graph

Correspondence between Dung-style semantics and restrictions on compl. labeling

-   complete semantics
    -   no further restrictions
-   stable semantics
    -   empty undec
-   preferred semantics - somewhat credulous semantic
    -   maximal in
    -   maximal out
-   grounded semantics - somewhat skeptical semantic
    -   maximal undec
    -   minimal in
    -   minimal out
-   semi-stable semantics
    -   minimal undec


### Discussion Games {#discussion-games}

Relate discussions with argumentation semantics
Discussion games are like a calculus related to these semantics. They give us a procedure to check whether an argument is labeled `in` by some labelling.

These games show the difference in the grounded and the preferred labellings, the first is skeptical the second is more credulous.

While logic is interested in what is truth argumentation is interested in the justification of an argument.


#### Grounded Discussion Games {#grounded-discussion-games}

Relating to grounded argumentations. That is a complete labelling where `undec(Lab)` is maximal.
It can be proved that this is exactly one labelling.

-   goal: check \\(A \in In(Lab)\\) for grounded labelling \\(Lab\\) of the `AF`[^fn:2]

Players:

-   proponent \\(P\\)
-   opponent \\(O\\)

4 moves

-   \\(P: HTB(A) \to Lab(A) = in\\)
    -   has to be the case that \\(A\\)
-   \\(O: CB(A) \to\\) maybe \\(Lab(A) \neq out\\) in every complete labelling
    -   could be the case that \\(A\\)
-   \\(O: Concede(A) \to\\) agree \\(Lab(A) = in\\) in every complete labelling
-   \\(O: Retract(A) \to Lab(A) = out\\) in every complete labelling

The game is about a particular argument \\(A\\) called the _main argument_

As a general rule there cannot be `HBT-CB` repeats, \\(\forall A:\\)

-   \\(HTB(A)\\) only once
-   \\(CB(A)\\) only once
-   no both \\(HTB(A)\\) and \\(CB(A)\\)

If at some point there are no moves left for \\(P\\) they lose the game and \\(O\\) wins.

-   the discussion is _terminated_ when no legal move is possible
-   a _terminated_ discussion starting with \\(HTB(A)\\) is won by \\(P\\) iff the \\(O\\) has moved \\(Concede(A)\\)

These games are **sound** and **complete**

-   if \\(P\\) wins the main argument is really labelled in by the grounded labelling
-   if argument \\(A\\) is in the ground labelling then there is a strategy such a game with main argument \\(A\\) can be won
    -   no need to win the argument in all cases


#### Preferred Discussion Games {#preferred-discussion-games}

Relating to grounded argumentations. That is a complete labelling where `in(Lab)` is maximal.

-   based on socratic discussions
    -   enquiry based on critical questions on entailed _consequences_, this is different from a classical discussion where the dialogue looks at the reasons that imply the main argument with the opponent always asking _why_
    -   leading to a contradiction on success

So one is:
\\(T \implies ... \implies ... \implies A\\)
Socratic is:
\\(A \implies ... \implies ... \implies \perp\\)

The result we use for these games is that for \\(A\\) to be in a pref. lab. it is enough for it to be in a complete lab. or in an admissible lab.

Two players \\(P\\) (man) and \\(O\\) (Socrates).
2 moves:

-   \\(P : in(A)\\)
-   \\(O: out(A)\\)

\\(P\\) is allowed to repeat moves while \\(O\\) is not.
\\(O\\) moves regard attackers to arguments put forward by \\(P\\)
If a contradiction is reached \\(O\\) wins
If a player has to move but has no moves left they lost the dialogue.

These games are **sound** and **complete**

-   if \\(P\\) wins the main argument is really labelled in by the preferred labelling
-   if argument \\(A\\) is in the preferred labelling then there is a strategy such a game with main argument \\(A\\) **can** be won
    -   no need to win the argument in all cases


### Structured Argumentation {#structured-argumentation}

Abstract argumentation focused on the relationship between arguments, in an abstract way.
Structured argumentation gives interpretation to the actual arguments in the framework.

-   we expand the _nodes_ of the abstract argumentation where the actual arguments reside
-   give actual structure to the inside of the nodes (arguments) with evidence/support/claims
-   the attacks here are called _defeats_

The framework is called [ASPIC+]({{< relref "aspic.md" >}})

-   fallible premises, plausible reasoning
-   fallible inferences, defeasible reasoning
-   **arguments** are **directed acyclic graphs** (`DAGs`)
    -   nodes are formulas (we assume propositional logic but can vary, needs to have a negation)
    -   edges are meta-level inferences (not coming from the logic)
-   **defeat** are attacks between arguments + preference relation
-   **argument acceptability** based on argumentation semantics


#### Argumentation System {#argumentation-system}

**Def**: An \\(AS\\) is a tuple \\(AS = (L,R,n)\\)

-   \\(L\\) logical language with \\(\neg\\)
-   \\(R\\) set of inference rules with \\(R = R\_s \dot\cup R\_d\\)
    -   \\(R\_s\\) set of strict rules \\(\phi\_1,\dots,\phi\_n \to \phi\\)
    -   \\(R\_d\\) set of defeasible rules \\(\phi\_1,\dots,\phi\_n \implies \phi\\)
-   \\(n: R\_d \to L\\) naming function


#### Knowledge Bases {#knowledge-bases}

**Def**: A \\(K\\) based on \\(AS = (L,R,n)\\) is a set \\(K \subseteq L\\)

-   \\(K = K\_n \dot\cup K\_p\\)
    -   \\(K\_n\\) necessary premise, cannot be attacked as they are facts
    -   \\(K\_p\\) ordinary premise, can be attacked


#### Argumentation Theory {#argumentation-theory}

**Def**: An \\(AT\\) is a pair \\(AT=(AS,K)\\)


#### Arguments {#arguments}

-   atomics, entries from the knowledge base \\(K\\) can be arguments
-   arguments are concatenated building larger arguments with a strict rule
-   arguments are concatenated building larger arguments with a defeasible rule

An argument \\(A\\) is:

-   _strict_ `iff` \\(DefRules(A)=\emptyset\\)
-   _defeasible_ `iff` not strict
-   _firm_ `iff` \\(Prem(A) \subseteq K\_n\\)
-   _plausible_ `iff` not firm


#### Structured Argumentation Framework {#structured-argumentation-framework}

**Def**: a \\(SAF\\) defined by \\(AT\\) is a tuple \\(SAF=(Args, C, \le)\\)

-   \\(Args = \\{Arg | Arg \text{ is an argument based on } AT\\}\\)
-   \\(C \subseteq Args \times Args\\) is the attack relation on the arguments
-   \\(\le \\: \subseteq Args \times Args\\) is a preference ordering on the arguments


#### Defeats {#defeats}

\\(-A\\) stands for \\(\lnot A\\) if \\(A\\) itself is not a negation, in the other case it removes the double negation.

-   \\(A\\) **undermines** \\(B\\) on \\(\phi\\) `iff` \\(Conc(A)=-\phi\\) for some \\(\phi\in Prem(B) \backslash K\_n\\)
-   \\(A\\) **rebuts** \\(B\\) on \\(B '\\) `iff` \\(Conc(A)=-Conc(B)\\) for some \\(B' \in Sub(B)\\) with a defeasible top rule
-   \\(A\\) **undercuts** \\(B\\) on \\(B'\\) `iff` \\(Conc(A)=- n( r)\\) for some \\(B' \in Sub(B)\\) with a defeasible top rule \\(r\\)

\\(A\\) **attacks** \\(B\\) `iff` any of these attacks are present.

\\(A\\) **defeats** \\(B\\) `iff` for some \\(B'\\)

-   \\(A\\) undermines \\(B\\) or rebuts \\(B\\) on \\(B'\\) _and_ \\(A \not< B'\\)

_or_

-   \\(A\\) undercuts \\(B\\) on \\(B'\\)


#### Frameworks Considerations {#frameworks-considerations}

Developments in logic go from monotonic to non-monotonic:

-   exceptions
-   conflicts
-   common reason

This change also brings to leave the traditional semantics based on models.

The [ASPIC+]({{< relref "aspic.md" >}}) generate from the formulas and rules an argumentation framework.
This allows to have preferences and abstract semantics. The abstract semantics allow argument extensions.
From these extensions set one can go back to formulas by taking the intersection for a more classic logic approach. Still non-monotonic of course.

To create a consistent framework classical logic derivations like one for **conjunction**.
This allows for a knowledge base to have \\(K = p,q,\lnot(p\land q)\\) and still be consistent.
From a derivation rule for conjunction the frame work could derive \\(p \land q\\) from the simpler arguments \\(p\\) and \\(q\\). This would operate for any couple in the knowledge base.

This mechanism allows for extensions and conflict keeping consistency.


#### Preference {#preference}

To add preferences in the framework you can insert preferences over _rules_ and preferences over _formulas_ and then find a way to **lift** the preferences over _arguments_.

-   preference for arguments in general has undefined origin
-   \\(A <\_a B\\) if \\(B\\) is strict and firm and \\(A\\) is defeasible or plausible
-   could be defined in terms of partial preorders \\(\le\\) on \\(R\_d\\) and \\(\le'\\) on \\(K\_p\\)
    -   these orders have to be manually added to the model
    -   i.e. new rules often have superior order to older rules in the argumentation framework

**Weakest link ordering** can be used to find a vulnerable link in an argument. The strength of the argument is the one of the weakest defeasible rule.

-   for sets of rules \\(S\_1 <\_s S\_2\\) if \\(\exists s1 \in S\_1  \forall s2 \in S\_2: s1 < s2\\)
-   for arguments
    -   \\(A <\_a B\\) `iff`
        -   \\(LDR(A) <\_s LDR(B)\\) or
        -   if both \\(A\\) and \\(B\\) are not strict (???) \\(Prem(A) <\_s Prem(B)\\)

**Last-link ordering** compares the **last** defeasible rules of each argument.


#### Consistency {#consistency}

For any \\(S \subseteq L\\)

-   \\(S\\) is _directly consistent_ iff \\(S\\) does not contain two formulas \\(\phi\\) and \\(\lnot \phi\\)
-   the _strict closure_ \\(Cl(S)\\) is \\(S\\) + everything derivable from \\(S\\) with strict rules \\(R\_s\\)
-   \\(S\\) is _indirectly consistent_ iff \\(Cl(S)\\) is directly consistent, depends on the choice of strict rules (from propositional logic)


#### Rationality Postulates {#rationality-postulates}

-   **sub-argument closure**, to accept a proof you have to prove all their lemmas
-   **direct consistency**, conclusions are directly consistent
-   **strict closure**, the closure of the conclusions is equivalent to the conclusions
-   **indirect consistency**

To make sure the set is consistent one can add the **contraposition** rule from `PL` to add knowledge to the rules.
So the additions to [ASPIC+]({{< relref "aspic.md" >}}) are **transposition** and **contraposition**.

[^fn:1]: See [ASPIC+]({{< relref "aspic.md" >}}).
[^fn:2]: Argumentation Framework
