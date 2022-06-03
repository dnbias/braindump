+++
title = "Sistemi Intelligenti"
author = ["Daniel Biasiotto"]
date = 2022-02-28T14:23:00+01:00
tags = ["university"]
draft = false
+++

-   Professoressa: Cristina Baroglio
-   [PDF Version](/ox-hugo/sistemi_intelligenti.pdf)


## Terminologia {#terminologia}

-   **AI** coniato da [John McCarthy]({{< relref "john_mccarthy.md" >}})
-   **Dato**, simbolo grezzo
-   **Informazione**, un dato elaborato
-   **Conoscenza**, campo di informazioni correlate tra loro
-   **Automazione**,
-   **Autonomia**,


### Automazione {#automazione}

Campo in cui l'informatica piú in generale viene applicata

-   automazione del calcolo
-   automazione contabile
-   automiazione della ricerca di informazione, motori di ricerca

Tratta di programmare un supporto a fare _ogni passo_, applicabile in domini fortemente ripetitivi


### Autonomia {#autonomia}

Svolta da un agente artificiale che risolve un compito

-   non viene indicato passo passi il modo per raggiungere l'obiettivo
-   vengono forniti solo compiti ad alto livello

Utile nei problemi:

-   non deterministici
-   in cui c'é molteplicitá di soluzioni
-   con dati di natura simbolica
-   si ha una conoscenza ampia e completa
-   dove l'informazione é parzialmente strutturata


### Comprensione {#comprensione}

Output attesi \\(\implies\\) comprensione? [John R. Searle]({{< relref "john_r_searle.md" >}})


### Test di Turing {#test-di-turing}

-   test per definire se un computer é intelligente, o se un programma lo é
    -   in linguaggio naturale
-   per T lo é quando inganna l'uomo, imitando il comportamento umano
-   un computer che deve passare il test non eseguirá gli ordini direttamente, in quanto questi vanno filtrati rispetto alle capacitá di un umano
-   `The Imitation Game`


### Captcha {#captcha}

`Completely Automated Public Turing-test to tell Computers and Humans Apart`
Turing test inverso


### Strong &amp; Weak {#strong-and-weak}

1.  studio del pensiero e del comportamento umano, scienze cognitive
    -   riprodurre l'intelligenza umana
2.  risolvere problemi che richiederebbero intelligenza degli umani per essere risolto
    -   non ci importa come l'umano ragiona, importa come risolvere il problema
    -   task-oriented


### Agente - Environment {#agente-environment}

L'agente é immerso in un ambiente e svolge in ciclo esecutivo:

1.  Percepisce
2.  Delibera
3.  Agisce

L'ambiente definisce cosa e' efficace e cosa non lo e'. questo in base agli _attuatori_ degli agenti possono essere posti in questo ambiente.
L'ambiente, in base a come si evolve nel tempo della percezione e deliberazione, puo' essere:

-   statico
-   dinamico

Inoltre si puo' distinguere un ambiente:

-   deterministico
    -   possibile prevedere in che stato un azione sposta l'ambiente
-   stocastico
    -   non e' possibile prevedere in tutti i casi lo stato in cui ci si trovera' dopo un azione


#### Agente Autonomo {#agente-autonomo}

-   ha capacitá di _azione_
-   riceve compiti ad alto livello
-   esplora alternative, numero esponenziale di possibilitá da esplorare
-   riconosce
    -   se una strada non puó portare a una soluzione
    -   un strada giá esplorata

Un `AA` rimane un programma, non fará ció che non é programmato a fare

Il cuore dell'agente é la funzione **deliberativa**

-   un agente é _razionale_ se opera per conseguire il _successo_
-   questo é possibile con una <span class="underline">misura di prestazione</span> utilizzata come guida

La razionalitá ottimizza il risultato atteso

-   possono intercorrere fattori ignoti o imprevedibili


### Paradigma Dichiarativo {#paradigma-dichiarativo}

-   imperativo: _how_, sequenza di passi
-   dichiaritivo: _what_, si sfrutta una `knowledge base`
    -   il cuore é il **Modulo dichiarativo** che utilizza l'informazione dalla percezione e la propria knowledge base

Quindi:

-   un programma, risolutore, produce un altro programma che risolva una particolare istanza del mondo


## Risoluzione Automatica {#risoluzione-automatica}

-   nella realtá di riferimento si astrae utilizzando degli _stati_
    -   astraendo si lascia solo una descrizione essenziale
    -   discreti
    -   tra questi ci saranno stati _target_ e stati di partenza
-   la realtá transisce da uno stato all'astro tramite _azioni_
    -   le azioni hanno effetto deterministico
-   il dominio della realtá é statico
-   **l'algoritmo di ricerca** determina una soluzione
    -   permette di raggiungere da uno stato iniziale uno stato target
        -   una soluzione é un percorso del grafo degli stati
    -   utilizza:
        -   descrizione del problema
        -   metodo di ricerca

Fornendo una situazione iniziale e una situazione da raggiungere, appartenenti allo stesso dominio, l'agente deve trovare
una soluzione


### Problemi {#problemi}

Un problema puó essere definito formalmente come una <span class="underline">tupla di 4 elementi</span>

1.  Stato iniziale
2.  Funzione successore
3.  Test Obiettivo
4.  Funzione del costo del cammino


#### Aspirapolvere {#aspirapolvere}


#### Gioco del 15 {#gioco-del-15}

Problema di ricerca nello spazio degli stati

-   stato iniziale, qualsiasi
-   funzione successore, spostamento di una tessera adiacente allo spazio vuoto nel suddetto
-   test obiettivo, verifica che la stato sia quello desiderato (tabella ordinata)
-   costo del cammino, ogni passo costa 1 e il costo del cammino é il numero di passi che lo costituiscono


##### Euristiche {#euristiche}

-   \\(h\_1\\) numero delle tessere fuori posto (rispetto alla configurazione goal)
-   \\(h\_2\\) distanza di Manhattan
    -   in particolare \\[\sum\_{\forall c}d\_{\text{man}}( c)\\]


#### 8 Regine {#8-regine}

Posizionare 8 regine su una scacchiera \\(8\times8\\) in modo che nessuna sia sotto attacco

-   generalizzabile con \\(N\\) regine su una scacchiera \\(N\times N\\)


### Spazio degli Stati {#spazio-degli-stati}

Le caratteristiche di questi problemi sono:

-   stati discreti
-   effetto deterministico delle azioni
-   dominio statico


#### Ricerca non informata - Blind {#ricerca-non-informata-blind}

Costruiscono strutture dati proprie utilizzate nella soluzione di un problema

-   alberi o grafi di ricerca
    -   in un albero uno stato puó comparire piú volte

Ogni nodo rappresenta uno stato, una soluzione é un particolare percorso dalla radice ad una foglia

-   i nodi figli sono creati dalla funzione successore
    -   questi sono creati mantenendo un puntatore al padre, in modo da risalire una volta individuata la soluzione

Gli approcci sono **valutati** secondo

-   **completezza**, garanzia di trovare una soluzione se esiste
-   **ottimalità**,  garanzia di trovare una soluzione ottima[^fn:1]
-   **complessità temporale**, tempo necessario per trovare una soluzione
-   **complessità spaziale**, spazio necessario per effettuare la ricerca

> **NB** \\(\quad\\) Lo studio della [Complessitá di un algoritmo]({{< relref "20210414192358-problems_algorithms.md#complessitá-di-un-algoritmo" >}}) é trattato anche in [Algoritmi e Strutture Dati]({{< relref "ASD.md" >}}) e [Calcolabilitá e Complessitá]({{< relref "20210921121153-calcolabilita_e_complessita.md" >}}).

Gli alberi vengono esplorati tramite `Ricerca in Ampiezza` e `Ricerca in Profonditá`

Nello studio di queste ricerche si considerano:

-   \\(d\\) profondità minima del _goal_
-   \\(b\\) _branching factor_

Un goal a meno passi dalla radice non dà garanzia di ottimalità, in quanto vanno considerati i costi non il numero di passi.
Il costo per l'ottimalità é una funzione monotona crescente in relazione alla profondità.


##### Ricerca in Ampiezza {#ricerca-in-ampiezza}

-   completa a patto che \\(b,d\\) siano finiti
-   ottima solo se il costo del cammino é \\(f\\) monotona crescente della profondità

\\[\textsc{time} =  \textsc{space} = O(b^{d+1})\\]

-   esponenziale, non trattabile anche con \\(d\\) ragionevoli


##### Ricerca Costo Uniforme {#ricerca-costo-uniforme}

Cerca una soluzione ottima, che non in tutti i problemi corrisponde a il minor numero di passi.
La scoperta di un goal non porta alla terminazione della ricerca.
Questa termina solo quando non possono esserci nodi non ancora scoperti con un costo minore di quello già trovato.

La ricerca può non terminare in caso di `no-op`, che creano loop o percorsi infiniti sempre allo stesso stato.
Quindi:
\\(\text{costi} \ge \epsilon > 0\\)

-   \\(\epsilon\\) costo minimo
-   condizione necessaria per garantire ottimalità e completezza

\\[\textsc{time} = \textsc{space} = O(b^{1+\lfloor \frac{C^{\*}}{\epsilon} \rfloor})\\]

-   \\(C^{\*}\\) costo soluzione ottima


##### Ricerca in Profondità w/o Backtracking {#ricerca-in-profondità-w-o-backtracking}

