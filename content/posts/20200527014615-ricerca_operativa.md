+++
title = "Ricerca Operativa"
tags = ["university"]
draft = false
+++

## Programmi Lineari {#programmi-lineari}

-   max z = c1x1 + c2x1

soggetto a:

-   ai1x1 + ai2x2 &lt;\\=\\&gt; bi  con i = 1,2,...,m

due variabili di decisione
risolvibile graficamente

-   rappresentare in R^2 la regione ammissibile Sa
-   studiare le rette isocosto/isoprofitto
    z = c1x1 + c2x2


### Forma standard {#forma-standard}

-   massimizzazione
    -   min --&gt; max cambiando il segno
-   variabili tutte positive
    -   si crea la corrispondente variabile xj = -`xj`, `xj` &gt;= 0
-   vincoli sono equivalenze
    -   variabili di slack e surplus


### Insiemi convessi {#insiemi-convessi}

u,v appartenenti  a R^n con a appartenente a [0,1]
    x = v + a(u-v)
      = a\*u + (1-a)v

x `combinazione lineare convessa` di u e v

Insieme S sottoinsieme di R^n e' `convesso` se per ogni coppia u,v appartenenti a S tutte le combinazioni lineari convesse sono elementi di S

S convesso, x appartente a S e' `vertice` se non esistono u,v appartenenti a S tali che u!=v e x e' combinazione lineare convessa di u,v
    x vertice se non esistono u,v t.c   `x = 1/2u + 1/2v`

se un programma lineare ammette soluzioni ottime almeno una di esse e vertice di Sa: [Teorema Fondamentale della Programmazione Lineare](#teorema-fondamentale-della-programmazione-lineare)

x e' vertice di Sa se e solo se le colonne di A in { Aj: xj &gt; 0 } sono linermente indipendenti

Una Base e' un insieme { xj1,xj2,...,xjm } dette variabili di base tali che:
    le colonne Aj1,...,Ajm formano una base dello spazio generato dalle colonne di A


### Soluzioni di Base {#soluzioni-di-base}

del sistema Ax = b
unica soluzione `x = x(B)` che ha xn = 0


### Teorema Fondamentale della Programmazione Lineare {#teorema-fondamentale-della-programmazione-lineare}

se il programma lineare
-max{ z = c^Tx : Ax = b, x &gt;= 0 }
    ammette soluzioni ottime, allora almeno una di esse e' vertice di Sa


## Algoritmo del Simplesso {#algoritmo-del-simplesso}

B base ammissibile
x(B) soluzione ammissibile di base associata a B

se almeno una delle componenti di xj(B) e' nulla la base B e' detta degenere

-   Criteri
    -   di ottimalita'
    -   costo ridotto
    -   condizione sufficiente affinche x(B) sia ottima e' che risulti che rj &lt;=0 per ogni variabile xj fuori base
-   di illimitatezza
    -   la riformulazione dei parametri della x fuori base entrante (r &gt; 0) e' una colonna negativa


## Politopi {#politopi}

`Sa`, regione ammissibile e' in generale
intersezione di `iperpiani` e `semispazi`

-   Iperpiano: definito da un punto x0 e un vettore v
    costituito dai punti x t.c. il vettore (x - x0) e' ortogonale a v
    (equazioni: vx = a)
-   Semispazio: definito a partire da un iperpiano e da un vettore
    costituito dai punti x t.c (x - x0) non forma un angolo superiore ai 90gradi con v
    (disequazioni: vx &gt; a)

-   un insieme convesso
    -   in particolare un `Poliedro convesso`
    -   se limitato e' chiamato `Politopo`
    -   un Politopo avra' sempre almeno una soluzione che sara' un vertice


## Combinazioni Lineari {#combinazioni-lineari}

-   S = { v1, v2, ... vk } sottoinsieme di R^n
    detto insieme libero
    Vale che

    -   il vettore nullo non appartiene a S
    -   se S' sottoinsieme di S allora S' e insieme libero
    -   se S1 e S2 liberi la loro intersezione e' un insieme libero

    Equivalentemente

    -   x1v1 + ... + xkvk = 0 ==&gt; x1 = ... = xk = 0
    -   vettore0 non appartiene a S e nessun vj risulta appartenere a L(S\vj)
    -   ogni w appartenente a L(S) si esprime come unica combinazione lineare con coefficienti xj unicamente determinati

-   w appartenente ad R^n e' combinazione lineare dei vettori di S se


#### esistono x1,x2,xk t.c. {#esistono-x1-x2-xk-t-dot-c-dot}

w = x1v1 + x2v2 + ... + xkvk

-   I vettori di S sono detti linearmente indipendenti se
    x1v1 + x2v2 ... = 0 ==&gt; x1 = x2 = ... = 0
    -   l'unico modo per combinare linermente i vettori di S nel vettore nullo e' di usare coefficienti tutti nulli


## Gauss Jordan {#gauss-jordan}

-   Matrice: As
    -   L(S) e' lo spazio delle colonne di As
        la sua dimensione e' detta rango di A: p(A)
    -   corrisponde al numero di equazioni non ridondanti/contraddittorie di ogni sistema Ax=b


### Proprieta' {#proprieta}

-   le soluzioni non cambiano se
    -   due equazioni vengono permutate:                 Ep &lt;-&gt; Eq
    -   una equazione Ep e' sostituita:                  Ep &lt;-- k\*Ep
    -   una equazione Eq e' sostituita:                  Eq &lt;-- Eq + k\*Ep


## Sottospazi {#sottospazi}

-   V = L(S)
-   somma vettoriale e prodotto di numero-vettore sono interne a V
-   L(S) e' un sottospazio di R^n
-   S e' detto insieme generatore di V
-   elementi di S detti generatori

<!--listend-->

-   Uno spazio ha infiniti possibili generatori

    S = { v1,v2, ... ,vk } S' = { v2, ... ,vk }

    -   L(S') sottoinsieme di L(S)
    -   se v1 e' combinazione lineare di S' allora L(S)=L(S')


### Basi {#basi}

Un insieme generatore di un sottospazio v e' detto base se e solo se e' anche un insieme libero

<!--list-separator-->

-  tutte le infinite basi di V hanno la stessa cardinalita'

    <!--list-separator-->

    -  detta dimensione di V

        dimostrabile per il metodo degli scarti successivi
