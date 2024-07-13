+++
title = "IALAB"
author = ["Daniel Biasiotto"]
date = 2024-02-29T18:46:00+01:00
tags = ["ai", "master", "university"]
draft = false
+++

-   Professori:
    -   Roberto Micalizio


## Prolog {#prolog}

-   esecuzione mediante _backward chaining_ in profondità (riguardo l'esplorazione dell'albero)
-   si parte dal _goal_ da derivare
    -   il goal è congiunzione di formule atomiche
        -   \\(G\_1,G\_2,\dots,G\_n\\)
    -   dimostrazione mediante **risoluzione** che il goal segue dal programma
-   regola \\(A:- B\_1,B\_2,\dots,B\_m\\) applicabile a \\(G\_i\\) se
    -   le variabili vengono rinominate
    -   \\(A\\) e \\(G\_i\\) unificano, l'interprete prolog fa _pattern matching_ sulla testa della regola
-   Most General Unifier (`MGU`)
    -   fa il minimo numero di instanziazioni per unificare
    -   \\(\sigma = \\{X/Y\\}\\) ad esempio

**Formulazione non deterministica** dell'interprete:

```pascal
interprete(G):
if G vuoto
   then successo
   else sia G = G1,G2,...,GN
      sia R insieme delle clausole applicabili a G_1
      if R vuoto
         then fallimento
         else scegliere clausola A :- B1,B2,...,BM in R
            sia sigma il MGU di G1 di A
            inteprete(B1sigma,B2sigma,...,BMsigma,G2sigma,...,GNsigma)
```

Prolog la rende deterministica scegliendo le clausole in ordine di scrittura del programma, in caso di fallimento continua con il backtracking a cercare una soluzione.

Prolog implementa un metodo di prova **corretto e completo**

-   la risoluzione `SLD`
    -   parte sempre dal goal e una (la prima) clausola che unifica
    -   ogni passo fa risoluzione tra la risolvente (risultato del passo prima) e una delle clausole iniziali
    -   corretta e completa se si limita alle clausole di horn, disgiunzioni con al più un letterale positivo
    -   quindi procede in profondità e da sinistra verso destra

La struttura dati fondamentale in `pl` è la lista:

-   testa
-   coda

<!--listend-->

```text
?- [Head|Tail]=[mario,23,[2,3],antonio,luigi,[]].
Head = mario,
Tail = [23,[2,3],antonio,luigi,[]].
```

Operazioni importanti:

-   caricamento di un file `['file.pl']`
-   per stampare la totalità di una lista si usa `write()`.
-   `length(List, N)`
-   commenti con carattere `%`
-   assegnamento con la keyword `is`
-   `append(List,List,Res)`
-   `member(E,List)`

<!--listend-->

```text
?- length([1,2,3],N).
N = 3.

?- length([1,2,3],3).
true.
```


### Run-time dell'interprete {#run-time-dell-interprete}

Concettualmente 2 stack:

-   stack di _esecuzione_
-   stack di _backtracking_
    -   contiene _choise-points_
    -   il predicato di cut `!` rimuove il contenuto di questo stack per l'esecuzione corrente, rendendo definitive le scelte fatte fino a quel momento, rimuove rami dell'albero `SLD`
        -   `a :- p,!,b.`
            -   quando viene raggiunto rimuove i punti di scelta per `a, p`
        -   si perde la _completezza_ del `SLD`


### Liste {#liste}

```prolog
% somma(L,R)
somma([],0).
somma([Head|Tail],Res):-
    somma(Tail,RTail),
    Res is Head+RTail.

% conta(L,X,N)
conta([],_,0).
conta([X|Tail],X,Res):-
    conta(Tail,X,RTail),
    Res is 1+RTail.
conta([H|Tail],X,Res):-
    H \== X,
    conta(Tail,X,Res).

% soluzione molto inefficiente
% deve scorrere ogni passo ricorsivo la lista per
% fare la append
invert([],[]).
invert([H|T],Inv):-
    invert(T,TInv),
    append(TInv,[H],Inv).

% invopt(L,[],R)
invopt([],Temp,Temp).
invopt([H|T],Temp,R):-
    invopt(T,[H|Temp],R).

inv(L,R):-invopt(L,[],R).
```

