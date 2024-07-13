+++
title = "Ottimizzazione Combinatoria"
author = ["Daniel Biasiotto"]
date = 2024-04-09T15:49:00+02:00
tags = ["master", "university"]
draft = false
+++

## Metodo dei tagli di Gomory {#metodo-dei-tagli-di-gomory}

-   convex hull (inviluppo convesso)
    -   poliedro a n dimensioni
    -   politopo (poliedro)
    -   il più piccolo insieme convesso contenente \\(S\\)
-   è sempre possibile definirlo ma può essere computazionalmente complesso
-   **disugualianze valide**
    -   dominata se coefficienti primi \\(\ge\\) e termine noto primo \\(\le\\)
-   il convex hull può essere descritto dall'insieme di tutte le disugualianze valide non dominate di \\(Z\_a\\)
    -   il numero di disugualianze può essere esponenziale e quindi non trattabile
    -   si può cercare di delimitare il convex hull incrementalmente con disugualianze valide per \\(Z\_a\\) ma non \\(S\_a\\)
-   il metodo di Gomory agisce prendendo il floor dei coefficienti creando disugualianze valide partendo da \\(S\_a\\) per \\(Z\_a\\)
-   si prova che aggiungendo questi tagli in un numero finito di passi si trova una soluzione intera o si raggiunge la condizione di assenza di soluzioni intere
-   attualmente si integra il branch and bound con il metodo di gomory
    -   _branch and cut_


## Grafi e Strutture Dati {#grafi-e-strutture-dati}

Ricerca:

-   `DFS`
    -   iterativamente con una pila
-   `BFS`
    -   con una coda

Lineari nel numero di nodi e archi

-   per grafi connessi il numero massimo di archi è \\(n\\)


### Proprietà topologiche {#proprietà-topologiche}

-   forte connessione di un grafo orientato
-   albero di copertura del grafo attraverso l'analisi dell'albero di copertura
-   componenti connesse
    -   uso iterativo di `DFS` per marcare l'appartenenza di un nodo alla corrispondente componente connessa

-   la partizione di archi nell'albero di copertura è utile per ottenere algoritmi efficienti che individuano proprietà topologiche
    -   grafo aciclico
    -   certificare l'esistenza di un cammino


## Cammini Minimi {#cammini-minimi}

-   _Shortest Path Tree_ (`SPT`)
    -   si rappresenta la soluzione \\(T\\) come albero dei padri (predecessori)
        -   inizializzato a un albero fittizio con tutti i nodi figli della radice
        -   etichette inizializzate a valore molto alto
-   **condizioni di Bellman**
    -   caratterizzazione matematica della soluzione
    -   algoritmicamente si selezionano archi che violano le c. di B. e quindi migliora l'etichetta di distanza del cammino
-   soluzione ammissibile
    -   composta da \\(n-1\\) cammini da \\(r\\) a \\(u\\)
    -   occorre che ogni nodo \\(u\\) sia raggiungibile da \\(r\\)
-   in presenza di cicli di costo negativo non esiste soluzione con ottimo limitato
-   una soluzione ammissibile è un albero di copertura del grafo


### Algoritmi con estrazione del nodo di etichetta minima {#algoritmi-con-estrazione-del-nodo-di-etichetta-minima}

-   Dijkstra
    -   coda di priorità come lista non ordinata
    -   per pesi positivi complessità polinomiale, ogni nodo viene estratto una e una sola volta
    -   complessità \\(O(n^2)\\)
-   Johnson
    -   coda di priorità con uno _heap_
    -   complessità polinomiale similmente a Dijkstra
    -   operatori heap \\(O(\log (n))\\)
    -   complessità \\(O(m \log (n))\\)
-   Bellman-Ford-Moore (`BFM`)
    -   coda come _queue_
        -   logica della visita in ampiezza
    -   complessità polinomiale
    -   \\(O(nm)\\)
-   utilizzando una pila la complessità diventa superpolinomiale
    -   nel caso pessimo l'estrazione di un nodo e l'aggiornamento della sua etichetta determina l'inserimento di tutti i nodi più grandi
-   Pape-D'Esopo
    -   dequeue
        -   _double ended queue_
        -   ogni nodo la prima volta inserito in coda e altrimenti in testa
    -   complessità superpolinomiale
    -   caso di efficienza
        -   uno dei più efficienti su grafi per grafi sparsi e planari
            -   i.e. reti stradali
            -   grafo planare: su un piano gli archi non si incrociano/sovrappongono
