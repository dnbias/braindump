+++
title = "Architettura Elaboratori"
author = ["Daniel Biasiotto"]
draft = false
+++

PROF: `Cattuto`


## Logica di Boole {#logica-di-boole}

AND ha precedenza su OR

-   +

Leggi di DeMorgan

Una funzione booleana associa un valore boolean a ciascuna delle 2^n configurazioni
A partire da una tabella di verita' o Binary Decision Diagrams:

-   FND
    Formula Normale Disgiuntiva
    Quindi somme tra prodotti di lettere
-   FNC
    Formula Normale Congiuntiva
    Quindi Produttoria tra sommatorie di lettere


## Aritmetica Binaria {#aritmetica-binaria}


### Numeri in basi diverse e conversioni {#numeri-in-basi-diverse-e-conversioni}


### Binario {#binario}


#### Modulo e segno {#modulo-e-segno}

-   Riserva il bit piu' significativo per il segno e rappresenta normalmente il numero binario come modulo sui bit rimanenti
-   Anche qui abbiamo +0 e -0


#### Eccesso 2^n {#eccesso-2-n}


#### Complemento a 1 {#complemento-a-1}

Intervallo di rappresentazione: [-2^n+1,2^n-1]
ha una doppia rappresentazione per lo 0: tutti 0 o tutti 1

-   Positivi
    numero binario
-   Negativi
    numero binario invertito


#### Complemento a 2 {#complemento-a-2}

Intervallo di rappresentazione: [2^n,2^n-1]
rispetto al C1 risolve la doppia rappresentazione per lo 0

-   Positivi
    numero binario
-   Negativi
    numero binario invertito + 1


#### Standard IEEE 754 {#standard-ieee-754}

