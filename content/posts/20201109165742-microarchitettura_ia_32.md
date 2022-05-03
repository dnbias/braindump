+++
title = "IA-32"
author = ["Daniel Biasiotto"]
draft = false
+++

[Microarchitecture]({{< relref "20201109165841-microarchitecture.md" >}})


## Intel {#intel}


### 80386 {#80386}

`1985`
Introduzione della microarchitettura/instruction set IA-32

-   Primo processore a 32 bit
    -   capace di indirizzare 4GB di memoria


### Pentium {#pentium}

`1995`
Ultimo ad usare la microarchitettura IA-32
Sostituita poi da

-   p6
-   NetBurst

L'instruction set fu mantenuto fino al Pentium 4


## Paginazione {#paginazione}

a 2 livelli
Pagine di 4MB per paginazione ad un livello
Pagine di 4KB per paginazione a due livelli

-   32 bit
    -   10 - p1
        -   directory delle pagine
        -   registro CR3
            -   indirizzo di partenza della directory corrente
            -   attiva al context switch la tabella del processo in Running
    -   10 - p2
        -   tabella delle pagine
    -   12 - d