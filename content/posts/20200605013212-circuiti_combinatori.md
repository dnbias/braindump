+++
title = "Circuiti Combinatori"
author = ["Daniel Biasiotto"]
draft = false
+++

## Decoder {#decoder}

Funzione di `indirizzamento`

-   INPUT

    n

-   OUTPUT

    2^n


## Multiplexer {#multiplexer}

Puo' implementare una qualsiasi `funzione n-aria`, esiste anche un `Demultiplexer`

-   INPUT

    2^n

-   Controllo

    n

-   OUTPUT

    1


## Comparatori {#comparatori}

-   INPUT

    due serie da n bit l'una

-   OUTPUT

    1 se uguali
    0 se diversi

-   Implementazione

    NOR(In1 XOR In2)


## Shifter {#shifter}

Implementa la moltiplicazione binaria

-   INPUT

    n bit

-   OUTPUT

    n bit &lt;&lt; o &gt;&gt; di 1 bit

-   Controllo

    Determina la direzione dello shift


## Adder {#adder}

Implementa la somma
half-adder e riporto/carry --&gt; full-adder


## [ALU]({{< relref "20200530050045-alu.md" >}}) {#alu--20200530050045-alu-dot-md}


## 1 Linked References {#1-linked-references}


### [C ➦]({{< relref "20200929150429-c.md" >}}) {#c--20200929150429-c-dot-md}

1.  Digital Logic