{{< figure src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Float_example.svg/590px-Float_example.svg.png" >}}

Sviluppato nel 1985
`~~~~~~~~~~~~~~~~~`
Standard per la rappresentazione in float point/virgola mobile

-   `Precisioni`
    -   Singola 32bit
    -   Doppia 64bit
    -   Estesa 128bit
-   `Esponente`
    -   calcolato in eccesso 127
-   `Mantissa`
    -   valore `normalizzato` (1,... la parte intera e' sottointesa)

Ci sono dei valori speciali che indicano dei particolari stati

-   Non Normalizzato
    0 esponente, mantissa != 0
-   0
    0 esponente, 0 mantissa
-   Infinito
    1111... esponente, 0 mantissa
-   Not A Number
    1111... esponente, mantissa != 0

Questo in quanto i reali allo la `potenza dell'infinito`: avremo aree non rappresentabili di under e over flow e anche numeri non rappresentabili perche' tra due numeri rappresentabili, allora si effettura' una stima.

| Segno | Esponente | Mantissa | (Precisione Singola) |
|-------|-----------|----------|----------------------|
| 1     | 8         | 23       | Numero di Bit        |


#### Codifiche {#codifiche}

<!--list-separator-->

-  Caratteri

    <!--list-separator-->

    -  ASCII

    <!--list-separator-->

    -  UNICODE

    <!--list-separator-->

    -  UTF-8

<!--list-separator-->

-  Suoni e Immagini

    `Campionamento del segnale`

    <!--list-separator-->

    -  discretizzando colori nello spazio

    <!--list-separator-->

    -  discretizzando suoni nel tempo


## Livelli di Architettura di un Elaboratore {#livelli-di-architettura-di-un-elaboratore}

I livelli sono astrazioni che permettono lo sviluppo di software ad alto livello

-   un `compilatore` puo' ottimizzare ma solo per una CPU e non agisce istruzione per istruzione in runtime
-   il passaggio da un livello all'altro e' possibile con l'`interpretazione` (instruzione per istruzione)
    -   `NB` Java e' una soluzione mista:
        -   Compilatore --&gt; bytecode JVM --&gt; Interprete specifico

I livelli sono:


### 0 - Logico digitale {#0-logico-digitale}

-   porte
-   memorie

<!--list-separator-->

-  Circuiti Digitali

    Elemento base: `Transistor`

    -   1 -&gt; il transistor di comporta come una resistenza infinita
    -   0 -&gt; il transistor si comporta come un filo

    2 transistor in serie implementano un NAND
    2 transistor in parallelo implementano un NOR
    1 implementa un invertitore
    8 implementano uno XOR

    -   I `Circuiti Integrati` o chip (IC)
        -   SSI
            small scale integrated
        -   MSI
        -   LSI
        -   VLSI

    <!--list-separator-->

    -  [Circuiti Combinatori]({{< relref "20200605013212-circuiti_combinatori.md" >}})

        Dipendono da una `funzione` d'entrata

        -   L'output dipende solo dall'input

    <!--list-separator-->

    -  [Circuiti Sequenziali]({{< relref "20200605014640-circuiti_sequenziali.md" >}})

        Dipendono da una `funzione` d'entrata e da uno `stato`

    <!--list-separator-->

    -  Registri

        flip-flop dipo D temporizzati indirizzati attraverso decoder o bit di attivazione

        -   CS - Chip Select
        -   RD - Read
        -   OE - Output Enabled

        Organizzati a indirizzi di n parole da m bit

        le uscite degli indirizzi passano per un multiplexer che passa il dato voluto in uscita

        Possiedono un controllo prima dell'uscita: registro con buffer (3 stati: 0,1, scollegato)

    <!--list-separator-->

    -  Memorie

        Insieme di celle, ampiezza di parola 1B/4B/8B

        Ordinamento:

        -   Litle endian
            -   Little End First, sx &lt;-- dx
        -   Bin endian
            -   Big End First, sx --&gt; dx
            -   Static RAM
                -   veloci
                -   poca memoria
                -   flip-flop tipo d

            -   Dynamic RAM
                -   lente
                -   grandi capacita'
                -   transistor con condensatori

            -   ROM
                -   sola lettura

    <!--list-separator-->

    -  Bus

        linee di

        -   controllo
            -   evitano che i dispositivi accedano allo stesso momento al Bus
        -   dati
        -   indirizzi

        La larghezza del bus dipende dall'architettura, in Mic-1 si tratta di Bus da 32 bit

        Tipi di Bus

        -   Sistema
        -   Interni alla CPU
        -   SCSI
            esterni

        La CPU comunica con la cache e la memoria in caso di Miss (vedi `Principio di Localita' del Codice`)

        I dispositivi possone essere:

        -   attivi | master
        -   passivi | slave

        o entrambi (CPU): transceiver

        Principi di progettazione:

        -   larghezza
        -   arbitraggio
        -   funzionamento
            -   multiplexed bus
            -   bus sincrono o asincrono
                1.  Sincrono
                    -   ogni operazione ha durata conosciuta
                        -   interi di ciclo
                    -   semplice realizzare uno slave
                    -   la sua velocita' dipende dal dispositivo piu' lento
                2.  Asincrono
                    -   la velocita' dipende esclusivamente dalla coppia master-slave
                    -   ogni operazione ha la durata strettamente necessaria
                    -   e' necessario implementare una full-handshake per la sincronizzazione di slave e master
                        -   4 segnali di controllo


### 1 - Microarchitettura {#1-microarchitettura}

[Microarchitecture]({{< relref "20201109165841-microarchitecture.md" >}})

-   ALU
-   Microprogramma

<!--list-separator-->

-  [Mic-1]({{< relref "20200530052847-mic_1.md" >}})

    composto da:

    -   Data Path
    -   Control Unit


### 2 - Instruction Set Architecture : [ISA]({{< relref "20200531012943-isa.md" >}}) {#2-instruction-set-architecture-isa--20200531012943-isa-dot-md}

-   linguaggio macchina
    -   opcode


### 3 - Sistema Operativo {#3-sistema-operativo}

-   linguaggio ISA
-   Input/Output
-   gestisce i processi


### 4 - Assembly {#4-assembly}

-   Istruzioni simboliche


### 5 - Linguaggio {#5-linguaggio}