Esercizi sugli insiemi:

```prolog
union([],B,B).
union([X|T],B,R):-
    member(X,B),
    union(T,B,R).
union([X|T],B,[X|R]):-
    \+member(X,B),
    union(T,B,R).
```

La negazione in prolog **non è la negazione classica**, proprio perché gestisce solo clausole di horn (al più un letterale non negato).

-   `\+A`
-   negazione per fallimento
-   _negation by failure_
    -   definizione puramente operazionale, _predicato extra-logico_
    -   `prolog` prova a dimostrare l'asserzione, se ci riesce restituisce `false`, `true` se fallisce
    -   ci sono 3 possibili esiti, anche il loop
        -   l'albero `SLD` non termina

Altro goal extra-logico è il **cut**, sintatticamente il `!`.

-   rende definitive le alternative fino a quel momento
-   permette la mutua esclusione
-   impedisce il backtracking verso altre clausole
-   permette l'implementazione del `if-else`
-   controlla l'esecuzione dell'interprete
-   predicato sempre vero
-   si perde la _completezza_

<!--listend-->

```prolog
countPos([],0).
countPos([H|T],R):-
    X > 0,!,
    contaPos(T,N),
    R is N+1.
countPos([_|T],R):-
    countPos(T,R).

choose(X,L):-
    member(X,L),!.
```


## Ricerca nello Spazio degli Stati {#ricerca-nello-spazio-degli-stati}

-   stato iniziale
-   obiettivi (`goal`)
-   insieme della azioni
    -   passaggio da uno stato all'altro
    -   costi delle azioni

A partire da questi si definiscono cammini e i loro costi associati.
In questi problemi il grafo non è disponibile fin dall'inizio, anche se fosse disponibile le dimensioni di questo grafo sono esponenziali e non esplorabili completamente in tempo ragionevole.

Dobbiamo definire delle euristiche per scegliere ad ogni passo l'azione da eseguire

-   tentare di focalizzare la ricerca
-   solo una parte dello spazio degli stati va esplorato, cercando i più promettenti

In `prolog`:

-   `applicabile(AZ,S)`
-   `trasforma(AZ,S1,S2)`
-   `iniziale(S)`
-   `finale(S)`

-   ricerca in ampiezza garantisce l'ottimalità
    -   esponenziale in spazialità, mantiene tutti gli stati in memoria
-   ricerca in profondità
    -   efficiente
    -   non garantisce l'ottimalità
-   _iterative deepening_
    -   ricerca in profondità iterativamente a profondità sempre maggiori
    -   garantisce l'ottimalità

Esistono **strategie informate**:

-   utilizzando informazioni addizionali si può informare la scelta con euristiche
    -   `h(n)` costo **stimato** del cammino ottimo dal nodo `n` al `goal`
        -   l'euristica `h` non è un oracolo, può sbagliare
    -   `g(n)` costo del cammino trovato dal noto iniziale al nodo `n`


### Labirinto {#labirinto}

-   cammino in una griglia rettangolare
-   azioni, movimento nelle direzioni cardinali
-   `labyrint.pl`
    -   fotografia della realtà, fatti
-   `actions.pl`
-   possibile euristica per una strategia informata è la **distanza di manhattan**
    -   `ID-A*`, profondità iterative-deepening
    -   `A*`, ampiezza


## Answer Set Programming {#answer-set-programming}

-   _War of Semantics_, 80s-90s
    -   prove per dare una semantica alla negazione per fallimento
