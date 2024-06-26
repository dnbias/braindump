+++
title = "Metodi Formali dell'Informatica"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

-   Prof: Ugo De' Liguoro
-   [PDF Version](./20210921122326-metodo_formali_dell_informatica.pdf)
-   Testo:
    -   [Programming Language Foundation in Agda]({{< relref "20210921122441-programming_language_foundation_in_agda.md" >}})


## Teoria {#teoria}

I linguaggi sono definibili come sistemi formali, composti di

-   alfabeto di simboli
-   espressioni ben formate
-   regole di inferenza


### Metodi Formali {#metodi-formali}

Derivano dalla logica-matematica

-   Chompsky - Teoria delle Grammatiche
    -   paralleli con gli automi
-   Linguaggi di programmazione - Linguaggi formali
    -   metodo che permette di verificare - Metodi Formale
        -   descrizioni formali del comportamento dei programmi

> In computer science **formal methods** are a particular kind of mathematically based techniques for the specification, development and verification of software and hardware systems - Wikipedia

-   Componenti dei metodi formali
    -   calcoli logici
    -   sistemi di riscrittura
        -   semplificazioni
    -   linguaggi formali
    -   teoria degli automi
    -   sistemi di transizione
    -   algebra dei dati
    -   algebra dei processi
        -   esecuzione concorrente
    -   algebra relazionale
        -   basi di dati
    -   semantica dei linguaggi di programmazione
    -   teoria dei tipi
    -   analisi statica
        -   Data Flow
        -   Control Flow
        -   Abstract Interpretation

L'utilitá é l'analisi matematica che dimostri la robustezza e la correttezza della progettazione hardware e software

-   Tool:
    -   Infer
    -   Key
    -   Viper


#### Il Problema della Verifica {#il-problema-della-verifica}

-   In:
    -   descrizione di un sistema
    -   specifica del suo comportamento o sua proprietá
-   Out:
    -   evidenza del fatto che il sistema soddisfa la specifica
    -   controesempio che non funziona

<!--list-separator-->

-  Semantica Operazionale

    Definisce il significato di un programma come il suo comportamento che, quando termina, trasforma uno stato in un altro

<!--list-separator-->

-  Semantica Logica

    Pre e Post condizioni che un programma soddisfa

    -   Floyd
        -   metodo delle asserzioni - 1967
            -   controllo del flusso di grafi che descrivono le aspettative sullo stato della memoria
    -   Hoare
        -   formalizza le idee di Floyd
        -   Logica di Hoare
            -   \\(\\{\varphi\\} P \\{\psi\\}\\)
                -   in P out

<!--list-separator-->

-  Verifica Statica

    Il programma non viene eseguito - statico
    Il testing é fatto sull'esecuzione - dinamico

    -   l'importante é la scelta degli esempi di testing
        -   G.J.Myers, _The Art of Software Testing_
    -   essendo i test **infiniti** il superamento di qualsiasi test non verifica il programma
        -   é un metodo di ricerca degli errori, non di verifica

    Processo:

    1.  Contratto
    2.  Invariante di Loop
        -   esistono euristiche per trovarlo ma non algoritmi
    3.  Asserzioni Intermedie
        -   conducono alla dimostrazione di ció che voglio

<!--list-separator-->

-  Logica di Hoare

    `HL`
    Usiamo logica debole, <span class="underline">non dimostriamo la terminazione</span>. Se il programma termina allora é il risultato sará corretto.

    -   Rules:
        -   skip
        -   assignments
        -   sequencing
        -   conditionals
        -   while loops
        -   consequence

    <!--list-separator-->

    -  Correttezza di HL

        Teorema: Se la tripla é derivabile in HL, allora é valida

    <!--list-separator-->

    -  Limiti teorici

        La logica del primo ordine é corretta e completa ma é <span class="underline">indecidibile</span>

        -   Teorema di Church
        -   non esiste un algoritmo che verifichi che formula logica sia corretta

        `HL` é corretta, ma <span class="underline">completa solo in senso debole</span>; include FOL dunque é indecidibile

        Allora si utilizzano Truth Assistant, il teorema di `Rice` ci dimostra che i Verificatori non possono esistere.

        -   `Isabelle`
        -   `Coq`
        -   `Agda`
            -   un linguaggio di programmazione funzionale
        -   [VeriFast]({{< relref "verifast.md" >}})
            -   ProofAssistant dedicato a <span class="underline">Separation Logic</span> in C e Java

