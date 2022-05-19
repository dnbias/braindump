+++
title = "Sistemi Intelligenti"
author = ["Daniel Biasiotto"]
date = 2022-02-28T14:23:00+01:00
tags = ["university"]
draft = false
+++

Professoressa: Cristina Baroglio


## Terminologia {#terminologia}

-   **AI** coniato da [John McCarthy]({{< relref "john_mccarthy.md" >}})
-   **Dato**, simbolo grezzo
-   **Informazione**, un dato elaborato
-   **Conoscenza**, campo di informazioni correlate tra loro
-   **Automazione**,
-   **Autonomia**,


### Automazione {#automazione}

Campo in cui l'informatico piu' in generale viene applicata

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
-   in cui c'e' molteplicita' di soluzioni
-   con dati di natura simbolica
-   si ha una conoscenza ampia e completa
-   dove l'informazione e' parzialmente strutturata


### Comprensione {#comprensione}

Output attesi \\(\implies\\) comprensione? [John R. Searle]({{< relref "john_r_searle.md" >}})


### Test di Turing {#test-di-turing}

-   test per definire se un computer e' intelligente, o se un programma lo e'
    -   in linguaggio naturale
-   per T lo e' quando inganna l'uomo, imitando il comportamento umano
-   un computer che deve passare il test non eseguira' gli ordini direttamente, in quanto questi vanno filtrati rispetto alle capacita' di un umano
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

Un problema puó essere definito formalmente come una tupla di 4 elementi

-   Stato iniziale
-   Funzione successore
-   Test Obiettivo
-   Funzione del costo del cammino


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


### Algoritmi {#algoritmi}


#### Ricerca non informata - Blind {#ricerca-non-informata-blind}

Costruiscono strutture dati proprie utilizzate nella soluzione di un problema

-   alberi o grafi di ricerca
    -   in un albero uno stato puó comparire piú volte

Ogni nodo rappresenta uno stato, una soluzione é un particolare percorso dalla radice ad una foglia

-   i nodi figli sono creati dalla funzione successore
    -   questi sono creati mantenendo un puntatore al padre

Gli approcci sono valutati secondo

-   completezza
-   ottimalitá
-   complessitá temporale
-   complessitá spaziale

Gli alberi vengono esplorati tramite `Ricerca in Ampiezza` e `Ricerca in Profonditá`

Nello studio di queste ricerche si considerano:

-   \\(d\\) profondita' minima del goal
-   \\(b\\) branching factor

Un goal a meno passi dalla radice non da' garanzia di ottimalita', in quanto vanno considerati i costi non il numero di passi.
Il costo e' una funzione monotono crescente in relazione alla profondita'.


##### Ricerca in Ampiezza {#ricerca-in-ampiezza}

\\(O(b^{d+1})\\)

-   complessitá sia spaziale che temporale
-   esponenziale, non trattabile anche con \\(d\\) ragionevoli


##### Ricerca Costo Uniforme {#ricerca-costo-uniforme}

Cerca una soluzione ottima, che non in tutti i problemi corrisponde a il minor numero  di passi.
La scoperta di un goal non porta alla terminazione della ricerca. Questa termina solo quando non possono esserci nodi non ancora scoperti con un costo minore di quello gia' trovato.

La ricerca puo' non terminare in caso di `no-op`, che creano loop o percorsi infiniti sempre allo stesso stato.
Quindi:
\\(\text{costi} \ge \epsilon > 0\\)

-   \\(\epsilon\\) costo minimo

\\[O(b^{1+\lfloor \frac{C^{\*}}{\epsilon} \rfloor})\\]

-   \\(C^{\*}\\) costo soluzione ottima


##### Ricerca in Profonditá w/ Backtracking {#ricerca-in-profonditá-w-backtracking}

Si producono successori su successori man mano, percorrendo in profondita' l'albero.
In fondo, in assenza di goal, viene fatto backtracking cercando altri successori degli nodi gia' percorsi.

-   viene esplorato un ramo alla volta, in memoria rimane solo il ramo che sta venendo esplorato
-   piu' efficiente in utilizzo della memoria


##### Ricerca in Profonditá w/o Backtracking {#ricerca-in-profonditá-w-o-backtracking}

Si esplora espandendo tutti i figli ogni volta che viene visitato un nodo non goal

-   viene utilizzato uno `stack` (`LIFO`)


##### Iterative Deepening {#iterative-deepening}

Ricerca a profonditá limitata in cui questa viene incrementata a ogni iterazione

-   cerca di combinare ricerca in profonditá e in ampiezza
    -   \\(\textsc{time}= O(b^d)\\)
    -   \\(\textsc{space}= O(b\cdot d)\\)
    -   completa
    -   ottima quando il costo non é funzione decrescente delle profonditá


