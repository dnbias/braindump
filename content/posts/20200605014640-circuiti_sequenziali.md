+++
title = "Circuiti Sequenziali"
author = ["Daniel Biasiotto"]
draft = false
+++

## Tabelle di transizione {#tabelle-di-transizione}


## Grafo di transizione {#grafo-di-transizione}


## macchina M = &lt; A , B , Q , o , s &gt; {#macchina-m-a-b-q-o-s}


### Dove: {#dove}

-   A input
-   Q stato
-   B output
-   o funzione di output
-   s funzione di stato

Le `transizioni~` sono scandite da un Clock


### o : {#o}


#### Macchina di Mealy {#macchina-di-mealy}

A x Q --&gt; B


#### Macchina di Moore {#macchina-di-moore}

Q --&gt; B


### s : {#s}

A x Q --&gt; Q


## Latch {#latch}

-   ingresso i
-   controllo b
-   uscita o
-   stato s

Quando b = 1 store:   s' =  i
Quando b = 0 hold:  s' =  s


### Latch SR {#latch-sr}

-   INPUT

    S, R

-   OUTPUT

    Q, NOT(Q)

Lo stato S=R=1 e' `instabile`


### Latch D sincronizzato {#latch-d-sincronizzato}

-   INPUT

    D, CK

-   OUTPUT

    Q, NOT(Q)

Risolve l'ambiguita' dello stato S=R=1
Il latch e' `trasparente` in quanto la sua uscita rappresenta il suo stato istante per istante


#### Campionamento {#campionamento}

Memorizzo il contenuto di D solo al livello alto del clock

-   cosi' mi assicuro che D sia `stabile` quando vado a campionare


## Flip-FLop {#flip-flop}

[CK   AND  NOT(CK)]

-   In quanto l'invertitore comporta un `ritardo` il campionamento avverra' solo quando il risultato sara' alto, quindi al `fronte di clock`

    -   qui si sovrappongono CK e NOT(CK)

    Perde la trasparenza del latch