Si esplora espandendo tutti i figli ogni volta che viene visitato un nodo non goal

-   viene utilizzato uno `stack` (`LIFO`) per gestire la frontiera

\\[\textsc{time} = O(b^{m})\\]
\\[\textsc{space} = O(b \cdot m)\\]


##### Ricerca in Profondità w/ Backtracking {#ricerca-in-profondità-w-backtracking}

Si producono successori su successori man mano, percorrendo in profondità l'albero.
In fondo, in assenza di goal, viene fatto backtracking cercando altri successori degli nodi già percorsi.

-   viene esplorato un ramo alla volta, in memoria rimane solo il ramo che sta venendo esplorato
-   più efficiente in utilizzo della memoria

\\[\textsc{time} = O(b^{m})\\]
\\[\textsc{space} = O(m)\\]


##### Iterative Deepening {#iterative-deepening}

Ricerca a profondità limitata in cui questa viene incrementata a ogni iterazione

-   ogni iterazione viene ricostruito l'albero di ricerca
-   cerca di combinare ricerca in profondità e in ampiezza
    -   completa con \\(b\\) finito
    -   ottima quando il costo non é funzione decrescente delle profondità

\\[\textsc{time}= O(b^d)\\]
\\[\textsc{space}= O(b\cdot d)\\]


##### Ricerca Bidirezionale {#ricerca-bidirezionale}

2 ricerche parallele

-   _forward_ dallo stato iniziale
-   _backwards_ dallo stato obiettivo

Termina quando queste si incontrano a una intersezione.
Il rischio é che si faccia il doppio del lavoro e che non convergano a metá percorso ma agli estremi

-   \\(\textsc{time}= O( b^{\frac{d}{2}})\\)
    -   nel caso in cui le due ricerche si incontrino a metà


#### Ricerca informata {#ricerca-informata}

Si possiedono informazioni che permettono di identificare le strade più promettenti

-   in funzione del costo

Questa informazione é chiamata **euristica**

-   \\(h(n)\\): Il costo minimo stimato per raggiungere un nodo _goal_ da \\(n\\)

Una strategia é il mantenere la frontiera ordinata secondo una \\(f(n)\\) detta _funzione di valutazione_

-   questa contiene a sua volta una componente \\(h(n)\\) spesso
-   in generale questa strategia é chiamata **best-first search**, il nodo più promettente é espanso per primo
    -   si tratta di una famiglia di strategie (greedy, A\*, RBFS)


##### Greedy {#greedy}

-   costruisce un albero di ricerca
-   mantiene ordinata la frontiera a seconda di \\(h(n)\\)
    -   \\(f(n) = h(n)\\)

Ma l'euristica puó essere imperfetta e creare dei problemi.
Questa strategia considera solo informazioni _future_, che riguardano ció che non é ancora stato esplorato.


##### A\* {#a}

Combina informazioni future e passate:

-   **Greedy** e **Ricerca a costo uniforme**

Utilizza una funzione di valutazione:
\\(f(n) = g(n) + h(n)\\)

-   \\(g(n)\\) é il costo minimo dei percorsi esplorati che portano dalla radice a \\(n\\)

I costi minimi reali sono definiti con:
\\(f^{\star}(n) = g^\star(n) + h^\star(n)\\)

-   definizione utilizzata nelle dimostrazioni

\\(A^\star\\) é **ottimo** quando

-   tutti i costi da un nodo a un successore sono positivi
-   l'euristica \\(h(n)\\) é ammissibile

**Ammissibilità**

-   \\(\forall n: h(n) \le h^\star(n)\\)
    -   ovvero l'euristica é ottimistica

Nel caso di ricerca in grafi \\(h(n)\\) deve essere anche **monotona consistente** per garantire l'ottimalitá.

-   vale una disuguaglianza triangolare
-   \\(h(n) \le c(n,a,n') + h(n')\\)
-   \\(\textsc{nb}\\) tutte le monotone sono ammissibili ma non vale il viceversa

Inoltre é **ottimamente efficiente** e completo

-   espande sempre il numero minimo di nodi possibili

Ma \\(\textsc{space}=O(b^d)\\)

Algoritmo implementato in `Python`:

```python
# Code snippet found on rosettacode.org
F AStarSearch(start, end, barriers)
   F heuristic(start, goal)
      V D = 1
      V D2 = 1
      V dx = abs(start[0] - goal[0])
      V dy = abs(start[1] - goal[1])
      R D * (dx + dy) + (D2 - 2 * D) * min(dx, dy)

   F get_vertex_neighbours(pos)
      [(Int, Int)] n
      L(dx, dy) [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, 1), (1, -1), (-1, -1)]
         V x2 = pos[0] + dx
         V y2 = pos[1] + dy
         I x2 < 0 | x2 > 7 | y2 < 0 | y2 > 7
            L.continue
         n.append((x2, y2))
      R n

   F move_cost(a, b)
      L(barrier) @barriers
         I b C barrier
            R 100
      R 1

   [(Int, Int) = Int] G
   [(Int, Int) = Int] f

   G[start] = 0
   f[start] = heuristic(start, end)

   Set[(Int, Int)] closedVertices
   V openVertices = Set([start])
   [(Int, Int) = (Int, Int)] cameFrom

   L openVertices.len > 0
      (Int, Int)? current
      V currentFscore = 0
      L(pos) openVertices
         I current == N | f[pos] < currentFscore
            currentFscore = f[pos]
            current = pos

      I current == end
         V path = [current]
         L current C cameFrom
            current = cameFrom[current]
            path.append(current)
         path.reverse()
         R (path, f[end])

      openVertices.remove(current)
      closedVertices.add(current)

      L(neighbour) get_vertex_neighbours(current)
         I neighbour C closedVertices
            L.continue
         V candidateG = G[current] + move_cost(current, neighbour)

         I neighbour !C openVertices
            openVertices.add(neighbour)
         E I candidateG >= G[neighbour]
            L.continue

         cameFrom[neighbour] = current
         G[neighbour] = candidateG
         V H = heuristic(neighbour, end)
         f[neighbour] = G[neighbour] + H

   X RuntimeError(‘A* failed to find a solution’)
```

<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 1:</span>
  a-star.py
</div>


##### Recursive Best-First Strategy {#recursive-best-first-strategy}

`RBFS`

-   simile alla ricerca ricorsiva in profondità
-   usa un _upper bound_ dinamico
    -   ricorda la migliore alternativa fra i percorsi aperti
-   ha poche esigenze di spazio
    -   mantiene solo nodi del percorso corrente e fratelli, in questo é migliore di `A*`
-   lo <span class="underline">stesso nodo può essere visitato più volte</span> se l'algoritmo ritorna a un percorso aperto

Intuitivamente:

-   procede come \\(A^{\star}\\) fino a che la soluzione rispetta l'_upper bound_
-   sospende la ricerca lungo il cammino quando non piú migliore
    -   il cammino viene dimenticato, si cancella dalla memoria
    -   é conservata la traccia nella sua radice del costo ultimo  stimato

L'algoritmo ha 3 argomenti

-   \\(N\\) nodo
-   \\(f(N)\\) valore
-   \\(b\\) upper bound
    -   inizialmente impostato a \\(+ \infty\\)

`RBFS` é ottimo se l'euristica é ammissibile
 \\[\textsc{Space} = O(b\cdot d)\\]
\\(\textsc{Time}\\) dipende dall'accuratezza dell'euristica.


### Euristiche {#euristiche}

La qualità di un euristica può essere calcolata computado il _branching factor effettivo_ \\(b^\star\\)

-   \\(N\\) numero di nodi generati a partire da un nodo iniziale
-   \\(d\\) profonditá della soluzione trovata

\\[N+1 = 1 + b^\star + (b^\star)^{2} + \cdots + (b^\star)^{d} \\]
\\[N \simeq (b^\star)^{d} \implies b^\star \simeq \sqrt[d]{N}\\]

Le euristiche migliori mostreranno \\(b^\star\\) vicini a 1.


#### Calcolo della Bontá {#calcolo-della-bontá}

Per decidere tra 2 euristiche ammissibili quale sia la piú buona

1.  confronto sperimentale
2.  confronto matematico

Si considera la **dominanza**

-   \\(\forall n : h\_2(n) \le h\_1(n)\le h^\star(n)\\)
    -   \\(h\_{1}\\) domina perché restituisce sempre valore maggiore rispetto all'altra
    -   si puó dire sia piú informata in quanto approssima meglio
-   una euristica dominante sará piú vicina alla realtá

Si puó costruire una nuova \\(h(n) = \max(h\_1(n),\dots,h\_k(n))\\) dominante su tutte quelle che la compongono

Si valuta la qualitá dell'euristica (sperimentalmente) con il _branching factor_ effettivo \\(b^\star\\)

-   si costruisce con gli \\(N\\) nodi costruiti nella ricerca un _albero uniforme_
-   \\(b^\star\\) piccolo \\(\rightarrow\\) euristica efficiente


### Ricerca in Spazi con Avversari {#ricerca-in-spazi-con-avversari}

**Informazione** può essere caratterizzata da:

-   _condizioni_ di scelta a informazione
    -   perfetta
    -   imperfetta
-   _effetti_ della scelta
    -   deterministici
    -   stocastici

La ricerca in questo ambito si basa su delle **strategie** basate su punteggi dati dagli eventi.
In questo ambito si studiano spesso giochi.