-   grafi sparsi e densi:
    -   \\(n = |N|; m = |A|\\)
    -   sparsi \\(m\sim O(n)\\)
        -   Dijkstra ~ \\(O(n^2)\\)
        -   Johnson ~ \\(O(n \log(n))\\)
        -   `BFM` ~ \\(O(n^2)\\)
    -   densi \\(m \sim O(n^2)\\)
        -   Dijkstra ~ \\(O(n^2)\\)
        -   Johnson ~ \\(O(n^2 \log(n))\\)
        -   `BFM` ~ \\(O(n^3)\\)


### Numero minimo di hop {#numero-minimo-di-hop}

-   i.e. il grafo modella una rete di telecomunicazione
    -   router (nodi), passaggio di pacchetti (archi)
-   hop numero di nodi attraversati
    -   numero di archi -1
-   costi fissati a 1
-   distanze come numero minimo di hop
-   condizioni `SPT` rimangono invariate


### Portata massima {#portata-massima}

-   i.e. il grafo modella una rete di telecomunicazione
    -   arco rappresenta la possibilità di trasferire pacchetti
    -   ogni arco ha una portata massima \\(f\_{uv}\\)
-   la portata complessiva del cammino viene limitata da quella minima
-   etichette \\(d\_u\\) massima portata (arco con \\(f\_{uv}\\) minimo) del cammino da \\(r\\) a \\(u\\)
-   condizioni `SPT`
    -   \\(d\_v \ge \min \\{d\_u, f\_{uv}\\}\\)


## Ottimizzazione su Rete {#ottimizzazione-su-rete}

-   problemi:
    -   cammino di costo minimo
        -   flusso di una unità
    -   flusso massimo
    -   flusso di costo minimo
-   risolvibili con `PL`
    -   ma esistono algoritmi specializzati ad hoc + efficienti

\\[\min c^T x: Ex = b, 0 \le x \le U\\]
Questa formulazione del problema permette:

-   verifica della complessità
-   analizzare la relazione con il problema duale
-   gestire varianti più complesse del problema aggiungendo altri vincoli

La matrice \\(E\\):

-   modella il grafo come matrice di incidenza nodi-archi
-   i nodi sono attraversati dal flusso (in = out)
-   punti di immissioni (in &lt; out)
-   punti di uscita (in &gt; out)

Conservazione del flusso al nodo \\(i\\):
\\[ \sum\_{(h,i)\in A} x\_{hi} - \sum\_{(i,j)\in A} x\_{ij} = b\_i\\]

-   \\(b\_i = 0\\)  nodo di transito
-   \\(b\_i < 0\\) nodo sorgente (in &lt; out)
-   \\(b\_i > 0\\) nodo pozzo (in &lt; out)

La matrice \\(E\\) è totalmente unimodulare, quindi se il vettore \\(b\\) è intero le soluzioni del problema saranno intere anche definendo \\(x\\) continue

-   quindi problema `PL` veloce da risolvere con il simplesso

Il primale:

-   una unità di flusso esce dal nodo \\(s\\) e giunge a \\(t\\)
    -   \\(b\_s = -1, b\_t = 1, b\_i = 0\\)
-   per l'albero dei cammini minimi
    -   \\(b\_r = -n +1, b\_i =+1\\)

Il duale:
\\[\max \mu^T b : \mu^T E \le c^T \\]
Forma estesa:
\\[\max \sum\_{i\in N\\\ \\{r\\}} \mu\_i -(n-1) \mu\_r\\]
\\[ \mu\_j - \mu\_i \le c\_{ij}, \forall(i,j) \in A\\]

-   \\(\mu\\) è detto **potenziale**

Il duale conferma che valgono le condizioni di Bellmann per l'ottimo

-   la soluzione duale ammissibile nel primale è l'ottimo


### Grafo Aciclico {#grafo-aciclico}

-   consideriamo un grafo orientato, aciclico, pesato
-   enumerando i nodi si verifica la aciclicità
    -   buona numerazione
-   si definiscono gli archi entranti (`BS`) e uscenti (`FS`) per un nodo
    -   `BS` - Backward Star
    -   `FS` - Forward Star
-   per calcolare i cammini minimi si sfrutta la buona numerazione del grafo seguendone l'ordinamento
-   `SPT` acyclic
    -   \\(O(m)\\)
    -   gli archi sono esaminani una sola volta


### Cicli negativi {#cicli-negativi}

-   rendono inutilizzabili gli algoritmi visti
-   ma è facilmente verificabile se si è entrati in un ciclo negativo e fermarsi