##### Ricerca Bidirezionale {#ricerca-bidirezionale}

2 ricerche parallele

-   _forward_ dallo stato iniziale
-   _backwards_ dallo stato obiettivo

Termina quando queste si incontrano a una intersezione.
Il rischio é che si faccia il doppio del lavoro e che non convergano a metá percorso ma agli estremi

-   \\(\textsc{time}= O( b^{\frac{d}{2}})\\)


#### Ricerca informata {#ricerca-informata}

Si possiedono informazioni che permettono di identificare le strade piú promettenti

-   in funzione del costo

Questa informazione é chiamata **euristica**
\\(h(n)\\): Il costo minimo stimato per raggiungere un nodo _preferito_ di \\(n\\)


##### Greedy {#greedy}

-   costruisce un albero di ricerca
-   mantiene ordinata la frontiera a seconda di \\(h(n)\\)

Ma l'euristica puó essere imperfetta e creare dei problemi.
Questa strategia considera solo informazioni _future_, che riguardano ció che non é ancora stato esplorato.


##### A\* {#a}

Combina informazioni future e passate:

-   **Greedy** e **Ricerca a costo uniforme**

Utilizza una funzione di valutazione:
\\(f(n) = g(n) + h(n)\\)

Dove \\(g(n)\\) é il costo minimo dei percorsi esplorati che portano dalla radice a \\(n\\)

I costi minimi reali sono definiti con:
\\(f^{\star}(n) = g^\star(n) + h^\star(n)\\)

-   definizione utilizzata nelle dimostrazioni

\\(A^\star\\) é ottimo quando

-   tutti i costi da un nodo a un successore sono positivi
-   l'euristica \\(h(n)\\) é ammissibile

**Ammissibilitá**

-   \\(\forall n: h(n) \le h^\star(n)\\)
    -   ovvero l'euristica é ottimistica

Nel caso di ricerca in grafi \\(h(n)\\) deve essere anche **monotona consistente** per garantire l'ottimalitá

-   vale una disuguaglianza triangolare
-   \\(h(n) \le c(n,a,n') + h(n')\\)
-   \\(\textsc{nb}\\) tutte le monotone sono ammissibili ma non vale il viceversa

Inoltre é **ottimamente efficiente**

-   espande sempre il numero minimo di nodi possibili

Ma \\(\textsc{space}=O(b^d)\\)


### Euristiche {#euristiche}


#### Calcolo della Bontá {#calcolo-della-bontá}

Per decidere tra 2 euristiche ammissibili quale sia la piú buona

1.  confronto sperimentale
2.  confronto matematico

Si considera la **dominanza**

-   \\(\forall n : h\_2(n) \le h\_1(n)\le h^\star(n)\\)
    -   restituisce sempre valore maggiore rispetto all'altra
-   una euristica dominante sará piú vicina alla realtá

Si puó costruire una nuova \\(h(n) = \max(h\_1(n),\dots,h\_k(n))\\) dominante su tutte quelle che la compongono

Si valuta la qualitá dell'euristica (sperimentalmente) con il _branching factor_ effettivo \\(b^\star\\)

-   si costruisce con gli \\(N\\) nodi costruiti nella ricerca un _albero uniforme_
-   \\(b^\star\\) piccolo \\(\rightarrow\\) euristica efficiente


### Ricerca Con Avversari {#ricerca-con-avversari}

**Informazione** puo' essere

-   perfetta
-   imperfetta

Effetti delle **scelte**

-   deterministici
-   stocastici

La ricerca in questo ambito si basa su delle **strategie** basate su punteggi dati dagli eventi.
Alcuni giochi sono anche a _somma zero_.


#### Teoria delle Decisioni {#teoria-delle-decisioni}

Dall'Economia, poi traslata in algoritmi nell'ambito dell'IA.

-   **approccio maximax** - ottimistico
-   **approccio maximin** - conservativo
-   **approccio minimax regret** - minor _regret_


##### Minimax {#minimax}

`Minimax` e' un algoritmo pessimista nel senso che simula che `Min` si muova in modo perfetto.

-   ricerca in profondita', esplora tutto l'albero ma non mantiene tutto in memoria

Nella simulazione dell'albero di gioco si hanno i due attori

1.  `Max`
2.  `Min`

L'algoritmo fa _venire a galla_ i costi _terminali_ dei rami del gioco, in quanto per guidare la scelta `Max` deve poter scegliere tra i nodi a se successivi.