> I giochi non vengono scelti perché sono chiari e semplici, ma perché ci danno la massima complessità con le minime strutture iniziali. \\(\qquad\qquad\qquad\\)  [Marvin Minsky]({{< relref "marvin_minsky.md" >}}) [#cit]({{< relref "20210604132601-cit.md" >}})

Alcuni giochi sono anche a _somma zero_ se le interazioni tra gli agenti se portano a una **perdita/guadagno** per uno ciò compensato da un **guadagno/perdita** dell'altro, suo avversario.
I nodi terminali dei grafi creati nella risoluzione di questi giochi posso indicare stati di `vittoria`, `sconfitta`, `parità`.


#### Teoria delle Decisioni {#teoria-delle-decisioni}

Dall'Economia, poi traslata in algoritmi nell'ambito dell'IA.

-   **approccio maximax** - ottimistico
-   **approccio maximin** - conservativo
-   **approccio minimax regret** - minor _regret_
    -   _best payoff - real payoff_

L'_osservabilità_ é totale nei giochi a turno e parziale nei giochi ad azione simultanea.
I giocatori `Min` e `Max` tengono conto dell'avversario nel calcolo dell'utilità degli stati
![](/ox-hugo/max-min-game.png)


##### Minimax {#minimax}

`Minimax` e' un algoritmo pessimista nel senso che simula che `Min` si muova in modo perfetto.

-   ricerca in profondita', esplora tutto l'albero ma non mantiene tutto in memoria

Nella simulazione dell'albero di gioco si hanno i due attori

1.  `Max`
2.  `Min`

L'algoritmo fa _venire a galla_ i costi _terminali_ dei rami del gioco, in quanto per guidare la scelta `Max` deve poter scegliere tra i nodi a se successivi.

-   é completo in grafi finiti
-   é ottimale se `Max` e `Min` giocano ottimalmente

La funzione utilità valuta gli stati _terminali_ del gioco, agisce per casi sul nodo \\(n\\) in maniera ricorsiva
\\(\text{minimax-value}(n)\\):

-   se \\(n\\) _terminale_
    -   \\(\text{utility}(n)\\)
-   se \\(n\\) `Max`
    -   \\(\text{max}\_{s \in succ(n)}(\text{minimax-value}(n))\\)
-   se \\(n\\) `Min`
    -   \\(\text{min}\_{s \in succ(n)}(\text{minimax-value}(n))\\)

<!--listend-->

```python
def minimaxDecision(state): # returns action
    v = maxValue(state)
    return action in succ(state) with value == v

def maxValue(state): # returns utility-value (state)
    if (state.isTerminal()):
        return utility(state)

    v = sys.minint
    for (a,s) in succ(state): # (action,successor)
        v = max(v, minValue(s))

    return v

def minValue(state):
    if (state.isTerminal()):
        return utility(state)

    v = sys.maxint
    for (a,s) in succ(state):
        v = min(v, maxValue(s))

    return v
```

\\[\textsc{Space} = O(b \cdot m)\\]
\\[\textsc{Time} = O(b^{m})\\]


###### Potatura alpha-beta {#potatura-alpha-beta}

-   [Handout MIT sull'argomento per approfondire](https://web.mit.edu/6.034/wwwbob/handout3-fall11.pdf)

Per migliorare la complessità temporale dell'algoritmo si agisce potando le alternative che non potranno cambiare la stima corrente a quel livello.
La potatura viene fatta in base all'intervallo \\(\alpha \cdots \beta\\) dove:

-   \\(\alpha\\) e' il valore della migliore alternativa per `Max` nel percorso verso `state`
-   \\(\beta\\) e' il valore della migliore alternativa per `Min` nel percorso verso `state`

Se il \\(v\\) considerato e' fuori da questo intervallo allora e' inutile considerarlo.

```python
def alphabetaSearch(state): # returns action
    v = maxValue(state, sys.minint, sys.maxint)
    return action in succ(state) with value == v

def maxValue(state, alpha, beta): # returns utility-value (state)
    if (state.isTerminal()):
        return utility(state)

    v = sys.minint
    for (a,s) in succ(state): # (action,successor)
        v = max(v, minValue(s, alpha, beta))
        if (v >= beta) return v
        alpha = max(alpha, v)

    return v

def minValue(state, alpha, beta):
    if (state.isTerminal()):
        return utility(state)

    v = sys.maxint
    for (a,s) in succ(state):
        v = min(v, maxValue(s, alpha, beta))
        if (v <= alpha) return v
        beta = min(beta, v)

    return v
```

Questo algoritmo e' dipendente dall'ordine di esplorazione dei nodi, alcune azioni _killer move_ permettono di tagliare l'albero subito e non sprecare passi.

-   \\(\textsc{time} = O(b^{m/2})\\)
    -   nel caso migliore
    -   se l'ordine é sfavorevole é possibile che non avvengano potature
    -   comunque molto costoso

Esistono tecniche di apprendimento per le _killer move_, il sistema si ricorda le _killer move_ passate e le cerca nelle successive applicazioni.
Queste tecniche sono studiate in quanto la complessità continua a essere troppo alta per applicazioni `RealTime`:

-   **trasposizioni**
    -   permutazioni dello stesso insieme di mosse
    -   mosse che portano allo stesso stato risultante
    -   vanno identificate ed evitate
-   **classificazione stati di gioco**
    -   per motivi di tempo vanno valutati come foglie nodi intermedi a un certo _cutoff_
    -   va valutata una situazione intermedia (_orizzonte_)
        -   valutazione rispetto alla facilità di raggiungere una vittoria
        -   attraverso un classificatore sviluppato in precedenza
-   **quiescenza** dei nodi, concerne la <span class="underline">permanenza della negatività o positività della valutazione</span>
    -   se mantiene la propria valutazione bene nei continuo
    -   non ribalta la valutazione nel giro di poche mosse


### Constraint Satisfaction Problems {#constraint-satisfaction-problems}

`CSP`

-   serie di `variabili` di dati dominii
-   `vincoli`, una condizioni
    -   é soddisfatto con una dato `assegnamento` che per essere una soluzione deve essere
        1.  **completo**, tutte le variabili sono assegnate
        2.  **consistente**, tutti i vincoli sono rispettati

I problemi sono affrontati con approcci diversi in base alle caratteristiche del dominio (valori booleani/discreti/continui)


#### Algoritmi {#algoritmi}


##### Generate and Test {#generate-and-test}

_Bruteforce_

1.  genera un assegnamento completo
2.  controlla se é una soluzione
3.  se si `return` altrimenti `continue`

É estremamente semplice ma non é scalabile.


##### Profondità con Backtracking {#profondità-con-backtracking}

Si esplora l'albero delle possibili assegnazioni in profonditá. Si fa backtracking quando si incontra una assegnazione parziale che non soddisfa piú le condizioni.
Il problema é che in `CSP` il `branching factor` é spesso molto alto, producendo alberi molto larghi.

Dati \\(n\\) variabili e \\(d\\) media del numero di  valori possibili per una variabile:

-   il `branching factor` al primo livello, \\(n \cdot d\\)
-   ... al secondo, \\((n-1)\cdot d\\)
-   l'albero avrá \\(n! \cdot d^{n}\\) foglie

Questo é migliorabile con la tecnica del _fuoco_ su una singola variabile a ogni livello dell'albero, questo in quanto i `CSP` godono della proprietá commutativa rispetta all'ordine delle  variabili. Questo permette di rimuove il fattoriale nel numero di foglie.

Uno dei difetti di questo approccio é il `Thrashing`, riconsiderando assegnamenti successivi che si sono giá dimostrati fallimentari durante l'esplorazione.


##### Forward Checking {#forward-checking}

Approccio locale di propagazione della conoscenza.
Si propagano le scelte delle variabili ai vicini diretti, restringendo il dominio di questi vicini. In caso di individuare una inconsistenza se esiste.


##### AC-3 {#ac-3}

`Arc Consistency` - McWorth

-   funziona con vincoli binari
-   simile al Forward Checking
-   `Arc Consistency` non é una proprietá sufficiente a garantire l'esistenza di una soluzione

<!--listend-->

```python
def AC-3(csp): # returns redox CSP
    queue = csp.arcs
    while queue != empty:
        (xi,xj) = queue.RemoveFirst()
        if (RemoveInconsistentValues(xi,xj)):
            for (xk in xi.neighbours):
                queue.Add(xk,xi)


def RemoveInconsistentValues(xi,xj): # returns boolean
    removed = false
    for (x in Domain[xi])
        if (no value y in Domain[xj] consents to satisfy the constraint xi,xj):
            Domain[xi].delete(x)
            removed = true
    return removed
```


##### Back-Jumping {#back-jumping}

Risolve i limiti del tradizionale `Backtracking Cronologico`, che torna passo per passo indietro senza sfruttare i vincoli.
Si viene guidati dal _Conflict Set_. Si fa backtracking a una variabile che potrebbe risolvere il conflitto.

-   questi `CS` sono costruiti tramite `Forward Checking` durante gli assegnamenti

> Sia \\(A\\) un assegnamento parziale consistente, sia \\(X\\) una variabile non ancora assegnata. Se l'assegnamento \\(A \cup \\{X=v\_{i}\\}\\) risulta inconsistente per qualsiasi valore \\(v\_{i}\\) appartenente al dominio di \\(X\\) si dice che \\(A\\) é un <span class="underline">conflict set</span> di \\(X\\)

Quando tutti gli assegnamenti possibili successivi a \\(X\_{j}\\) falliscono si agisce con il `Back-Jumping`

-   si considera l'ultimo assegnamento \\(X\_{i}\\) aggiunto al `CS` di \\(X\_{j}\\)
-   viene aggiornato il `CS` di \\(X\_{i}\\)
    -   \\(CS(X\_{i})=CS(X\_{i})\cup (CS(X\_{j})- \\{X\_{i}\\})\\)


#### Euristiche {#euristiche}

-   di variabile
    -   `Minimum Remaining Values` - _fail-first_
    -   `Grado`
-   di valore
    -   `Valore Meno Vincolante`
        -   lascia piú libertá alle variabili adiacenti sul grafo dei vincoli

Euristiche di _scelta_ e _inferenza_

-   alternanza tra esplorazione e inferenza
    -   ovvero propagazione di informazione attraverso i vincoli


##### Consistency {#consistency}

1.  `Node Consistency`
    -   vincoli di aritá 1 soddisfatti
2.  `Arc Consistency`
    -   vincoli di aritá 2 soddisfatti per ogni valore nel dominio
    -   un arco é `arc-consistent` quando \\(\forall\\) valore del dominio del sorgente \\(\exists\\) valore nel dominio della destinazione che permetta di rispettare il vincolo
3.  `Path Consistency`
    -   3 variabili legate da vincoli binari
    -   considerate 2 variabili \\(x, y\\) queste sono `path-consistent` con \\(z\\) se \\(\forall\\) assegnamento consistente di \\(x,y \\; \exists\\) un assegnamento \\(z\\) tale che \\(\\{x,z\\}\\) e \\(\\{y,z\\}\\) questi sono entrambi consistenti.

Questi concetti sono generalizzabili con la `k-consistenza`

-   per ogni sottoinsieme di \\(k-1\\) variabili e per ogni loro assegnamento consistente é possibile identificare un assegnamento per la \\(k\text{-esima}\\) variabile che é consistente con tutti gli altri.

Un `CSP` fortemente consistente puó essere risolto in tempo lineare.


#### Vincoli Speciali {#vincoli-speciali}

-   `AllDifferent`
    -   test sul numero di valori rimanenti nei domini delle variabili considerate
-   `Atmost`
    -   disponibilitá \\(N\\)
    -   risorse richieste dalle entitá
    -   vincoli utilizzati nella _logistica_


#### Problema dell'Australia {#problema-dell-australia}

3 colori per colorare i 7 territori dell'Australia

-   {`NA`, `NT`, `SA`, `Q`, `NSW`, `V`, `T`}
-   un territorio deve avere colore diverso da tutti i confinanti

{{< figure src="/ox-hugo/australian-states.jpg" >}}


## Rappresentazione della Conoscenza {#rappresentazione-della-conoscenza}


### Agenti su Conoscenza {#agenti-su-conoscenza}

Caratterizzati da:

-   `Knowledge Base`
    -   generalmente cambia nel tempo
    -   inizialmente formata dalla _background knowledge_
-   `Tell` - _assert_
-   `Ask` - _query_
    -   ogni risposta deve essere una conseguenza di _asserts_ e _background knowledge_


### Formalismi Logici {#formalismi-logici}

_Per la rappresentazione di Knowledge Base_

-   **Linguaggio di Rappresentazione**
    -   con cui vengono formate formule _ben formate_
    -   la _semantica_ del linguaggio definisce la veritá delle formule
-   **Modello** \\(F\_n\\)
    -   é un assegnamento di valori ai simboli proposizionali
    -   permette la valutazione delle formule
-   **Conseguenza**  \\(\vDash\\)
    -   in generale il lato sinistro é sottoinsieme del destro
        -   per ogni caso di \\(F\_{1}\\) vale anche \\(F\_{2}: F\_{1} \vDash F\_{2}\\)
    -   **non é** l'_implicazione_ logica, sono su piani diversi anche se sono simili
-   **Equivalenza**  \\(\equiv\\)
    -   \\(F\_{1} \vDash F\_{2} \land F\_{2} \vDash F\_{1}\\)
-   **Validitá**
    -   o _tautologia_
    -   vera in tutti i modelli
-   **Insoddisfacibilitá**
    -   o _contraddizione_
    -   una formula ins. é falsa in tutti i modelli
-   **Soddisfacibilitá**
    -   formula per il quale esiste qualche modello in cui é vera
-   **Inferenza**  \\(\vdash\\)
    -   propagazione informazione

\\[\frac{\text{premesse}}{\text{conclusione}}\\]

-   **Algoritmi di Inferenza** manipolano inferenze per derivare formule
    1.  correttezza (_soundness_)

\\[KB \vdash\_{i} A \implies KB \vDash A\\]

1.  completezza

\\[KB \vDash\_{} A \implies KB \vdash\_{i} A\\]

-   **Grounding**


### Semantica {#semantica}

\\[KB\_{LP}\vDash P\_{LP}\\]

Vari approcci:

1.  **Model Checking**
    -   \\(n\\) simboli, \\(2^{n}\\) modelli possibili
2.  **Theorem Proving**
    -   basato sull'inferenza _sintattica_
        -   quindi sulla manipolazione delle formule
        -   utilizza le `Regole di Inferenza`
            -   contrapposizione, de Morgan, associativitá...
    -   `Teorema di Deduzione`
        -   date formule \\(R,Q\\)
        -   \\(R\vDash Q \iff R\implies Q \text{ é una formula valida o tautologia}\\)
            -   \\(Q\\) é conseguenza logica di \\(R\\)


#### Theorem Proving {#theorem-proving}

1.  Algoritmo di Ricerca (o di inferenza)
2.  Insieme di regole di inferenza
    -   `Risoluzione`
        -   disgiunzioni in cui si fattorizzano analoghi e si cancellano i contrari
        -   il `Modus Ponens` ne é un caso particolare
        -   si applica a `CNF`
            -   \\(KB\_{\text{LP}}  \vdash KB\_{\text{CNF}}\\)
                1.  si eliminano le biimplicazioni
                2.  si eliminano le implicazioni
                3.  si portano all'interno i `not` applicando `de Morgan`
                4.  si eliminano le doppie negazioni
                5.  si distribuisce `or` sull'`and`
            -   congiunzioni di clausole (disgiunzioni di letterali)

> **Teorema**: Se un insieme di clausole é insoddisfacibile la chiusura della risoluzione contiene la clausola vuota

Questo é utilizzato nella dimostrazione per refutazione.


##### Horn Clauses {#horn-clauses}

Un caso particolare delle clausole.

> Una clausola di horn é una disgiunzione di letterali in cui al piú uno é positivo.

ad esempio:

\\[\frac{\lnot A \lor \lnot B \lor C}{A \land B \Rightarrow C}\\]

\\[\frac{\lnot A \lor \lnot B}{A \land B}\\]


##### Forward Chaining {#forward-chaining}

Lineare nel numero di clausole

-   ogni clausola é applicata al piú  una volta
-   peró sono applicate clausole inutili per il _target_

{{< figure src="/ox-hugo/forward-chaining.jpg" >}}


##### Backward Chaining {#backward-chaining}

Parte dalla formula da dimostare e va a ritroso

-   piú efficiente del `Forward Chaining`
-   meno che lineare

{{< figure src="/ox-hugo/backward-chaining.jpg" >}}


#### First Order Logic {#first-order-logic}

-   dichiarativa
    -   separa conoscenza da inferenza
    -   si deriva conoscenza da altra conoscenza

Elementi:

-   costanti
-   predicati
-   variabili
-   funzioni
    -   **NB** questi non costruiscono oggetti: danno un _riferimento_ a oggetti esistenti
-   connettivi
-   ugualianza
-   quantificatori
    -   \\(\forall\\) viene espanso in una catena di \\(\land\\)
    -   \\(\exists\\) viene espanso in una catena di \\(\lor\\)
    -   le espansioni vengono fatte sostituendo alla variabile **tutte** le costanti del modello
    -   \\(\exists x \lnot F \equiv \lnot \forall x F\\)
    -   \\(\exists x F \equiv \lnot \forall x \lnot F\\)
-   punteggiatura

Le formule in `FOL` sono poi _interpretate_

-   l'interpretazione forma un _mapping_ tra `simboli` e `dominio`
-   collega simboli e significati
    -   funzioni - relazioni
    -   predicati - relazioni
    -   costanti - oggetti

Un modello é una coppia: \\(M = \langle D,I \rangle\\)

-   \\(D\\) dominio
-   \\(I\\) interpretazione

> Come nellla logica proposizionale, \\(M\\) é un modello per \\(\alpha\\) se questo é vero in \\(M\\).

I modelli di un insieme di formule del prim'ordine <span class="underline">possono essere infiniti</span>.[^fn:2]
Un termine é `ground` quando non contiene variabili. (i.e. fondato)

La base di conoscenza puó essere interrogata con `ask`

-   quando compare una formula `ground` é banale la richiesta
-   quando compaiono variabili si intende una sostituzione
    -   quindi la variabile \\(x\\) é interpretata in senso esistenziale ( \\(\exists\\) )


##### Clausole di Horn {#clausole-di-horn}

-   disgiunzioni di letterali di cui al piú uno é positivo
-   atomiche
-   implicazioni il cui antecedente é una congiunzione di letterali


##### Inferenza su FOL {#inferenza-su-fol}

-   `Proposizionalizzazione`
    -   \\(KB\_{\text{FOL}} \rightarrow KB\_{\text{LP}}\\)
    -   Regola di Instanziazione Universale - `UI`
        -   \\(\frac{\forall x, \alpha}{\text{subst}\\{\\{x/g\\},\alpha\\}}\\)
        -   alla fine, in uno o piú passi, si deve arrivare a `ground`, \\(g\\) é esso stesso `ground`
        -   la \\(KB\_{\text{LP}}\\) risultante é logicamente equivalente a quella precedente
    -   Regola di Instanziazione Esistenziale - `EI`
        -   \\(\frac{\exists x,\alpha}{\text{subst}\\{\\{x/k\\},\alpha\\}}\\)
        -   \\(k\\) costante di Skolem, nuova
            -   non compare nella `KB`
        -   la \\(KB\_{\text{LP}}\\) risultante _non_ é logicamente equivalente a quella precedente _ma_ é soddisfacibile se \\(KB\_{\text{FOL}}\\)
    -   `Herbrand`
        -   se una formula é conseguenza logica della \\(KB\_{\text{FOL}}\\), partendo dalla \\(KB\_{\text{LP}}\\) ottenuta esiste una dimostrazione della sua veritá
            -   \\(KB \vDash F\\)
        -   se non é conseguenza logica ... non é detto sia dimostrabile
            -   \\(KB \not\vDash F\\) non sempre possibile
        -   la logica del prim'ordine é **semi-decidibile**
    -   `Inefficienza`
        -   crea delle basi di conoscenza grandi con le regole
-   `Lifting` delle regole di inferenza
    -   Regole di Inferenza \\(\text{LP}\\) trasformate in Regole di Inferenza \\(\text{FOL}\\)
    -   **Modus Ponens Generalizzato**[^fn:3]

\\[\frac{p\_{1}',\cdots ,p\_{n}' \qquad p\_{1} \land \cdots \land p\_{n} \implies q}{\text{subst}(q,\Theta)}\\]

-   \\(\Theta\\) é un unificatore di ciascuna coppia \\(\langle p\_{i}', p\_{i} \rangle\\) per cui \\(p\_{i}' \theta = p\_{i} \theta\\) per ogni \\(i\in [1,n]\\)
-   `Unification` (Martelli/Montanari)
    -   algoritmo di ricerca che date due formule trova la sostituzione \\(\theta\\) piú generale che le unifichi
-   `Forward Chaining`
    -   **Corretto** e **Completo** se la `KB` é una `DATALOG`[^fn:4]
        -   in caso contrario il caso negativo puó non terminare
-   `Backward Chaining`
    -   stesse considerazioni del `FC` ma piú efficiente

<!--listend-->

-   `Lifting` della Risoluzione[^fn:5]

\begin{align\*}
\frac{l\_{1}\lor \cdots \lor l\_{k} \qquad m\_{1} \lor \cdots \lor m\_{n}}{\text{subst}(\Theta, l\_{1} \lor \cdots \lor l\_{i-1} \lor l\_{i+1} \lor \cdots \lor l\_{k} \lor m\_{1}  \lor \cdots \lor m\_{j-1} \lor m\_{j+1} \lor \cdots \lor m\_{n})}
\end{align\*}

-   \\(KB\_{\text{FOL}} \rightarrow\_{\text{traduzione}}  KB\_{\text{FOL-CNF}}\\)
    1.  Eliminazione delle **implicazioni**
    2.  Spostamento delle **negazioni all'interno** (\\(\lnot \forall \equiv \exists \lnot\\))
    3.  **Standardizzazione** delle variabili (rinomina variabili ambigue)
    4.  **Skolemizzazione** (eliminazione degli \\(\exists\\))[^fn:6]
        -   <span class="underline">funzioni di Skolem</span> in contesti \\(\forall x\_{1},x\_{2},\cdots [\exists y P(y,x\_{1},x\_{2},\cdots)] \cdots [\exists z Q(z,x\_{1},x\_{2}\cdots)]\\)
        -   \\(\forall x P (F(x), x\_{})\\) dove \\(F\\) é una funzione di Skolem. con parametri tutti i parametri quantificati universalmente
        -   <span class="underline">Caso Particolare</span>, in assenza di parametri la \\(F\\) non ha parametri: é una costante
    5.  Eliminazione dei \\(\forall\\)


#### Database Semantics {#database-semantics}

-   unicitá dei nomi
-   _closed-world assumption_
    -   ció che non é rappresentato é falso
    -   questo é diverso dalle `Ontologie OWL` che assumono un mondo aperto
        -   esiste il concetto di ignoto oltre al vero/falso
-   domain closure

Riduce il numero di modelli a un numero finito.

Le `ontologie` a loro differenza possono avere istanze con ulteriori proprietá rispetto al concetto cui appartengono.


### Ontologie {#ontologie}

Le categorie vengono `reificate`, rese oggetti

-   questi oggetti sono utilizzati al posto dei predicati utilizzati in `FOL`

Vengono aggiunti predicati:

-   `Member` applicabile a _istanze_ di oggetti e una _categoria_
    -   `true` se l'istanza appartiene alla categoria
-   `IS-A` applicabile a due _categorie_
    -   vera se la prima é una sottocategoria della seconda

Con questi elementi si possono definire `tassonomie`

-   insieme di regole di sottocategorie / sottoclassi

Le categorie di una tassonomia possono essere caratterizzate tramite la definizione di `proprietá`:

-   `Member(X, Pallone)` \\(\Rightarrow\\) `Sferico(X)`
-   le proprietá si ereditano dalle superclassi
-   possono essere contraddette dalle proprietá delle sottoclassi

Le categorie:

-   possono essere `disgiunte` se non hanno istanze in comune nelle proprie sottoclassi
    -   `Disjoint(S)`
-   costituiscono una `decomposizione esaustiva` rispetto a una \\(C\\) loro superclasse quando le istanze di \\(C\\) sono esattamente l'unione delle istanze di queste sottoclassi
    -   `ExhaustiveDec(S,C)`
-   costituiscono una `partizione` se valgono entrambe le precedenti
    -   `Partition(S,C)`

Strutturalmente:

-   `Part-of(x,y)`
-   `On-top(x,y)`

L'`ontologia` é una forma piú generale delle `tassonomie`

-   hanno forma di grafo e non di albero
-   si struttura in
    -   `T-box`
        -   generale, concettualizzazione intensionale
        -   quantificato universalmente
    -   `A-box`
        -   su istanze specifiche, estensionale
        -   contiene fatti che devono essere _coerenti_ con il contenuto della `T-box`


#### Relazioni tra Ontologie {#relazioni-tra-ontologie}

Nello stesso dominio:

1.  \\(O\_{1}\\) e \\(O\_{2}\\) sono <span class="underline">identiche</span>; sono due copie dello stesso file
2.  \\(O\_{1}\\) e \\(O\_{2}\\) sono <span class="underline">equivalenti</span>; condividono vocabolario e proprietá ma sono espresse in linguaggi diversi[^fn:7]
3.  \\(O\_{1}\\) estende \\(O\_{2}\\); vocabolari e proprietá di \\(O\_{2}\\) sono preservati in \\(O\_{1}\\) ma non viceversa
4.  `Weakly-Translatable`
    -   non si introducono inconsistenze
5.  `Strongly-Translatable`
    -   il vocabolario di `Source` é completamente mappabile in concetti di `Dest`
    -   le proprietá di `Source` valgono in `Dest`
    -   non c'é perdita di informazione
    -   non si introducono inconsistenze
6.  `Approx-Translatable`
    -   `Source` é `Weakly-Translatable` in `Dest`
    -   possono essere introdotte delle _inconsistenze_


#### Ontologia come agente {#ontologia-come-agente}

L'`ontologia` é la `Knowledge Base`, che tramite un motore inferenziale unisce l'ontologia e i fatti conosciuti per rispondere a delle interrogazioni. Queste possono essere poste da software esterni o utenti. Sono rappresentazione di concettualizzazioni

Un'ontologia puó essere interrogata in maniere diverse

1.  istanza appartiene a categoria
2.  istanza gode di proprietá
3.  differenza fra categorie
4.  identificazione di istanze

Esempi ontologie: [Provenance]({{< relref "provenance.md" >}}), [Semantic Web]({{< relref "semantic_web.md" >}})
Utilizzate da: `DBpedia`, `CreativeCommons`, `FOAF`, `Press Association`, `Linked (Open) Data`


#### Data Interchange {#data-interchange}

`RDF` - Resource Description Framework

-   Un linguaggio / modello di rappresentazione
-   Base di linguaggi come `OWL`, `SKOS`, `FOAF`
-   Rappresentato in `XML`

**Triple** soggetto, predicato, oggetto possono essere rappresentate in forma di grafo.


#### Knowledge Engineering {#knowledge-engineering}

1.  Identificazione dei concetti
    -   elencare tutti i concetti riferiti nel `DB` di partenza
    -   solitamento _sostantivi_
    -   definire etichette e descrizioni
    -   identificare in seguito le sottoclassi
2.  Controllare se esistono ontologie giá definite online almeno parzialmente
    -   allineamento delle ontologie necessario se non compatibili
    -   matching di ontologie
    -   la corrispondenza non sará mai perfetta
3.  definire `T-box`
4.  definire `A-box`

Strumenti:

-   `Protégé`
-   `CEL`, `FaCT++`


### Situation Calculus {#situation-calculus}

Sulla base della `FOL` contruisce:

-   **Azione**
    -   cambia lo stato del mondo
    -   oggetti immateriali, rappresentate dalle _funzioni_
    -   \\(\text{Move}(O,P\_{1},P\_{2})\\)
-   **Situazione**
    -   stato di cose, solitamente il prodotto di azioni
    -   il tempo non é gestito esplicitamente perché rappresentato dal susseguirsi delle azioni
    -   possiamo rappresentarle con funzioni \\(\text{Do}(\text{seq-az}, S)\\)
        -   sequenza ottenuta applicando la sequenza di azioni nella situazione \\(S\\)
        -   \\(\text{Do}([\\;\\;], S) = S\\)
        -   \\(\text{Do}([a | r], S) = \text{Do}(r, \text{Result}(a,S))\\)
    -   le rappresentazioni \\(\text{Do}\\) ci danno delle `proiezioni`, permettendoci di ragionare sugli effetti delle azioni senza modificare la situazione. Ragionando sugli effetti.
-   **Fluente**
    -   proprietá/predicato che puó cambiare nel tempo
    -   \\(P(A,B,S)\\)
    -   \\(\text{Holds}(P(A,B),S)\\)
        -   formula + situation
-   **Predicato Atemporale**
    -   proprietá/predicato che non é influenzata dalle azioni


#### Assiomi della azioni {#assiomi-della-azioni}

1.  `applicabilitá`, proprietá che devono valere nella situazione di partenza
    -   \\(\forall \text{params},s: \text{Applicable}(\text{Action}(\text{params}),s) \iff \text{Precond}(\text{params},s)\\)
2.  `effetto`, proprietá che devono valere nella situazione di arrivo
    -   la soluzione semplice di riportare solamente le modifiche dello stato da parte dell'azione
    -   `frame problem`
3.  `frame`
    -   \\(\forall \text{params},s,\text{vars}: \text{Fluent}(\text{vars},s) \land \text{params} \neq \text{vars} \implies \text{Fluent}(\text{vars}, \text{Result}(\text{Action}(\text{params}),s}))\\)
4.  `Assioma di Stato Successore`
    -   aggiunto per sostituire gli `assiomi di frame`
    -   `Azione Applicabile` \\(\implies\\) =
        -   (Fluente vero nella= \\(s\\) `risultante` \\(\iff\\) `l'azione lo rendeva vero` \\(\lor\\) `era vero e l'azione non l'ha reso falso)`


#### Anomalia di Sussman {#anomalia-di-sussman}

_Perseguimento di goal complessi_

1.  suddividere il _goal_ in sottogoal
2.  raggiungere i _sottogoal_ sequenzialmente

> Non tutti i _goal_ possono essere risolti suddividendoli prima in subgoal e affrontandoli in maniera sequenziale.

{{< figure src="/ox-hugo/sussman-anomaly.jpg" >}}


## Agente {#agente}

Ciclo di vita:

1.  ha una percezione / ha un input
2.  delibera / costruisce la risposta
3.  agisce / restituisce la risposta

{{< figure src="/ox-hugo/agent-loop.png" >}}

L'_agente_ vive una `sequenza percettiva`, ovvero la storia completa delle percezioni


### Deliberazione {#deliberazione}

Definibile come una \\(f\\) in forma tabellare

-   sequenza percettiva | azione

Si misura la _prestazione_

-   misura la bontá degli stati attraversati
-   un'altra \\(f\\) che data una _sequenza percettiva_ e valuta un _valore di bontá_

Queste considerazioni ci servono per definera la razionalitá del comportamento dell'agente.

-   un agente razionale effettua azioni che lo avvicinano al proprio _goal_ <span class="underline">nei limiti dell'informazione a esso disponibile</span>


### Ambiente {#ambiente}

-   `Task Environment`
    -   contesto in cui l'agente é inserito
    -   fisico o meno
-   `PEAS`, definiscono il `Task Environment`
    -   performance
    -   environment
    -   actuators
    -   sensors

Distinzione tra

-   dinamico / statico
-   monoagente / multiagente
    -   in un sistema costituito da un insieme di agenti questi possono collaborare o competere nell'uso delle risorse e nel perseguimento dei prorpi obiettivi
    -   va sviluppato un `protocollo di interazione` che permetta di coordinare piú agenti
        -   attraverso scambi di messaggi
        -   `FIPA` - Foundation for Intelligent Physical Agents
            -   ha definito una semantica per i messaggi tra agenti e ha standardizzato dei protocolli


### Architettura {#architettura}

Un'_agente_ é l'unione di _programma_ e _architettura_:

-   `architettura`, specifica degli elementi strutturali e funzionali
-   `programma`, funzione che mette in relazione percezioni e azioni

Si distingue anche tra:

-   `funzione agente`, input la sequenza percettiva (storia delle percezioni)
-   `programma agente`, input la percezione corrente

Tipologie:

-   **agenti reattivi semplici**
    -   reagisce alla percezione immediata
    -   si basa sulla _percezione corrente_
    -   funzionano in ambienti <span class="underline">completamente osservabili</span>
    -   per evitare `loop` si introducono comportamenti `random`
-   **agenti reattivi basati su modello**
    -   agisce tramite _modello - sequenza percettiva - storia delle azioni_
    -   mantiene uno `stato`
    -   di base sempre un `if - then`
-   **agenti guidati dagli obiettivi** - _goal-driven_
    -   l'azione o piano di azione dell'agente é volto ad avvicinarlo all'_obiettivo_
    -   cambiando gli obiettivi dell'agente posso fargli realizzare diversi comportamenti
-   **agenti guidati dall'utilitá** - _utility-driven_
    -   l'agente puó scegliere approcci diversi in base a parametri esterni
    -   utilitá calcolabile
-   **agenti capaci di apprendere**
    -   la parte di apprendimento é caratterizzata da 3 elementi:
        -   _critico_
            -   valuta il livello di prestazione decidendo se attivare l'apprendimento
        -   _modulo dell'apprendimento_
            -   modifica la conoscenza dell'agente
        -   _generatore di problemi_
            -   causa l'esecuzione di azioni esplorative


## Apprendimento Automatico {#apprendimento-automatico}

{{< figure src="/ox-hugo/machine-learning.png" >}}

Molte tipologie diverse:

-   classificatori a regole
-   k-nearest neighbour
-   classificatori bayesiani
-   reti neurali
-   support vector machines
-   ensemble methods
-   regressione


### Classificazione {#classificazione}

Dati \\(\rightarrow f \rightarrow\\) Classe

-   questa \\(f\\) é il risultato dell'apprendimento

Tra i dati forniamo _esempi_ ma anche le _categorie_.
Costruisco un `Learning Set` costruito da coppie

-   istanza \\(x\\) - classe \\(y\\)
    -   le istanze sono tuple
-   é supervisionato
-   il rischio é che questo set di apprendimento sia troppo _specialistico_
    -   non riconoscerá l'intera classe ma solamente una sua specializzazione

Con cui eseguo l'[Apprendimento Supervisionato]({{< relref "apprendimento_supervisionato.md" >}})

-   implementata tramite un **algoritmo di apprendimento**
-   il **modello** viene costruito da questo
-   il **modello** viene poi utilizzato per la _predizione_

Si pongono subito dei problemi:

1.  rappresentazione dei dati/istanze
2.  analisi dei dati
3.  utilizzo della conoscenza costruita

Schema:

-   `Training Set` \\(\rightarrow\\) Induzione \\(\rightarrow\\) Modello
-   `Test Set` \\(\rightarrow\\) Deduzione \\(\rightarrow\\) Classe

I modelli si caratterizzano in:

-   predittivi
    -   strumento di previsione
    -   assegna una appartenenza a istanze ignote
-   descrittivi
    -   strumento esplicativo
    -   evidenzia caratteristiche che distinguono le categorie


#### Attributi {#attributi}

Gli attributi sono distinguibili in classi diverse

-   `binari`
-   `nominali`
    -   assumono delle _etichette_ distinte
    -   definiti in un insieme
    -   _spit_
        -   multivalore
            -   un nodo per ogni etichetta
        -   binario
            -   un nodo per una etichetta e uno per le rimanenti
-   `ordinali`
    -   sono nominali in cui vale una relazione di ordinamento tra le etichette
    -   _spit_
        -   multivalore
        -   binario
            -   possibile ma deve preservare l'ordinamento
-   `continui`
    -   si identifica un valore rispetto il quale fare _split_
        -   in base a questo l'attributo diviene binario


#### Matrice di Confusione {#matrice-di-confusione}

É uno strumento di valutazione in ambito della classificazione.
Consiste nel mettere alla prova il _modello_.
Consiste in un insieme di _istanze_

-   `Test Set`
-   hanno la stessa forma del `Learning Set`
-   il modello restituisce una classificazione di tutte le istanze
    -   poi esaminate e suddivise in _corrette_ e _sbagliate_
    -   la percentuale desiderata di classificazioni corrette é relativo all'ambito, il dominio

La `matrice di confusione` é una matrice quadrada

-   numero di righe/colonne come il <span class="underline">numero delle classi</span>
    -   righe, <span class="underline">classi reali</span>
    -   colonne, <span class="underline">classi predette</span>
    -   il \\(v\\) in una cella \\(\langle c\_{i},c\_{j} \rangle\\)
        -   numero di istanze appartenenti a \\(c\_{i}\\) che il modello ha detto appartenere a \\(c\_{j}\\)
        -   desideriamo che i \\(v\\) si accumulino nella diagonale, dove troviamo le risposte corrette

{{< figure src="/ox-hugo/confusion-matrix.png" >}}

Si hanno due considerazioni sui risultati:

-   `accuracy`

\\[\frac{\sum\_{i} v\_{ii}}{\sum\_{i,j} v\_{ij}}\\]

-   `error rate`

\\[\frac{\sum\_{i \neq j} v\_{ij}}{\sum\_{i,j} v\_{ij}}\\]

Chiaramente \\(\text{acc} + \text{er} = 100\\%\\)

Il limite della matrice di confusione é che gli errori hanno tutti lo stesso peso.

-   per sopperire a questo si puó aggiungere una `matrice dei costi`
    -   ha la stessa forma della `matrice di confusione`
    -   gli errori saranno poi moltiplicati per questi pesi per valutare il modello

Altro limite é che su `test set` sbilanciati gli _error rate_ saranno falsati.


#### Classificazioni a Regole {#classificazioni-a-regole}

Regole della forma

-   antecedente
    -   attributi, operazioni, valori
-   conseguente
    -   classe di appartenenza

Qualita' di una regola valutata tramite

-   **copertura**  \\(\frac{|A|}{|D|}\\)
-   **accuratezza**  \\(\frac{|A \cap y|}{|A|}\\)

dove

-   \\(A\\) istanze che soddisfano l'antecedente
-   \\(D\\) dataset
-   \\(y\\) sotto insieme di \\(D\\) di una particolare classe

Si desiderano

-   regole mutualmente esclusive
    -   attivate da insiemi di esempi disgiunti
    -   se le regole non lo sono si utilizzano
        -   **liste di decisione**
            -   si decide in ordine di priorita'
        -   **insiemi non ordinati**
            -   si decide secondo una votazione / conteggio
-   regole esaustive
    -   ogni possibile combinazione di valori degli attributi e' catturata
    -   se manca l'esaustivita' cio' implica che alcuni casi non saranno classificabili
        -   in questi casi si definisce una classe di `default`

Le regole vengono ordinate secondo gli antecedenti o le classi.

Le regole sono <span class="underline">prodotte</span>

-   indirettamente
    -   estraendole da un albero di decisione
-   direttamente
    -   **Sequential Covering**


##### Sequential Covering {#sequential-covering}

-   _focus_ su una classe alla volta, le altre sono considerate contro-esempi
-   ogni ciclo produce una regola
    -   e vengono rimosse le istanze riconosciute da questa regola
    -   **Learn one Rule**
        -   `general-to-specific`
            -   a partire dalla regola piu' generale \\(\text{True}=y\\)
            -   si aggiungono all'antecedente in `and` delle specifiche, con le tecniche di scelta dello _split_
        -   `specific-to-general`
            -   scegliendo in modo casuale un esempio della classe definisce
            -   valori dell'esempio
            -   numero dei congiunti secondo gli attributi descritti dall'istanza
            -   per generalizzare si eliminano dei congiunti utilizzando le tecniche di scelta dello _split_
-   le regole prodotte andranno poi utilizzate <span class="underline">nell'ordine in cui sono prodotte</span>


#### Valutazione {#valutazione}

Il modello costruito e' buono o no?

-   se non lo e', qual'era il problema
    -   parametri
    -   algoritmo
    -   classificatore
    -   `learning set`

Ci sono diversi metodi di valutazione di un modello costruito tramite un algoritmo, e' importante per la valutazione partendo da un `dataset` distinguere un `learning` e un `test set` nella maniera migliore possibile:

-   **Holdout**
    -   partizione dei dati disponibili in `LS` e `TS`
    -   se la partizione e' sbilanciata si va verso _over_ o _under_ fitting
-   **Random subsampling**
    -   si ripete il processo di **holdout** piu' volte
    -   ripetendo piu' volte l'apprendimento
    -   si fa una media delle valutazioni dei modelli generati
        -   si valuta il classificatore in maniera piu' oggettiva
        -   si cerca di liberare la valutazione dall'aleatorita' dei partizionamenti
-   **Cross-validation**
    -   si fa **random subsampling** ma con dati piu' omogenei
    -   \\(K\\) fold cross validation
        -   con \\(K\\) partizioni
    -   \\(1\\) dei set e' usato come `TS`
    -   \\(K-1\\) dei set sono accorpati in `LS`
    -   uno per volta tutti i \\(K\\) set sono utilizzati per il testing
    -   alla fine si fa una media delle valutazioni
-   **Bootstrap**
    -   in casi in cui il `dataset` é piccolo
    -   per il `LS` si scelgono istanze dal `dataset` ma senza rimuoverle da quest'ultimo
        -   una stessa istanza puó apparire piu' volte nel `LS`
    -   per il `TS` si scelgono le istanze con cui non si e' fatto apprendimento
    -   questo viene ripetuto e valutato a piacere, facendo la media

Tutte queste tecniche si usano nella valutazione dell'algoritmo usato rispetto al problema.
<span class="underline">In generale</span>, per singoli modelli diversi costruiti con algoritmi diversi, <span class="underline">non si puó contare sul fatto che i test siano stati fatti sugli stessi sotto-insieme di dati</span>.

-   nella valutazione quindi i risultati non possono che essere probabilistici
-   si ottiene un'_intervallo di confidenza_
-   altro parametro di una valutazione é il _livello di confidenza_


#### Split &amp; Entropia {#split-and-entropia}

La `scelta dello split` viene effettuata considerando l'impatto o `entropia`

-   generalmente, alberi compatti sono preferibili ad alberi con un numero di test maggiori
    -   meno classi sono rappresentate in un nodo figlio meno confuso e' l'insieme e migliore e' lo _split_
-   il **Rasoio di Occam** puo' essere utilizzato come criterio per la scelta
    -   _a parita' di assunzioni la spiegazione piu' semplice e' la preferita_

Altri metodi di misura della bonta' di un _split_ sono i `Gini` e `Errori di classificazione`.

Misure di selezione:

-   \\(p(i\mid t)\\)
    -   \\(i\\) classe
    -   \\(t\\) insieme
    -   probabilita' che l'elemento appartenga alla classe \\(i\\)

Si puo' calcolare una <span class="underline">distribuzione di probabilita'</span> di appartenenza di un record estratto casualmente.
\\[\text{Entropy}(t) = - \sum\_{i=0}^{c-1} p(i \mid t) \log\_{2}p(i\mid t)\\]

-   e' assunto che \\(0 \log\_{2} 0 = 0\\)
-   \\(E=0\\) e' il caso migliore, con distribuzioni \\((0,1)\\) o \\((1,0)\\)
-   \\(E=1\\) e' il caso peggiore con distribuzione \\((0.5,0.5)\\)

Il calcolo della bonta' di uno _split_, o calcolo del **guadagno**
\\[\Delta = I(\text{parent}) - \sum\_{j=1}^{k}\frac{N(v\_{j})}{N} I(v\_{j})\\]

-   \\(I\\) e' l'impurita'
-   \\(N\\) numero recond/istanze del nodo genitore
-   \\(N(v\_{j})\\) numero record/istanze del nodo figlio \\(j\\) -esimo

Nel caso della misura, utilizzando l'entropia si calcola l'**information gain**
\\[\Delta = E(\text{parent}) - \sum\_{j=1}^{k}\frac{N(v\_{j})}{N} E(v\_{j})\\]


#### Overfitting {#overfitting}

Anche **errore di generalizzazione**.

Se il `Learning Set` manca di esempi oppure contiene _noise_, errori di classificazione, il modello generato puo' mancare di generalita'.
Il modello _ideale_ e' quello che produce il minor errore di generalizzazione possibile.

Il problema dell'overfitting si affronta diminuendo i test, rendendo meno specifico l'albero.
Per questo si utilizzano tecniche di `pruning`, potatura.

-   `prepruning`
    -   si interrompe la costruzione del `DT` prima che sia completo
    -   si ha una <span class="underline">regola di terminazione</span> restrittiva
        -   non si esegue lo split se il gain e' sotto una soglia
    -   si puo' ricadere nel problema opposto del _underfitting_
-   `postpruning`
    -   lavora su albero costruiti completamente
    -   con un insieme di dati supervisionati lo si analizza
        -   i <span class="underline">rami poco percorsi si rimuovono</span>, si riducono a foglie
    -   si spreca del lavoro fatto


### Alberi di Decisione {#alberi-di-decisione}

`Decision Trees`
Banalmente, in un altro contesto, un menú a tendina.

-   si tratta di un albero con _test_ per nodi e _azioni_ per foglie
    -   test portano in base ai risultati a test successivi o foglie
    -   alle  foglie si decide la classe di appartenenza dell'istanza

Le istanze hanno la stessa forma

-   n-attributi organizzati in una n-tupla

I _test_ sono ognuno su un singolo attributo e a cascata caratterizzano le istanze.

{{< figure src="/ox-hugo/decision-tree.png" >}}


#### Algoritmo di Hunt {#algoritmo-di-hunt}

**L'algoritmo di Hunt** lavora sul `Learning Set`

-   dividendo il sottoinsiemi via via piú puri
-   \\(D\_{t}\\) sottoinsieme del `LS` associato al nodo \\(t\\)
-   \\(y = \\{y\_{1},y\_{2},\cdots,y\_{c}\\}\\) insieme delle etichette delle classi

Passi:

1.  <span class="underline">test</span> se tutte le istanze in \\(D\_{t}\\) appartengono alla stessa classe
    -   `true`: \\(t\\) é una _foglia_ e le viene assegnata l'etichetta \\(y\_{t}\\)
    -   `false`: si sceglie un attributo descrittivo su cui fare lo _split_
        1.  si verifica il suo range in \\(D\_{t}\\)
        2.  si crea un _nodo successore_ per ogni suo possibile valore
        3.  a ogni successore si assegna il sottoinsieme di \\(D\_{t}\\) per cui l'attributo scelto vale quello cui il successore é associato


### Lazy Learning {#lazy-learning}

> **Definition** \\(\quad\\) _Lazy Learning_ in machine learning is a learning method in which generalization beyond the training data is delayed until a query is made to the system, as opposed to in _Eager Learning_, where the system tries to generalize the training data before receiving queries. Lazy learning is essentially an instance-based learning: it simply stores training data (or only minor processing) and waits until it is given a test tuple.

Un _lazy learner_ <span class="underline">non costruisce un modello</span> con i dati di apprendimento ed é di semplice implementazione.
Un esempio di questi é `K-NN`.

-   `k-Nearest Neighbours`

Condividere caratteristiche é un'importante indicatore di una stessa classe di appartenenza.

-   somiglianza \\(\rightarrow\\) stessa classe
    -   a livello matematico significa _vicinanza numerica_
-   le somiglianze sono trovate _avendo memorizzato_ il `LS`

Si rappresentano come punti in uno spazio \\($n\\)-dimensionale le istanze:
\\[i = \langle v\_{1}, v\_{2}, \cdots , v\_{n} \rangle\\]

Questi punti vengono rapportati rispettivamente ai \\(k\\) punti piú vicini in funzione della loro distanza.

-   un punto vicino a tutti punti di una stessa classe viene classificato/predetto come in quella classe
-   in caso di discordanza della classe dei vicini ci sono diverse implementazione
    -   _votazione_, vince la maggioranza ma si perde l'informazione sulla distanza
    -   _votazione pesata_, voti pesati rispetto alla distanza
-   attributi di domini diversi possono avere cifre significative diverse
    -   nella memorizzazione <span class="underline">gli intervalli degli attributi vanno normalizzati</span>
    -   si effettuano le necessarie approssimazioni per creare una relazione tra _distanza_ e _similitudine_

\\[y = \text{argmax}\_{v} \sum\_{x\_{i},y\_{i}}^{k} \frac{I(v=y\_{i})}{d(x', x\_{i})^{2}}\\]
dove, ciclando su \\(i\\):

-   \\(x'\\) dato da classificare
-   \\(y\\) classe risultato
-   \\(y\_{i}\\) classe dell'istanza \\(x\_{i}\\)
-   \\(x'\\) \\(n\\)-tupla da classificare
-   nominatore: somma dei voti per la classe \\(y\_{i}\\)
-   denominatore: divisione per peso calcolato sulla distanza

{{< figure src="/ox-hugo/knn-algorithm.png" >}}


### Neural Network {#neural-network}


#### Perceptron {#perceptron}

Prima proposta di _modello di neurone artificiale_

-   ispirazione dalla biologia
-   il piú semplice `Neural Network` possibile

Struttura:

-   \\(n\\) input \\(x\_{i}\\)
    -   ciascuno con un peso \\(w\_{i}\\)
    -   formano una tupla di ingresso \\(\langle x\_{1},x\_{2},\cdots ,x\_{n} \rangle\\)
-   un output \\(y\\)
-   memoria - unitá computazionale centrale
    -   \\(f(\text{net})\\) funzione di attivazione con \\(\theta\\) soglia di attivazione.

\\[\text{net} = \sum\_{i=1}^{n} w\_{i}x\_{i}\\]
\\[f(\text{net}) = \begin{cases}1 \quad \text{net}\ge \theta \\\ 0 \quad \text{altrimenti} \end{cases}\\]

{{< figure src="/ox-hugo/perceptron.png" caption="<span class=\"figure-number\">Figure 1: </span>definizione di un perceptron" >}}

Questa discontinuitá sulla soglia é stata sostituita successivamente da una sigmoide.
\\[f(\text{net}) = \frac{1}{1 + e ^{-\alpha(\text{net}- \theta)}}\\]
![](/ox-hugo/sigmoid-curve.png)

Il percettrone codifica un _test lineare_. Delinea un iperpiano/iperspazio che divide lo spazio in due metá

-   nelle vicinanze del confine la sigmoide transiziona da 1 a 0

L'apprendimento consiste nel trovare il taglio che divida le classi

-   questo si fa <span class="underline">apprendendo i pesi</span> \\(w\_{i}\\) necessari per la classificazione corretta
-   tramite `Learning Set` supervisionato

\\[w\_{j}^{k+1} = w\_{j}^{k} + \alpha (d - o) x\_{j}\\]

-   \\(\alpha \in [0,1]\\) _learning rate_
-   \\(o\\) output restituito per la tupla di input
-   \\(d\\) output desiderato
-   se \\(o \neq d\\) il percettore ha fatto un errore \\(d-o\\)

I \\(w\_{j}\\) sono prodotti incrementalmente tramite questo processo e sono deposizione della conoscenza dell'apprendimento.

-   l'apprendimento si ferma quando i cambiamenti ai pesi rallentano

{{< figure src="/ox-hugo/perceptron-learning.jpg" caption="<span class=\"figure-number\">Figure 2: </span>processo di learning di un perceptron" >}}


##### Limiti {#limiti}

Rappresentazione dello `XOR`

| x | y | \\(\oplus\\) |
|---|---|--------------|
| 1 | 1 | -            |
| 1 | 0 | +            |
| 0 | 1 | +            |
| 0 | 0 | -            |

Non é risolvibile da un singolo perceptron, solo con tecniche piú sofisticate utilizzandone un altro.
![](/ox-hugo/perceptron-xor.png)


#### Multilayer Perceptron {#multilayer-perceptron}

`MLP`

Si moltiplicano i `perceptron` posizionandoli in cascata e dividendoli per funzione

-   _output_
    -   \\(n\\) come le classi
    -   questi neuroni danno output rispetto la class di appartenenza
-   _hidden_
-   _input_

I dati viaggiano in un'unica direzione e é _pienamente connessa_

-   tutti i neuroni di un livello sono collegati a tutti quelli dello strato successivo

{{< figure src="/ox-hugo/multilayer-perceptron.png" caption="<span class=\"figure-number\">Figure 3: </span>struttura di un multilayer perceptron" >}}

I livelli di percettori _hidden_ possono identificare regioni dello spazio dei dati piú complesse

1.  traccia confini
2.  identifica forme chiuse
3.  identifica regioni cave all'interno delle precedenti forme chiuse


##### Epoca di Apprendimento {#epoca-di-apprendimento}

-   passata _forward_ individua con le tuple del `Learning Test` l'_errore_
-   passata _backward_ propaga l'informazione dell'errore a ritroso nella rete
    -   aggiornando i pesi

Si utilizza il metodo di apprendimento noto come **Discesa del Grandiente**.
\\[\Delta w\_{ij} = - \lambda \frac{dE(\overline w)}{d w\_{ij} }\\]

-   \\(E(\overline w)\\) matrice dei pesi
-   si identifica la _direzione_ in cui le configurazioni dei pesi si sviluppano rispetto all'errore
    -   lo si abbassa minimizzando l'errore

L'apprendimento nel `MLP` si puó sviluppare in 2 casi

1.  neurone di _output_ \\(o\\) e neurone _hidden_ \\(i\\) collegato direttamente a \\(o\\)
    -   si calcola direttamente l'errore con la differenza
    -   \\(\Delta w\_{ji} = \alpha \delta^{j} x\_{ji}\\) --- variante di peso
    -   \\(\delta^{j} = y (1-y)(t-y)\\) --- viene distribuito sui predecessori
        -   \\(y (1-y)\\) derivata \\(f\\) errore
        -   \\(t-y\\) errore
2.  neurone dello strato _hidden_ \\(k\\) a metá tra neuroni _hidden_ o _input_ \\(i\\) e altri _hidden_ oppure _output_
    -   propaghiamo verso \\(i\\)
    -   \\(\Delta w\_{ki} = \alpha \delta^{k} x\_{ki}\\) --- variante di peso
    -   \\(\delta^{k} = y (1-y) \sum\_{j\in I} \delta^{j} w\_{kj}\\)
        -   l'errore di questo livello dipende dall'errore fatto negli errori piú profondi
        -   **backpropagation** o **retropropagazione dell'errore**

[^fn:1]: i.e. a costo minimo
[^fn:2]: Se il dominio \\(D\\) é un insieme illimitato e se qualche formula \\(P\\) dell'insieme considerato contiene dei quantificatori, per determinarne il valore di veritá sarebbe necessario calcolare il valore di veritá delle infinite formule
[^fn:3]: **NB** nella parte sinistra e destra le \\(p\\) e \\(q\\) contengono variabili e/o costanti
[^fn:4]: una `KB` senza funzioni
[^fn:5]: \\(\Theta\\) unificatore di \\(l\_{i}\\) e \\(\lnot m\_{j}\\)
[^fn:6]: esistenziali _in scope_ di universali
[^fn:7]: i.e. `RDF` e `OWL`