-   nasce linguaggio simile a `prolog` ma con funzionamento completamente diverso
    -   per problemi di soddisfacimento di vincoli, planning
        -   **problemi combinatori**
    -   non _goal_ directed
    -   soluzioni sono i **modelli** (answer set), non le prove
    -   inferenza non basata su backward chaining ma sulla costruzione di **modelli stabili**
    -   `CLINGO`, `Cmodels`
-   in `ASP` c'è anche la negazione classica (forte)
    -   `not` negazione per fallimento
    -   `-` negazione classica
        -   zucchero sintattico, definibile un letterale opposto dell'altro tramite integrity constraint
-   **integrity constraint**
    -   regole senza testa
    -   _non_ devono valere
-   si applica a programmi logici proposizionali
    -   solo proposizioni, nessuna variabile
    -   le variabili sono utilizzate solo come strumento per la scrittura
-   il programma non descrive una computazione
    -   non può andare in loop
    -   l'ordine dei letterali non ha importanza


### Semantica {#semantica}

-   il solver costruisce uno (o più) _Answer  Set_
    -   modello minimale
    -   è unico se non c'è negazione per fallimento
-   **ridotto**
    -   un altro programma `ASP`
    -   \\(P^S\\)
        -   ridotto del programma \\(P\\) rispetto l'insieme di atomi \\(S\\)
        -   rimuovi ogni regola il cui corpo contiene `not L`, per `L in S`
        -   rimuovi tutti i `not L` dai corpi delle restanti regole
    -   il ridotto non contiene atomi con negazioni per fallimento per costruzione
        -   ha un unico answer set
        -   se tale answer set coincide con `S` allora questo è un answer set accettabile
    -   l'insieme dei possibili answer set (qui non conta la minimalità) dei ridotti è la soluzione del problema, l'insieme dei modelli


### Esempi ASP {#esempi-asp}

```asp
gatto(tom).
gatto(silvestro).
miagola(X):-gatto(X).
```

```asp
bird(tweety).
penguin(tux).
ostrich(pippo).
bird(X):-penguin(X).
bird(X):-ostrich(X).
-fly(X):-penguin(X).
-fly(X):-ostrich(X).
fly(X):-bird(X),not -fly(X).
```

```asp
pacifist(X):-quacker(X),not -pacifist(X).
-pacifist(X):-republican(X),not pacifist(X).
republican(nixon).
quacker(nixon).
```

```asp
member(anna).
member(nicolo).
member(lautaro).
member(chiara).
job(1..7).
1 {assign(X,J):job(J)} 3:-member(X).
1 {assign(X,J):job(J)} 3:-member(X).
1 {assign(X,J):member(X)} :-job(J).
:-assign(X,2),assign(X,7),member(X).

#show assign/2.
```

Esempio di insoddisfacibilità:

-   questa base di conoscenza è soddisfacibile con l'insieme vuoto se non ci sono pinguini

<!--listend-->

```asp
fly(X):-bird(X).
bird(X):-penguin(X).
-fly(X):-penguin(X).
penguin(tux).
```


## Planning {#planning}

> Planning in the art and practice of thinking before acting. -- Patrik Haslum

<!--quoteend-->

> Selecting a goal-leading course of action based on a high-level description of the world. -- Jorg Hoffmann

Un planning è definito da:

-   `STS`
-   un piano
-   un goal
    -   può essere una proprietà locale o globale del mondo

Un piano può essere eseguito semplicemente da un _controller_ oppure in ottica di _continual planning_ il _planner_ viene ricontattato in caso di modifiche nell'ambiente.


### State Transition System {#state-transition-system}

`STS`

-   Stati \\(S\\)
-   Azioni \\(A\\)
-   Eventi \\(E\\)
-   relazioni \\(\gamma\\) di transizione di stato
    -   insieme delle parti \\(2^S\\)
    -   una azione può essere non deterministica e portare in stati diversi


### Classical Planning {#classical-planning}

**Assunzioni**:

-   dominio finito
    -   numero finito di stati
    -   in caso contrario non c'è più garanzia di terminazione del planning