La funzione utilita' valuta gli stati _terminali_ del gioco, agisce per casi sul nodo \\(n\\) in maniera ricorsiva
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

-   \\(\textsc{space} = O(bm)\\)
-   \\(\textsc{time} = O(b^{m})\\)


###### Potatura alpha-beta {#potatura-alpha-beta}

Si agisce potando le alternative che non potranno cambiare la stima corrente a quel livello.
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
    -   se l'ordine e' sfavorevole e' possibile che non avvengano potature

Esistono tecniche di apprendimento per le _killer move_, il sistema si ricorda le _killer move_ passate e le cerca nelle successive applicazioni.
Queste tecniche sono studiate in quanto la complessita' continua a essere troppo alta per applicazioni `RealTime`:

-   **trasposizioni**
    -   permutazioni dello stesso insieme di mosse
    -   mosse che portano allo stesso stato risultante
    -   vanno identificate ed evitate
-   **classificazione stati di gioco**
    -   per motivi di tempo vanno valutati come foglie nodi intermedi
    -   va valutata una situazione intermedia (_orizzonte_)
        -   valutazione rispetto alla facilita' di raggiungere una vittoria
        -   attraverso un classificatore sviluppato in precedenza
-   **quiescenza** dei nodi
    -   se mantiene la propria valutazione bene nei continuo
    -   non ribalta la valutazione nel giro di poche mosse


### Soddisfacimento di Vincoli {#soddisfacimento-di-vincoli}

`CSP` - Constraint Satisfaction Problems

-   serie di `variabili` di dati dominii
-   `vincolo`, una condizione
    -   é soddisfatto con una dato `assegnamento` che per essere una soluzione deve essere
        1.  completo, tutte le variabili sono assegnate
        2.  consistente, tutti i vincoli sono rispettati

I problemi sono affrontati con approcci diversi in base alle caratteristiche del dominio (valori booleani/discreti/continui)


#### Algoritmi {#algoritmi}


##### Generate and Test {#generate-and-test}

_Bruteforce_

1.  genera un assegnamento completo
2.  controlla se é una soluzione
3.  se si `return` altrimenti `continue`

É estremamente semplice ma non é scalabile.


##### Profonditá con Backtracking {#profonditá-con-backtracking}

Si esplora l'albero delle possibili assegnazioni in profonditá. Si fa backtracking quando si incontra una assegnazione parziale che non soddisfa piú le condizioni
Il problema é che in `CSP` il `branching factor` é spesso molto alto, producendo alberi molto larghi.
Dati \\(n\\) variabili e \\(d\\) media del numero di  valori possibili per una variabile:

-   il `branching fator` al primo livello, \\(n \cdot d\\)
-   ... al secondo, \\((n-1)\cdot d\\)
-   l'albero avrá \\(n! \cdot d^{n}\\) foglie

Questo é migliorabile con la tecnica del _fuoco_ su una singola variabile a ogni livello dell'albero, questo in quanto i `CSP` godono della proprietá commutativa rispetta all'ordine delle  variabili. Questo permette di rimuove il fattoriale nel numero di foglie.

Uno dei difetti di questo approccio é il `Thrashing`, riconsiderando assegnamenti successivi che si sono giá dimostrati fallimentari durante l'esplorazione.


##### Forward Checking {#forward-checking}

Approccio locale di propagazione della conoscenza.
Si propagano le scelte delle variabile ai vicini diretti, restringendo il dominio di questi vicini. In caso di individuare una inconsistenza se esiste.


##### AC-3 {#ac-3}

`Arc Consistency` - McWorth

-   funziona con vincoli binari
-   simile al Forward Checking
-   `Arc Consistency` non é una proprietá sufficiente a garantire l'esistenza di una soluzione

<!--listend-->