<!--list-separator-->

-  Separation Logic

    Per trattare linguaggi imperativi con puntatori, gestione dinamica della memoria

    -   si utilizza per _modularizzare_
    -   si guarda una funzione per volta
        -   poi si uniscono i risultati per dimostrare la correttezza totale

    Si estendono le asserzioni con:

    -   \\(s,h \vDash \text{emp}\\)
        -   _empty heap_
    -   \\(s,h \vDash a \rightarrow a'\\)
        -   _singleton heap_
    -   \\(s,h \vDash P \star Q\\)
        -   _separating conjunction_
        -   \\(h\_{1} \uplus h\_{2}\\)

    Le triple \\((c,s,h)\\) sono dette _safe_ se \\((c,s,h)  \not{\rightarrow\_{\*}} \text{error}\\)

    <!--list-separator-->

    -  Frame Rule

        \\[\frac{\\{P\\}\\; c\\; \\{Q\\}}{\\{P \star R\\}\\; c\\; \\{Q\star R\\}}\\]

        -   pre-condizione \\(P\\)
        -   post-condizione \\(Q\\)
        -   contesto \\(R\\)

        Se vale questo allora posso spezzare in moduli il codice e verificare questi sottoinsiemi
        **Lemmi**:

        -   _monotonicitá_
            -   \\((c,s,h) \text{safe} \implies \forall h' \perp h : (c,s,h\uplus h') \text{safe}\\)
            -   \\((c,s,h\_{0}) \rightarrow^{\*} (\text{skip},s',h\_{0}') \implies  \\\ \forall h\_{1} \perp h\_{0}:(c,s,h\_{0} \uplus h\_{1}) \rightarrow^{\*} (\text{skip}, s', h\_{0}' \uplus h\_{1}')\\)
            -   \\((c,s,h\_{0})\\) riduce all'infinito \\(\implies \forall h\_{1} \perp h\_{0} : (c,s,h\_{0} \uplus h\_{1})\\) riduce all'infinito

        -   _frame property_
            -   \\((c,s,h\_{0})\text{safe} \land (c,s,h\_{0} \uplus h\_{1}) \rightarrow^{\*} (\text{skip},s',h') \implies \\\\
                    \exists h\_{0}' \perp h\_{1} :  (c,s,h\_{0})\rightarrow^{\*} (\text{skip},s',h\_{0}')\land h' = h\_{0}' \uplus h\_{1}\\)

    <!--list-separator-->

    -  Heap Simbolici

        \\(H ::= \exists \vec{x} : (P\_{1} \land \cdots \land P\_{n}) \land (S\_{1} \star \cdots \star S\_{m})\\)

        -   \\(\vec{x} = \Cup\_{i} fv(P\_{i}) \cup \Cup\_{j} fv(S\_{j})\\)
        -   _puro_ e _spaziale_

        Dai _comandi atomici_, definiti conseguentemente alle rispettive regole della logica.
        Si eseguono poi  _sequenze atomiche_
        \\[\\{H\\} A\_{1};\cdots ;A\_{n} \\{H'\\}\\]
        \\[\frac{\\{H\\}A\_{1}\\{H''\\} \qquad \\{H''\\} A\_{2} \\{H'\\}}{\\{H\\}A\_{1};A\_{2}\\{H'\\}}\\]
        \\[\frac{H,A\_{1} \implies H'}{H,A\_{1};A\_{2} \implies H',A\_{2}}\\]


### Grammatiche {#grammatiche}


#### Concrete {#concrete}

Descrivo <span class="underline">Grammatiche Senza Contesti</span> con le <span class="underline">Regole di Inferenza</span>

\\[\frac{}{n \in Aexp}\\]
\\[\frac{}{x \in Aexp}\\]
\\[\frac{a\_1\in Aexp \quad a\_2 \in Aexp}{a\_1 +  a\_2 \in Aexp}\\]


#### Astratte {#astratte}

<!--list-separator-->

-  Backus Normal Form

    Utiliziamo la notazione <span class="underline">carrificata</span>

    ```text
    vname ::== String
    aexp ::== N n | V x | Plus aexp aexp | Times aexp aexp
    ```


### Semantica {#semantica}


#### Agda {#agda}

`Set`, insieme o `Tipo`

```text
data aexp: Set nohere
N: N -> aexp
V: String -> aexp
Plus: aexp -> aexp -> aexp

depth: aexp -> N
  depth (Nn) = 0
  depth (Vx) = 0
  depth (Plus a b) = 1 + max (depth a) (depth b)
```

Dim. per induzione strutturale:

```text
depth (Plus a b) <= size (Plus a b)
```

La semantica di \\(a \in aexp\\) é un numero \\(n \in N\\)
Per def il valore di \\(V x\\) usiamo gli stati

-   \\(s \in state = vname \rightarrow val\\)

<!--listend-->

```text
aval: aexp -> state -> val
  aval (N n) s = n
  aval (V x) s = sx
  aval (Plus a_1 a_2) s = (aval a_1 s) + (aval a_2 s)
```

\\(FVa\\): l'insieme delle variabili libere in \\(a \in aexp\\)

```text
  FV (N n) = nil
  FV (V x) = { n }
  FV (Plus a_1 a_2) = (FVa_1) U (FVa_2)
```

<!--list-separator-->

-  Lemma FVa

    Se per ogni \\(x \in FVa\\) gli stati \\(s, s^{'} \mid sx = s^{'}x\\)
    allora \\(aval \\: as = aval \\: as^{'}\\)

    -   dim su ind. strutturale su \\(a\\)


#### Sostituzione {#sostituzione}

\\(a[a^{'}/x]\\) intendiama la <span class="underline">sostituzione di x con a' in a</span>

```text
  (N n)[a'/x] = N n
  (V x)[a'/x] = a'
  (V y)[a'/x] = V y
  (Plus a_1 a_2)[a'/x] = Plus a_1[a'/x] a_2[a'/x]
```

**Modifica delle variabili**
Se \\(s\in state, x\in vname, n \in val \mid s[x \rightarrow n] \in state\\)

<!--list-separator-->

-  Lemma di Sostituzione

    \\[aval \\: (a[a^{'}/x])s = aval \\: a \\: s [x\rightarrow aval \\: a^{'}\\: s]\\]


#### Booleani {#booleani}

```text
bexp ::= B bval
      | Not bexp | And bexp bexp
      | Less aexp aexp -- a < a'

bval ::= tt | ff
```


#### Comandi {#comandi}

Espressioni generate dalla grammatica (BNF)

**Sintassi**

```text
com ::= SKIP                      -- noop
     |  vname := aexp             -- assegnazione
     |  com ; com                 -- composizione sequenziale
     |  IF bexp THEN com ELSE com -- selezione
     |  WHILE bexp DO com         -- iterazione
```

Con queste caratteristiche il nostro linguaggio `IMP` é Touring completo:

-   <span class="underline">Arbib</span>, _A programming approach to computability_

**Semantica** di `com`

```text
cval : com -> state -> state
```

Se questa funzione esiste deve essere parziale

-   definita solo in alcuni casi

<!--listend-->

```text
cval (WHILE b DO c) s = ??
cval (WHILE b DO c) s = s  -- bval b s = ff
cval (WHILE b DO c) s =    -- bval b s = tt
    = cval (c; WHILE b DO c) s
    = cval (WHILE b DO c) (cval c s)
```

In questo caso la definizione é circolare


#### Semantica Naturale - Big-step {#semantica-naturale-big-step}

Usiamo la relazione \\((c,s) \implies t\\) su \\(com \times state \times state\\)
\\(\iff\\) l'esecuzione di \\(c\\) in \\(s\\) termina in \\(t\\)

\\((c,s,t) \rightarrow (c,s) \implies t \in bool\\)

-   true se in un stato finale, false altrimenti
-   questa funzione é definibile in `Agda`

Sistema formale:
 \\[\frac{(c\_{1},s\_{1}) \implies t\_{1}\cdots (c\_{n},s\_{n})\implies t\_{n}}{(c\_{n+1},s\_{n+1})\implies t\_{n+1}}\\]

<!--list-separator-->

-  Regole

    -   `Skip` \\[\frac{}{(SKIP,s)\implies s}\\]
    -   `Ass` \\[\frac{aval \\: a \\: s = n}{(n:= a,s)\implies s[x\rightarrow n]\\]
    -   `Comp`  \\[frac{(c\_{1},s)\implies s' \quad (c\_{2},s')\implies t}{(c\_{1};c\_{2},s)\implies t}\\]

    `IF b THEN c_1 ELSE c_2`

    -   \\[\frac{bval \\: b\\: s = tt \\:\\: (c\_{1},s)\implies t }{(IF \\: b \\: THEN  \\: c\_{1} \\: ELSE \\:c\_{2},s)}\\]
    -   \\[\frac{bval \\: b\\: s = ff \\:\\: (c\_{2},s)\implies t }{(IF \\: b \\: THEN  \\: c\_{1} \\: ELSE \\:c\_{2},s)}\\]

    `WHILE`

    -   \\[\frac{ bval \\: b\\: s = ff}{(WHILE \\: b\\:DO \\: c, s)\implies s}\\]
    -   \\[\frac{ bval \\: b\\: s = tt \\:\\: (c,s)\implies s^{'} \\:\\: (W,s^{'})\implies t}{(WHILE \\: b\\:DO \\: c, s)\implies t}\\]
        -   \\(W\\) abbrevia \\((WHILE \\: b \\: DO \\: c, s)\implies t\\)

    Con queste si studia la **convergenza**

    <!--list-separator-->

    -  Proposizione SKIP

        \\(\forall s,t \nvdash (WHILE \\: true \\: DO \\: SKIP,s) \Rightarrow t\\)
        <span class="underline">Dim</span>

        -   per assurdo sia \\(D\\) una dimostrazione (_derivazione chiusa_) t.c. la sua conclusione sia  \\((WHILE \\: true \\: DO \\: SKIP,s) \Rightarrow t\\)
        -   poiché `bval true s = tt` per ogni `s`, `D` deve terminare con:
            -   \\(\frac{(SKIP,s)\Rightarrow s^{'} \\:\\: (W,s^{'})\Rightarrow t}{(W,s)\Rightarrow t}\\)
            -   ma `s'=s` per SKIP, dunque la des. `D'` ha la stessa forma di `D`, essendo propriamente inclusa in `D`, cioé é infinita
        -   dunque `D` non é una dimostrazione

    <!--list-separator-->

    -  Equivalenza di Programmi

        I comandi \\(c\_{1},c\_{2}\\) sono <span class="underline">equivalenti</span> [\\(c\_{1} \sim c\_{2}\\)]

        -   \\(\forall s,t \in state . (c\_{1},s)\Rightarrow t \iff (c\_{2},s)\Rightarrow t\\)

        **Lemma**
        `WHILE b DO c ~ IF b THEN (c;WHILE b DO c) ELSE SKIP`

    <!--list-separator-->

    -  Determinismo della semantica naturale

        **Teorema**:

        -   Per ogni \\(c \in com\\) , per ogni \\(st,,t' \in state\\)
        -   \\((c,s)\Rightarrow t \land (c,s)\Rightarrow t^{'} \implies t=t^{'}\\)

    <!--list-separator-->

    -  Funzione parziale

        \\([\\![ \cdot ]\\!]: com \rightarrow state \rightharpoonup state\\)
        \\([\\![c]\\!]s = \begin{cases}t & \mbox{se} \vdash (c,s) \Rightarrow t\\\\perp & \mbox{altrimenti}\end{cases}\\)


#### Semantica SOS - Small Step {#semantica-sos-small-step}

Singolo <span class="underline">passo di calcolo</span>
\\((c,s) \rightarrow (c^{'},s^{'})\\)

-   **Lemma - determinismo**
    -   \\((c,s)\rightarrow(c^{'},s^{'}) \land (c,s)\rightarrow(c^{''},s^{''}) \implies c^{'}=c^{''}\land s^{'}=s^{''}\\)
-   **Corollario**
    -   \\((c,s)\\) <span class="underline">termina</span> se \\(\exists t \mid (c,s) \rightarrow^{\*}(\textsc{skip},t)\\), <span class="underline">cicla</span> se esiste una sequenza infinita
-   `Assegnazione`
    -   \\((x := a,s) \rightarrow (\textsc{skip}, s[x \mapsto aval \\: as])\\)
-   `SKIP`
    -   \\((\textsc{skip};c,s) \rightarrow (c,s)\\)
-   `IF`
    -   \\[\frac{bval \\: b \\: s = tt}{(\textsc{if}\\: b\\: \textsc{then}\\:c\_{1}\\: \textsc{else}\\: c\_{2},s)\rightarrow (c\_{1},s)}\\]
    -   \\(ff\\) speculare
-   `WHILE`
    -   $(\textsc{while}\\; b\\: \textsc{do}\\: c,s) &rarr;

(\textsc{if}\\: b\\: \textsc{then}\\; (c;\\: \textsc{while}\\; b\\: \textsc{do}\\: c)\\: \textsc{else}\\; \textsc{skip}, s$

\\([\\![c]\\!]\_{\textsc{sos}}s = \begin{cases}t & \mbox{se} \vdash (c,s) \rightarrow^{\*}(\textsc{skip},t)\\\\perp & \mbox{se}\\:(c,s)\\:\mbox{cicla}\end{cases}\\)

-   **Teorema di equivalenza delle Semantiche**

\\(\forall c\in \mbox{com}\\: \forall s,t\in\mbox{state}\mid[\\![c]\\!]\_{\textsc{nat}}s=[\\![c]\\!]\_{\textsc{sos}}s\\)


### Teoria dei Tipi {#teoria-dei-tipi}

[file Agda](~/Code/Agda/quantifiers.agda)

Il quantificatore universale si traduce, nella teoria dei tipi dipendenti, in

\\[\frac{A : \text{Set} \qquad x : A \vdash B[x] : \text{Set}}{\pi[x : A] B[x] : \text{Set}}\\]
dove

\\(\pi [x:A] \\: B[x] \equiv B[a\_{1}] \times B[a\_{2}] \times \cdots\\) per \\(a\_{i}\in A\\)
corrisponde a
\\(\forall x \\: . \\: B[x] \iff B[a\_{1}] \land B[a\_{2}] \land \cdots\\)

Il \\(\pi\\) sta per il concetto di indicizzazione:

-   forma famiglie secondo i suoi indici

\\(\forall (\lambda \\: x \\: \rightarrow B\\: x): \text{Set}\\)

-   il quantificatore é un operatore che viene applicata al lambda


### Logica Classica e Intuizionistica {#logica-classica-e-intuizionistica}

-   [Wadler](https://plfa.github.io/Negation/)

> In Gilbert and Sullivan’s The Gondoliers, Casilda is told that as an infant she was married to the heir of the King of Batavia, but that due to a mix-up no one knows which of two individuals, Marco or Giuseppe, is the heir. Alarmed, she wails “Then do you mean to say that I am married to one of two gondoliers, but it is impossible to say which?” To which the response is “Without any doubt of any kind whatever.”
>
> Logic comes in many varieties, and one distinction is between classical and intuitionistic. Intuitionists, concerned by assumptions made by some logicians about the nature of infinity, insist upon a constructionist notion of truth. In particular, they insist that a proof of A ⊎ B must show which of A or B holds, and hence they would reject the claim that Casilda is married to Marco or Giuseppe until one of the two was identified as her husband. Perhaps Gilbert and Sullivan anticipated intuitionism, for their story’s outcome is that the heir turns out to be a third individual, Luiz, with whom Casilda is, conveniently, already in love.
>
> Intuitionists also reject the law of the excluded middle, which asserts A ⊎ ¬ A for every A, since the law gives no clue as to which of A or ¬ A holds. Heyting formalised a variant of Hilbert’s classical logic that captures the intuitionistic notion of provability. In particular, the law of the excluded middle is provable in Hilbert’s logic, but not in Heyting’s. Further, if the law of the excluded middle is added as an axiom to Heyting’s logic, then it becomes equivalent to Hilbert’s. Kolmogorov showed the two logics were closely related: he gave a double-negation translation, such that a formula is provable in classical logic if and only if its translation is provable in intuitionistic logic.
>
> Propositions as Types was first formulated for intuitionistic logic. It is a perfect fit, because in the intuitionist interpretation the formula A ⊎ B is provable exactly when one exhibits either a proof of A or a proof of B, so the type corresponding to disjunction is a disjoint sum.
>
> (Parts of the above are adopted from “Propositions as Types”, Philip Wadler, Communications of the ACM, December 2015.) ~ [Philip Wadler]({{< relref "20210921122848-philip_wadler.md" >}}) [#cit]({{< relref "20210604132601-cit.md" >}})

-   [Propositions as Types]({{< relref "propositions_as_types.md" >}}) è un paradigma che pone le proposizioni e tipi come equivalenti.
    -   in [Type Theory]({{< relref "type_theory.md" >}})
    -   una proposizione è identificata come il tipo (collezione) delle sue prove
    -   un tipo è identificato come la proposizione che contiene i suoi termini


#### Semantica di Heyting {#semantica-di-heyting}

\\[\frac{B[t]}{\exists x \\: . \\: B[x]}\\]
\\[\langle t, M \rangle \\: : \exists x \\: . \\: B[x]\\] dove \\[M\\: :\\: B[t]\\]


### IMP {#imp}

[Definizione in Agda](~/Code/Agda/IMP.agda)


#### Estensione Puntatori {#estensione-puntatori}

`com ::= ...`
`| x := cons(a_1,...,a_2)` _allocation_
`| n := [a]` _lookup_
`| [a] := a'` _mutation_
`| dispose(a)` _deallocation_

la notazione `[a]` richiama il concetto di heap come array, dove `a` ne é l'indice

<!--list-separator-->

-  Semantica

    `store = var_name -> Val`
    `heap = loc -> Val`

    Per \\(h \in \text{heap}, n\ge 0\\)

    -   \\(h = \\{l\_{1} \rightarrow v\_{1} \cdots  l\_{n} \rightarrow v\_{n}\\}\\)
    -   \\(\text{dom}(h | {l\_{1}\cdots l\_{n}})\\)
        -   le locazioni allocate

    Viene aggiunta alla semantica `SOS` lo heap `h`

    <!--list-separator-->

    -  Indipendenza dello Heap

        \\(h\_{1} \perp h\_{2} \iff \text{dom}(h\_{1}) \cap \text{dom}(h\_{2}) = \emptyset\\)


#### Semantica Operazionale {#semantica-operazionale}

[File Agda](~/Code/Agda/IMP-Op.agda)


#### StackMachine {#stackmachine}

Basato su <~/Code/Agda/C-List.agda>

-   [Source](~/Code/Agda/StackMachine.agda)


#### Compilatore {#compilatore}

[Nipkow]({{< relref "20211124235352-nipkow.md" >}}), cap. 8

Linguaggio `IMP` \\(\longrightarrow\\) istruzioni di una macchina astratta

-   c : com \\(\mapsto\\) p : prog
    -   \\((c,s) \Rightarrow t\\)
        -   correttezza \\(\Rightarrow\\)
        -   completezza \\(\Leftarrow\\)
    -   \\(p \vdash (0,s,[\\:]) \rightarrow^\* (\text{size }p,t,[\\:])\\)
        -   program counter
        -   memoria
        -   stack

instr

-   `LOADI int`
-   `LOAD vname`
-   `ADD`
-   `STORE vname`
-   `JMP int`
-   `JMPLESS int`
-   `JMPGE int`

Si definisce `lookup i P` dove \\(0 \le i < \text{size} P\\)

-   in `Agda` le funzioni parziali non sono ammesse e quindi questo va adattato

\\[\frac{0 \le i < \text{size }P \quad \text{iexec }(\text{lookup }i\\; P)(i,s,stk) \equiv (i',s',stk')}{P\vdash (i,s,stk) \rightarrow (i',s',stk')}\\]

Un singolo passo di esecuzione (programma \\(P\\) esegue dalla configurazione \\(c\\) a \\(c'\\))
\\(P \vdash c \rightarrow c'\\)

<!--list-separator-->

-  bcomp

    \\(bcomp :: bexp \Rightarrow bool \Rightarrow int \Rightarrow prog\\)

    \begin{align\*}
    bcomp\\;(Bc\\;v)\\;f\\;n &= (if\\;v=f\\;then\\;[\textsc{jmp}\\;n]\\;else\\;[\\:]) \\\\
    bcomp\\;(Not\\;b)\\;f\\;n &= bcomp\\;b\\;(\lnot f)\\;n \\\\
    bcomp\\;(And\\;b\_1\\;b\_2)\\;f\\;n &= \\\\
    \end{align\*}

    \begin{align\*}
    bcomp\\;(Less\\;a\_1\\;a\_2)\\;f\\;n =& acomp\\;a\_1\\;@\\;acomp\\;a\_2\\;@\\;( \\\\
    & if\\;f\\;then\\;[\textsc{jmpless}\\;n]\\;\\\\
    & else\\;[\textsc{jmpge}\\;n])
    \end{align\*}

    `Lemma 8.8`
    Si definisce il program counter sui salti condizionali:

    -   \\(\text{pc'} = \text{size }(\text{bcomp }b \\:f \\:n) + (\text{ if } f = \text{ bval } b\\: s \text{ then } n \text{ else } 0 )\\)