-   completa osservabilità
    -   funzione \\(\eta: S \to O\\) è l'identità
-   dominio deterministico
-   dominio statico
    -   l'ambiente non interferisce con l'agire dell'agente
    -   \\(E=\emptyset\\)
-   goal semplici
-   piani sequenziali
    -   azioni linearmente ordinate
    -   una sola azione per volta è possibile
-   tempo implicito
    -   azioni ed eventi hanno durata istantanea
-   singolo agente
    -   un solo _planner_ e un solo _controller_

Ognuna di queste assunzioni può essere rilassata in applicazioni reali.
Il problema di pianificazione è computazionalmente costoso ricorrendo a due problemi decisionali:

-   **PlanSAT**
-   **Bounded PlanSAT**, rimane decidibile limitando lo spazio di ricerca

Questi sono `PSPACE`, in molti casi pratici **Bounded PlanSAT** è `NP-complete` mentre **PlanSAT** è `P`.

Le proprietà ricercate in un algoritmo di pianificazione sono:

-   correttezza
-   completezza
-   ottimalità


### Algoritmi di Pianificazione nello Spazio degli Stati {#algoritmi-di-pianificazione-nello-spazio-degli-stati}


#### STRIPS {#strips}

`STanford Research Institute Problem Solver`

-   Fikes, Nilsson 1971
-   introduce rappresentazione esplicita degli operatori di pianificazione
-   gestisce il _frame problem_
-   idee fondamentali
    -   linear planning
    -   means-end analysis

**Linear Planning**:

-   risolvere un goal alla volta (devono essere indipendenti per raggiungere un piano ottimo)
    -   **Sussmann's Anomaly**
-   stack dei goal

**Means-End Analysis**:

-   considera solo aspetti rilevanti al problema (ragiona backward tramite regressione)

Il linguaggio utilizzato è un sottoinsieme della `FOL`, simboli di predicati finiti, simboli di costanti

-   uno stato è una congiunzione di **atomi ground** (privi di simboli di funzione)

Relazioni:

-   fluenti
    -   possono apparire come effetti di azioni
-   persistenti

Plan Operators (template):

-   tripla: nome, precondizione, effetto
    -   _name_
    -   _precond_ detona i letterali (positivi e negativi)
    -   _effects_ rappresenta gli effetti delle azioni (solo su letterali _bounded_ nelle precondizioni)
        -   _effects+_ add-list
        -   _effects-_ delete-list

<!--listend-->

```text
Pick_BLock(?b, ?c)
Pre: Block(?b), HandEmpty, Clear(?b), On(?b, ?c), Block(?c)
Eff: Holding(?b), Clear(?c), not HandEmpty, not On(?b, ?c)
```

**Algoritmo**:

```text
STRIPS (initState, goals)
        state = initState; plan = []; stack = []
        Push goals on stack
        Repeat until stack is empty
                If top of stack is a goal g satisfied in state:
                        pop stack
                Else If top of stack is a conjunctive goal g:
                        Select an ordering for the subgoals of g
                        push them on stack
                Else If top of stack is a simple goal sg:
                        Choose an operator o whose effect+ matches goal sg
                        Replace goal sg with o
                        Push the preconditions of o on stack
                Else If top of stack is an operator o:
                        state = apply(o, state)
                        plan = [plan; o]
```

-   primo `Else If` è il passo di _linearizzazione_ del goal complesso
-   sostituire `g` con l'operatore e le sue precondizioni è il passo di regressione
    -   means-end

Due concetti utilizzati da questo algoritmo:

-   progressione, considerando gli effetti e aggiungendoli allo stato progredendo
-   regressione, considerando le precondizioni e aggiungendole allo stato regredendo

Il **linear planning**:

-   subottimo
-   interdipendenza dei sotto-goal
-   ordinamento sfavorevole dei goal


### CSP {#csp}