```python
def AC-3(csp): // returns CSP ridotto
    queue = csp.arcs
    while queue != empty:
        (xi,xj) = queue.RemoveFirst()
        if (RemoveInconsistentValues(xi,xj)):
            for (xk in xi.neighbours):
                queue.Add(xk,xi)


def RemoveInconsistentValues(xi,xj): // returns boolean
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
-   un territorio deve avere colore diverso da tutti i vicini


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
        -   per ogni caso di \\(F\_{1}\\) vale anche \\(F\_{2}: F\_{1}\_{}\_{} \vDash F\_{2}\\)
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
        -   \\(KB \vdash\_{i} A \implies KB \vDash A\\)
    2.  completezza
        -   \\(KB \vDash\_{} A \implies KB \vdash\_{i} A\\)

<!--listend-->

-   **Grounding**


### Semantica {#semantica}

-   \\(KB\_{LP}\vDash P\_{LP}\\)

Vari approcci:

1.  Model Checking
    -   \\(n\\) simboli, \\(2^{n}\\) modelli possibili
2.  Theorem Proving
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

-   questo é utilizzato nella dimostrazione per refutazione


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

I modelli di un insieme di formule del prim'ordine <span class="underline">possono essere infiniti</span>.[^fn:1]
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
    -   **Modus Ponens Generalizzato**[^fn:2]

\\[\frac{p\_{1}',\cdots ,p\_{n}' \qquad p\_{1} \land \cdots \land p\_{n} \implies q}{\text{subst}(q,\Theta)}\\]

-   \\(\Theta\\) é un unificatore di ciascuna coppia \\(\langle p\_{i}', p\_{i} \rangle\\) per cui \\(p\_{i}' \theta = p\_{i} \theta\\) per ogni \\(i\in [1,n]\\)
-   `Unification` (Martelli/Montanari)
    -   algoritmo di ricerca che date due formule trova la sostituzione \\(\theta\\) piú generale che le unifichi
-   `Forward Chaining`
    -   **Corretto** e **Completo** se la `KB` é una `DATALOG`[^fn:3]
        -   in caso contrario il caso negativo puó non terminare
-   `Backward Chaining`
    -   stesse considerazioni del `FC` ma piú efficiente

<!--listend-->

-   `Lifting` della Risoluzione[^fn:4]
    -   \\(\frac{l\_{1}\lor \cdots \lor l\_{k} \qquad m\_{1} \lor \cdots \lor m\_{n}}{\text{subst}(\Theta, l\_{1} \lor \cdots \lor l\_{i-1} \lor l\_{i+1} \lor \cdots \lor l\_{k} \lor m\_{1}  \lor \cdots \lor m\_{j-1} \lor m\_{j+1} \lor \cdots \lor m\_{n})\\)
    -   \\(KB\_{\text{FOL}} \rightarrow\_{\text{traduzione}}  KB\_{\text{FOL-CNF}}\\)
        1.  Eliminazione delle **implicazioni**
        2.  Spostamento delle **negazioni all'interno** (\\(\lnot \forall \equiv \exists \lnot\\))
        3.  **Standardizzazione** delle variabili (rinomina variabili ambigue)
        4.  **Skolemizzazione** (eliminazione degli \\(\exists\\))[^fn:5]
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
2.  \\(O\_{1}\\) e \\(O\_{2}\\) sono <span class="underline">equivalenti</span>; condividono vocabolario e proprietá ma sono espresse in linguaggi diversi[^fn:6]
3.  \\(O\_{1}\\) estende \\(O\_{2}\\); vocabolari e proprietá di \\(O\_{2}\\) sono preservati in \\(O\_{1}\\) ma non viceversa
4.  `Weakly-Translatable`
    -   non si introducono inconsistenze
5.  `Strongly-Translatable`
    -   il vocabolario di `Source` é completamente mappabili in concetti di `Dest`
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

Sulla basa della `FOL` contruisce:

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
    -   \\(\forall \text{params},s,\text{vars}: \text{Fluent}(\text{vars},s) \land \text{params} \neq \text{vars} \implies \text{Fluent}(\text{vars}, \text{Result}(\text{Action(\text{params}),s}))\\)
4.  `Assioma di Stato Successore`
    -   aggiunto per sostituire gli `assiomi di frame`
    -   `Azione Applicabile` \\(\implies\\) `(Fluente vero nella` \\(s\\) `risultante` \\(\iff\\) `l'azione lo rendeva vero` \\(\lor\\) `era vero e l'azione non l'ha reso falso)`


#### Anomalia di Sussman {#anomalia-di-sussman}

_Perseguimento di goal complessi_

1.  suddividere il _goal_ in sottogoal
2.  raggiungere i _sottogoal_ sequenzialmente

> Non tutti i _goal_ possono essere risolti suddivedendoli prima in sottogoal e affrontandoli in maniera sequenziale.

[^fn:1]: Se il dominio \\(D\\) é un insieme illimitato e se qualche formula \\(P\\) dell'insieme considerato contiene dei quantificatori, per determinarne il valore di veritá sarebbe necessario calcolare il valore di veritá delle infinite formule
[^fn:2]: **NB** nella parte sinistra e destra le \\(p\\) e \\(q\\) contengono variabili e/o costanti
[^fn:3]: una `KB` senza funzioni
[^fn:4]: \\(\Theta\\) unificatore di \\(l\_{i}\\) e \\(\lnot m\_{j}\\)
[^fn:5]: esistenziali _in scope_ di universali
[^fn:6]: i.e. `RDF` e `OWL`