-   formulare un problema di pianificazione come un problema di soddisfacimento dei vincoli
    -   consente di ritardare delle decisioni fino al momento strettamente necessario
-   il modello viene espresso in variabili di stato e non più `FOL`
    -   insieme degli oggetti rilevanti che si vogliono modellare
-   due proprietà per gli oggetti
    -   _rigid_, invarianti
        -   atomi ground nella rappresentazione classica
        -   costanti booleane con variabili
    -   _varying_
        -   relazioni fluenti nella rappresentazione classica
        -   variabili cui viene assegnato un valore
            -   hanno un dominio
-   le due rappresentazioni sono equivalenti (riconducibili una con l'altra) ma:
    -   state-variable
        -   sintetica e uniforme
            -   ogni stato definito sulle stesse variabili
        -   si presta ad estensioni verso il non-classical planning
            -   osservabilità parziale
            -   euristiche
-   principio:
    -   **Least Commitment**
    -   fare scelte solo quando indispensabili alla risoluzione di una parte di problema
    -   non porre più vincoli del necessario
    -   ordinamenti e binding sono ritardabili


#### Least-Commitment Planning - PSP {#least-commitment-planning-psp}

-   ricerca spazio dei piani (`PSP`)
-   ogni nodo della ricerca è un piano parzialmente ordinato con _flaws_
-   ogni passo si rimuove un _flaw_ con raffinamenti incrementali
-   l'algoritmo termina con successo con un piano
    -   completamente istanziato
    -   parzialmente ordinato

-   piano:
    -   tupla \\(\langle A,O,B,L \rangle\\)
        -   azioni
        -   vincoli di ordinamento (r. d'ordine parziale)
        -   bindings (vincoli)
        -   causal links (precondizioni/effetti delle azioni)
-   procedimento per _open goals_
    -   goal senza un link causale a supporto della precondizione
    -   si trova un'azione a supporto (nel piano o la si aggiunge)
        -   la precondizione può appartenere ai suoi effetti
        -   può precedere il goal
    -   **instanziazione least-commitment**
    -   _add_ vincolo di precedenza \\(a \prec b\\)
    -   _add_ causal link \\(a \to^p b\\)
-   _threats_ (o _clobber_)
    -   una azione \\(c\\) minaccia il link \\(l\\)
        -   può modificale il valore di verità di \\(p\\) e può posizionarsi tra \\(a\\) e \\(b\\), oppure
        -   può produrre \\(p\\), \\(l\\) impone che sia prodotto da \\(a\\)
    -   risoluzione:
        -   _promotion_, \\(c \prec a\\)
        -   _demotion_, \\(b\prec c\\)
        -   _separation_, vincolo di _non-codesignation_
            -   in modo che l'effetto di \\(c\\) non unifichi con \\(p\\)

`PSP`:

-   corretto e completo
-   le azioni non strettamente sequenziali possono essere parallelizzate


### Graphplan {#graphplan}

-   struttura dati utile a
    -   definire euristiche domain-dependant
        -   non dà garanzia sulla raggiungibilità ma dà una buona stima di distanza
    -   generare un piano
    -   astrae lo spazio di ricerca
    -   algoritmo polinomiale per costruirlo
-   grafo orientato, aciclico, ordinato a livelli
    -   livello iniziale S0 letterali che valgono nello stato iniziali
        -   un nodo per fluente
    -   livello di azioni che sono applicabili agli stati del livello precedente
        -   un nodo per azione
    -   \\(S\_i, A\_i\\) si alternano fino a una condizione di terminazione

Considerazioni:

-   rappresentazione logica
-   `GP` traccia un sottoinsieme delle possibili interazioni negative
    -   un letterale che appare in un \\(S\_i\\) potrebbe essere producibile solo successivamente
        -   comunque una buona stima
    -   polinomiale
    -   \\(S\_i\\) è un _belief state_
-   un letterale può essere sia precondizione o atomo persistente
    -   la persistenza viene implementata ma un'azione `no-op`
-   ogni livello possono esserci link di mutua esclusione tra letterali/azioni
-   `GP` cresce monotonicamente, prima o poi livella e stati consecutivi sono identici

Complessità:

-   \\(O(n(a+l)^2)\\)

Proprietà di `graphplan`:

-   corretto e completo
-   è un **Partial-Order Planner** (`POP`), come `PSP`
    -   azioni allo stesso livello possono essere parallelizzate
    -   qualunque linearizzazione delle azioni che rispetta i vincoli di ordinamento è una possibile soluzione classica


#### Mutua Esclusione {#mutua-esclusione}

Tra azioni:

-   effetti inconsistenti
    -   un azione nega affetti dell'altra
-   interferenza
    -   uno degli effetti di un'azione è negazione di una precondizione dell'altra
-   competizione delle precondizioni
    -   una delle precondizioni di un'azione è mutualmente esclusiva con le precondizioni dell'altra

Teorema:

> Se esiste un piano valido allora questo è un sottografo del grafo di pianificazione.

Tra letterali:

-   complementarity
    -   uno negazione dell'altro
-   inconsistent support
    -   se ogni possibile coppia di azioni al livello precedente che producono i letterali è mutualmente esclusiva


#### Euristiche {#euristiche}

-   singolo letterale
    -   profondità a cui compare per la prima volta
    -   lunghezza del piano serializzato estratto dal `GP`
-   congiunzione di letterali
    -   max-level
        -   primo livello in cui compaiono tutti
    -   somma dei livelli
        -   assume l'indipendenza dei letterali del goal, non ammissibile
    -   livello di insieme
        -   livello in cui compaiono senza che alcuna sua coppia sia in mutex
        -   ammissibile, ignora le dipendenze tra tre o più letterali


#### Algoritmo {#algoritmo}

1.  espandi fino al livello in cui gli atomi del goal compaiono tutti e non in mutua esclusione tra loro
2.  invoca `Extract-Solution` cercando un piano all'interno del grafo
    -   se trova una soluzione termina, altrimenti continua
3.  espandi il grafo ancora e torna a `1.`

![](/ox-hugo/GraphPlan.png)
![](/ox-hugo/Extract-Solution.png)
![](/ox-hugo/GP-Search.png)

-   `Extract-Solution` e `GP-Search` sono mutualmente ricorsive
    -


#### Terminazione {#terminazione}

-   letterali crescono monotonicamente
-   azioni crescono m.
-   rel. di mutex decrescono m.
-   _no-goods_ decrescono m.
    -   date le due proprietà precedenti

Dimostrazione:

1.  dato che azioni e letterali crescono m. e sono insiemi finiti, deve esistere un livello in cui l'insieme dei letterali è uguali a quello del livello precedente
2.  poiché mutex e no-good decrescono m. e non possono essere meno di zero, deve esistere un livello con lo stesso numero di mutex e no-good del precedente
3.  una volta che il grafo raggiunge la situazione di livellamento di livelli e no-good, se uno dei letterali del goal è mancante o mutex con un altro, allora si può concludere che non esiste soluzione


#### Euristiche {#euristiche}

-   utilizzate per focalizzare la ricerca
    -   stima la bontà di una scelta
    -   _progression_ e _regression_
-   definite a partire da un problema rilassato e risolto

Esempi:

-   Spazio degli stati: Ricerca in avanti
    -   non ammissibile, complessa
-   Spazio degli stati: Ricerca all'indietro
    -   non ammissibile, ma pre-compilabile e quindi semplifica runtime
-   Spazio dei piani: Ricerca AND/OR
    -   Fewer Alternatives First (`FAF`)
        -   preferisce il flaw con minor numero di resolver
        -   più facile scoprire se flaw non risolvibile


### Hierarchical Task Networks {#hierarchical-task-networks}

-   Turing-completo
-   NP-completo


### CLIPS {#clips}
