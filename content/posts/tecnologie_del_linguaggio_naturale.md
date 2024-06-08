+++
title = "Tecnologie del Linguaggio Naturale"
author = ["Daniel Biasiotto"]
date = 2024-02-27T11:58:00+01:00
tags = ["master", "ai", "compsci", "university", "lingustics"]
draft = false
+++

-   [Speech and Language Processing]({{< relref "speech_and_language_processing.md" >}})
-   [NLP]({{< relref "nlp.md" >}})


## Linguistica {#linguistica}

-   linguistica generale \\(\to\\) linguistica computazionale generale

Nel linguaggio umano si definiscono livelli diversi

-   morfologia
-   sintassi
-   semantica formale
-   pragmatica

Differenza fondamentale tra linguaggio naturale e artificiale è _l'ambiguità_.

-   il linguaggio naturale è intrinsecamente ambiguo per avere una lingua compatta, efficiente

E in sistemi automatici si distinguono due task fondamentali

-   generazione
-   parsing

D.Manning definisce 4 ere di `NLP`

1.  code breaking
2.  formalization, rule-based
3.  machine learning
4.  deep learning

Per Graffi il linguaggio umano è definito da 4 caratteristiche:

1.  discretezza
    -   fonemi, morfemi, parole
2.  ricorsività
    -   _A vede B che vede A che vede B..._
3.  dipendenza della struttura
    -   la sequenza è meno importante della struttura
4.  località
    -   contesto linguistico cambia il significato

Il pensiero e linguaggio si modificano a vicenda e sono profondamente legati.

Vari livelli linguistici vengono analizzati step by step indipendentemente dal nostro cervello:

-   forme d'onda
-   parole
-   struttura sintattica
-   rappresentazione semantica

Prima _analisi_ poi _interpretazione_ e infine viene derivato un _significato_.

-   attingendo da _conoscenza dichiarata_, una _base di conoscenza_, e un sistema di _regole_

Lo studio della **linguistica** è necessario per comprendere sistemi statistici come il `DL` in quanto è fondamentale la scelta delle feature linguistiche, vadano questi decisi a priori o ricavati automaticamente.
**Jurafsky** fa l'esempio del _sentence splitting_, le **feature linguistiche** possono essere modellate da un albero di decisione o da un sistema a regole. Il processo finale è simile quindi a livello concettuale gli approcci sono equivalenti.


## Livelli Linguistici {#livelli-linguistici}

Morfologico, sintattico, semantico, pragmatico e del discorso.
Vengono definite le strutture più appropriate a ciascun livello.
A livello computazionale si sviluppa una struttura a cascata, l'output di un livello diventa input del livello successivo.


### Livello Morfologico {#livello-morfologico}

Struttura vettoriale.

-   analisi lessicale
    -   sequenza di lettere \\(\to\\) sequenza di parole
        -   parole singole o gruppi di parole con significato unitario
        -   **vettore**
-   codifica dei **part-of-speech** (`POS`)
    -   tagging
    -   categorie delle parti del discorso
        -   utilizzo di test linguistici per definirle

-   rapporti:
    -   **paradigmatico**, termini sostituibili tra loro mantenendo la correttezza della frase
    -   **sintagmatico**, elementi che si susseguono in una frase

Quindi:

-   nomi
    -   semantica: persone, oggetti, luoghi
    -   sintagmatica: con articoli, al plurale, prendono possessivi
-   verbi
    -   semantica: eventi, azioni, processi
    -   forme morfologiche: tempo, modo, numero
    -   categoria: ausiliari, modali, copula
-   aggettivi
    -   modificatori
-   avverbi
    -   modificatori

Le parti si dicono _aperte_ se si aggiungono parole in tempi brevi (nomi, verbi, aggettivi, avverbi), _chiuse_ se si modificano solo molto lentamente (articoli, pronomi, preposizioni).


#### PoS tagging {#pos-tagging}

-   text-to-speech (per risolvere ambiguità di pronuncia)
    -   in questo caso il `PoS` può essere utilizzato direttamente per la risoluzione del task
-   l'output è una coppia `parola/tag`
-   regexp sugli output per le frasi
-   input o miglioramento di un parser completo
-   un'analisi `PoS` necessaria quando si studia il cambiamento linguistico con nuove parole o cambi di uso
-   85%  dei tipi non è ambiguo
    -   il restante 15% però sono molto ricorrenti
        -   `back`: ADJ, NOUN, VERB, PART, ADV
    -   60% dei token sono ambigui
-   il task attualmente ha performance attorno 97%
    -   `HMM`, `CRF`, `BERT`
    -   ma la baseline è già 92% con il metodo più lazy
        -   tag ogni parola con il tag più frequente
        -   tag parole sconosciute come nomi
-   **Universal Dependencies** tagset
    -   Nivre et al. 2016
    -   per tutte le lingue e non solo l'inglese a differenza dal **Penn TreeBank**

Gli algoritmi, supervisionati:

-   Hidden Markov Models
-   Conditional Random Fields, Maximum Entropy Markov Models
-   Neural sequence models
-   Large Language Models, finetuned

Le ipotesi di dipendenza e indipendenza ci sono date dalla teoria linguistica.

-   **modelling**
-   **learning**, algorithm for setting the parameters of the model
-   **decoding**, algorithm for applying the model in order to compute results

<!--list-separator-->

-  Rule-Based Tagging

    -   `ENGTWOL` tagging
        -   English Two Level analysis
    -   assegna tutti i tag alle parole
        -   analisi morfologica per determinare i possibili tag
    -   rimuovi i tag secondo **regole**
        -   controllando le parole precedenti e successive per eliminare delle possibilità

<!--list-separator-->

-  Sequence Labelling

    -   data una base di conoscenza di parole/tag
    -   data una sequenza (_observation_, _sequence of observations_)
    -   qual'è la miglior sequenza di tag che corrisponde a questa sequenza di osservazioni
    -   visione **probabilistica**
        -   qual'è la sequenza di tag più probabile data la _sequence of observations_
        -   il numero di possibilità è enorme \\(n^m\\) con \\(n\\) parole e \\(m\\) tag

<!--list-separator-->

-  HMMs

    Il **modelling** è molto rigido, solo parole (distinzione rigida da maiuscolo a minuscolo) e sequenza di tag. Non si può inserire conoscenza linguistica all'interno del modello tramite feature linguistiche.
    \\[\widehat{t} \_1^n = \text{argmax}\_{t\_{1}^n} P(t\_1^n | w\_1^n)\\]

    -   approccio generativo
    -   regola Bayesiana

    \\[P(x|y) = \frac{P(y|x)P(x)}{P(y)}\\]
    \\[\widehat{t}\_{1}^n = \text{argmax}\_{t\_1^n}P(w\_1^n|t\_1^n)P(t\_1^n)\\]

    -   prima \\(P\\) detta _likelihood_, seconda detta _prior_

    La fase di **learning** è molto semplice nei `HMM`

    -   si calcolano le probabilità di _tag transitions_ tramite conteggio sul corpus annotato

    \\[P(t\_i | t\_{i-1}) = \frac{C(t\_{i-1},t\_i)}{C(t\_{i-1})}\\]

    -   detta _probabilità di transizione_
    -   conteggio della successione dei due tag normalizzato per il conteggio del tag precedente
        -   questo significa che non si possono _ipotizzare_ parole sconosciute
        -   un conteggio nullo di una parola significa probabilità nulla
    -   si calcola la _probabilità di likelihood_ o di _emissione_ in modo simile

    \\[P(w\_i | t\_{i}) = \frac{C(t\_{i},w\_i)}{C(t\_{i})}\\]

    L'algoritmo di **decoding** di **Viterbi** sfrutta la _memoization_ (dynamic programming) per diminuire la complessità temporale a discapito di quella spaziale.

    -   per disambiguare un nodo (parola) l'unica informazione utile è quella del prefisso: questa è fattorizzabile in quanto in comune
    -   i prefissi vengono calcolati una singola volta e poi mantenuti in _memo_
    -   idea della programmazione dinamica è di memorizzare solo la massima cammino di probabilità per ciascuna cella, non ogni cammino
        -   la sequenza più probabile passa per le singole transizioni più probabili

    Viterbi, calcolo di probabilità dei prefissi:
    \\[v(j) = \text{max}\_{i=1}^N v\_{t-1} (i) a\_{ij} b\_j(o\_t)\\]

    -   v, viterbi
    -   a, probabilità di transizione
    -   b, probabilità di emissione

    L'algoritmo agisce ricorsivamente su una finestra di 2 colonne sulla matrice markoviana.

    -   i _backpointer_ sono salvati uno per ogni nodo in ogni colonna
    -   solo l'ultimo step determina poi a ritroso risalendo i backpointer il path tra gli stati, a ritroso nel tempo

    Questo algoritmo è lineare per il numero di parole e quadratico rispetto il numero dei tag, non più esponenziale.

    Si arriva tranquillamente a 93-94% accuracy già solo con questo.

    -   si può complicare utilizzando non i bigrammi ma i trigrammi
        -   aumenta anche la _sparseness_, molti valori nulli nella distribuzione di probabilità
        -   moltiplicazione di _Lagrange_ utilizza i bigrammi e monogrammi se non sono disponibili trigrammi

<!--list-separator-->

-  MEMM

    **Maximum Entropy Markov Models**
    Nel **modelling**:

    -   non si applica la regola bayesiana
    -   modello discriminativo non generativo come `HMM`
        -   prende un approccio diretto
        -   calcola \\(P(y|x)\\) discriminando tra i possibili valori della classe \\(y\\) invece che prima calcolare una verosimiglianza
            -   si descrive solo ciò che _discrimina_ tra le classi, non tutte le feature

    Le ipotesi sono 2:

    -   uno stato è condizionalmente indipendente da tutte le osservazioni e label precedenti
    -   le osservazioni sono indipendenti tra loro
    -   le _feature_ possono essere inserite nel modello
        -   dati prefissi, postfissi è più probabile che una parola sia un verbo o un'altra categoria
        -   ipotesi che solo le feature che decidiamo hanno impatto nella predizione

    La difficoltà sta nel **learning** per il calcolo dei pesi delle _feature_ che sono inserite manualmente.

    \\[P(y|x) = \sum\_{i=1}^N w\_i f\_i\\]

    Modello più interessante linguisticamente in quanto possono essere inserite feature linguistiche. Complicato il learning.

    Per il **decoding** può essere applicato viterbi similmente a `HMM`.
    Caso specifico di **Conditional Random Fields** `CRF`, in `NLP` si parla di _linear-chain_ `CRF` dove coppie di variabili sono tag per token adiacenti.

    -   in `CRF` sono definite \\(k\\) **feature globali** che vengono calcolate sull'intera sequenza e sulle feature locali
        -   queste feature globali riescono a catturare dipendenze più complesse e a distanza maggiore dei soli suffissi e l'osservabile
    -   poi ci sono feature locali
    -   come decoding anche in questo caso viene utilizzato viterbi

<!--list-separator-->

-  Tagging Unknown Words

    -   parole vengono aggiunge alla lingua di continuo
    -   nomi propri
    -   metodi detti di _smoothing_
    -   possibile approcci
        -   assumili nomi
        -   assumi distribuzione normale su `PoS`
        -   usa informazioni morfologiche
        -   assumile distribuite similarmente a parole che occorrono solo 1 volta nel training (per i parametri) / developing (per gli iperparametri) set


#### NER {#ner}

Named Entity Recognition

-   nomi propri utilizzabili per identificare il dominio del discorso
-   storicamente sono state identificate 4 `NER`
    -   `PER`, person
    -   `LOC`, location
    -   `ORG`, organization
    -   `GPE`, geo-political entity
-   spesso sono _sequenze parole_, parole composte riferite a una entità
    -   più difficile al `PoS` tagging
    -   2 sotto-task
        -   prima capire i limiti (_span_) che indicano l'entità, _segmentation_
        -   categorizza l'entità, _type ambiguity_
-   ci si riconduce al caso di un tag per token con il `BIO` tagging con \\(2n +1\\) tag con \\(n\\) entità:
    -   begin-tag
    -   inside-tag
    -   out, generico
-   in questo modo si possono utilizzare le stesse tecniche del `PoS` tagging
-   `HMM` non è più competitivo in questo ambito


### Livello Sintattico {#livello-sintattico}

Struttura ad albero.

-   trovare le relazioni sintattiche
-   tra gruppi di parole (costituenti) o coppie (dipendenze)
-   _Aspects of the theory of syntax_, 1957 - [Chomsky]({{< relref "chompsky.md" >}})
-   ricorsività, center-embedding o laterale

Chomsky definisce due concetti:

-   _competence_, conoscenza pura della sintassi
    -   la teoria della linguistica si occupa di questa
    -   _unaffected by grammatically irrelevant conditions_
    -   **grammatica formale**
-   _performance_, come viene utilizzata la conoscenza della sintassi, limite pratico del parlante, conoscenza individuale
    -   **algoritmo di parsing**


#### Struttura a Costituenti {#struttura-a-costituenti}

-   da linguistica generativista
-   [Chomsky]({{< relref "chompsky.md" >}})
    -   Teoria X-barra
-   syntactic parsing
    -   deriva la struttura sintattica dalla sequenza di parole
-   `S` - `NP` - `VP` - `N` - `V` - `N`
-   la costituenza è la relazione sintagmatica

<!--list-separator-->

-  Grammatiche Generative

    \\(G = (\Sigma, V, S, P)\\)

    -   context free
    -   albero di derivazione utilizzato per catturare la sintassi

<!--list-separator-->

-  Gerarchie di Chomsky

    -   **Type 0**
        -   nessun vincolo
    -   **Context-sensitive**
    -   **Context-free**
        -   complessità di parsing \\(n^3\\)
        -   riesco a catturale una grande parte della complessità del linguaggio
    -   **Linear**
        -   terminali solo a dx o solo a sx

    Schieber dimostra che un dialetto svizzero-tedesco non è `CF`.
    Per Joshi le dipendenze sintattiche nelle lingue naturali sono o nested o cross-serial, a partire da queste lui ipotizza una congettura che queste lingue siano **mildly context-sensitive**.

    -   poco context-sensitive, leggermente più complesse delle `CF`
    -   4 proprietà: includono `CFG`, nested/cross-serial dependencies, parsing polinomiale, crescita lineare

<!--list-separator-->

-  Parser Anatomy

    -   grammar
        -   conoscenza dichiarativa della sintassi
        -   context-free, `TAG`, `CCG`, dependency (non generativa)
    -   algorithm
        -   search strategy (top-down, bottom-up, left-to-right)
        -   memory organization (back-tracking, dynamic programming)
    -   oracle
        -   deve guidare le scelte algoritmiche
        -   probabilistico, rule-based

    Le strategie (algoritmiche) si differenziano da cosa guida la ricerca:

    -   goal-directed parsing, top-down
        -   solo ricerche che portano a risposte corrette (radice `S`)
        -   comporta la creazione di alberi non compatibili con le parole
        -   _razionalisti_
    -   data-directed parsing, bottom-up
        -   solo ricerche compatibili con le parole in input
        -   comporta la creazione di alberi non corretti
        -   _empiricisti_

    Il problema principale da risolvere algoritmicamente è quello della ambiguità strutturale:

    -   una frase può avere alberi di parsing corretti multipli
    -   2 tipi di ambiguità: _attachment_ ambiguity (PP) e _coordination_ ambiguity
        -   esplosione combinatoria dei possibili alberi
        -   i `PP` possono legarsi al verbo o al complemento oggetto

<!--list-separator-->

-  CKY

    -   \\(O(n^3)\\)
    -   calcola tutti i possibili _parse_
    -   **Earley** simile a questo
    -   _memoization_
    -   `CFG` in forma normale di Chomsky
        -   non si perde generalizzata
        -   regole binarie o a terminali
    -   si divide in due l'intervallo di parole cui si riferisce il sotto-albero ad ogni regola applicata
        -   in quanto sono tutte regole in forma normale
        -   le strutture vengono memorizzate secondo gli indici di riferimento in una matrice
    -   nelle celle va anche memorizzato il backtrace, altrimenti non è un parsing ma recognition
        -   senza backtrace non si può ricostruire l'albero, solo un recogniser

    Si può avere anche una versione che utilizza un oracolo probabilistico (`PCFG`) per fare _pruning_:

    -   associa un valore di probabilità alle soluzioni
    -   ranking agli alberi risultanti
    -   si possono assegnare delle probabilità a ogni regola
        -   regole con la stessa testa vincolate a sommare a 1
    -   probabilità di un albero produttoria di tutte le probabilità delle regole utilizzate
    -   le probabilità vengono derivate da un corpus

    Si estraggono le regole automaticamente da un corpus di alberi sintattici, semplice quando questi alberi sono scritti in forma `lisp-like` (S-espressioni).
    Una volta estratte le regole si contano le frequenze associate e quindi le loro probabilità.

    L'algoritmo poi fa un `beam-search` seguendo le strade più promettenti, le strade che hanno associata una probabilità troppo bassa vanno scartate preventivamente.
    Solo le soluzioni parziali più promettenti sono sviluppate.

    Si può sostituire anche una grammatica esplicita con una rete neurale che decida la classe dei costituenti.

    È possibile portare l'informazione lessicale verso l'alto:

    -   **Lexicalized** `PCFG`
    -   il problema era che le probabilità nella parte alta non è influenzata in nessun modo da ciò che segue nell'albero
        -   sono indipendenti
    -   le parole sotto nell'albero devono influenzare la probabilità del nodo superiore
        -   una maniera di dare un po' di contesto alle _context free_
        -   le probabilità diventano sempre più piccole, lo _smoothing_ diventa ancora più fondamentale


#### Struttura a Dipendenze {#struttura-a-dipendenze}

-   [Lucien Tesnière]({{< relref "lucien_tesniere.md" >}})
-   dependency parsing
-   struttura definita dalle relazioni
    -   _sub_, _obj_
-   nelle relazioni ci sono un _governor_ (testa) e un _subordinate_ (dipendente)
    -   ogni connessione in principio unisce un termine superiore a uno inferiore
-   ci sono delle approssimazioni in questo approccio
    -   ci sono relazioni simmetriche
    -   ci sono delle specie di funzioni che trasformano termini in basi ad altri usati come argomenti
-   il problema a livello informatiche è che non ci sono meccanismi generativi
    -   non c'è più la grammatica
-   ci sono dei template, schemi di analisi sintattica o espressioni regolari
    -   le regole della grammatica sono in un certo senso nascoste nelle dipendenze statistiche

Vantaggi:

-   generalizzabili a più linguaggi
-   i costituenti generano alberi diversi per ordini diversi di parole, dipendenze generano lo stesso albero per uno stesso significato
-   senza fare interpretazioni semantica già si hanno delle informazioni in più
-   parser veloci

> [...] [the fact that] head-dependent relations are a good proxy for the semantic relationship between predicates and their arguments is an important reason why dependency grammars are currently more common than constituency grammars in `NLP`. -- Jurafsky

<!--list-separator-->

-  Dependency Parsing

    -   **dynamic programming** similmente a `CKY`
    -   **graph algorithms**
        -   comunque dinamico
        -   Minimum-Spanning Tree per la frase
        -   `MSTParser`
            -   valuta le dipendenze indipendentemente usando un `ML` classifier
        -   gli archi definiscono le relazioni di dipendenza e sono definite dalla probabilità nel corpus
        -   in questa prima fase si ricava il più probabile albero non tipato
    -   **constituency parsing + conversion**
    -   **deterministic parsing**
        -   a transizioni

    <!--list-separator-->

    -  MALT

        -   deterministic parsing
        -   la grammatica è nascosta nel corpus attraverso l'oracolo
        -   bottom-up, depth-first, senza back-tracking
            -   non serve back-tracking in quanto si arriva sempre a una soluzione legale

        Componenti:

        -   input buffer
        -   stack
        -   parser, con oracolo
        -   insieme di azioni possibili
        -   relazioni di dipendenza attuali

        Gli alberi che vengono prodotti sono solo **proiettivi**, ovvero non ci sono incroci tra le relazioni

        -   questa è una grossa approssimazione
        -   si trascura il **mildly context-sensitive** in un certo senso


### Valutazione {#valutazione}

-   _parseval_
    -   parser evaluation
-   va valutata la precisione di una soluzione
-   _precision_
    -   quale percentuale di subtree del system tree sono anche nel golden tree
-   _recall_
    -   quale percentuale di subtree del golden tree sono anche nel system tree


### Livello Semantico {#livello-semantico}

Struttura a grafo.
Si può immaginare un approccio secondo **vocabolario** ma questo presenta dei problemi:

-   ricorsività delle definizioni

-   semantica lessicale, delle parole
    -   approcci: _Classico_, _Distribuzionale_
-   semantica formale, della frase

Approccio lessicale classico (simbolico):

-   **lessema**
    -   coppia forma-significato
    -   elemento del lessico
-   relazioni di gruppo
    -   **sinonimia**
        -   `SYN-set`, approccio `wordnet`
        -   tra questi set occorrono relazioni di significato (i.e. opposizione)
    -   **iponimia**, **iperonimia**
        -   sottoclasse e sovraclasse (_automobile_-_veicolo_)
    -   **omonimia**, **polisemia**
        -   stessa forma, significato diverso
    -   **insiemi**

Approccio distribuzionale

> You shall know a word by the company it keeps! - Firth 1957

-   meaning is related to the distribution of the words around
-   word \\(\to\\) numerical vector \\(\to\\) embedding
    -   matrici di co-occorrenza
    -   prima vettori lunghi e sparsi ora più brevi e densi
    -   _neural embedding_
    -   la distanza tra le parole informa sulla semantica
-   _contextualized word embedding_
    -   si codifica anche il contesto
    -   condiziona ogni parola con il suo contesto
    -   nasce con `BERT` e il deep learning
-   **vettori**

-   Semantica Composizionale
    -   per poter eseguire inferenza logica
    -   traduzione dal linguaggio naturale in una qualche forma di rappresentazione della conoscenza
    -   _reasoning_
        -   deduzione, induzione, abduzione
    -   significato mancante nel background viene costruito in ogni caso con tutte le conoscenze e la semantica delle parole nel contesto, similitudine morfologica
    -   _Colorless green ideas sleep furiously_
    -   _Il Lonfo_
    -   **logica** \\(\to\\) **alberi/grafi** (ricorsione)


### Livello Pragmatico {#livello-pragmatico}

Struttura a grafo ma più complessa della semantica, vengono utilizzate delle semplificazioni.
L'interpretazione dipende da chi enuncia la frase, quando, dove, va contestualizzato nel mondo.

-   **anafora**
    -   sintagmi che si riferiscono a oggetti precedentemente menzionati
    -   si risolve tramite le conoscenze del mondo
-   **intention** e **entities** definiscono **frame**
-   agent: intent
-   un frame deve essere "compilato" per definire il contesto
    -   _dialog flow_
    -   è una semplificazione
        -   entità di numero finito
        -   si perde la ricorsività del linguaggio
            -   un frame non può contenere un altro frame diversamente dei frame della teoria della conoscenza di Minsky
-   **ontologie**


## Dialogue Systems &amp; ChatBOTs {#dialogue-systems-and-chatbots}

Definizione di Jurafsky:

-   dialogue systems: task
-   chatbots: non c'è task

Key features of human dialogues:

-   turns
    -   complesso in un dialogo vocale
    -   più semplice in un sistema testuale dove la fine di un turno è più chiara
-   speech acts
    -   dialogue acts
    -   azioni intraprese dai parlanti in un dialogo
    -   constatives - directives - commissives - acknowledgements
-   grounding
    -   continua conferma di comprensione di ciò che è stato detto
    -   _establishing common ground_
-   dialogue structure
    -   coppie di adiacenza
    -   sotto strutture, sotto dialoghi
-   initiative
    -   mista nel dialogo umano
    -   in un sistema è più semplice codificarla da un lato a l'altro
-   implicature


### ChatBOTs {#chatbots}

Chatbots:

-   cons:
    -   no understanding
    -   potrebbe essere problematico provare a dare un falso senso di comprensione

La valutazione di un chatbot va fatta da un essere umano.


#### [ELIZA]({{< relref "eliza.md" >}}) {#eliza--eliza-dot-md}

-   keyword estratte dalle frasi tramite espressioni regolari
-   risposte preconfezionate tramite template inserendo le keyword
-   stack di memoria di keyword
-   tecniche di recupero con frasi fatte
-   _ELIZA effect_, pareidolia


#### ALICE {#alice}

-   Artificial Intelligence Markup Language
-   struttura simile a `HTML`
-   permette di definire delle regole per rispondere all'utente
-   generalizza ELIZA
    -   stesso funzionamento algoritmico


#### Corpus based {#corpus-based}

-   response by retrieval
    -   il corpus potrebbe essere anche una ricerca web
-   response by generation
    -   tecniche neurali per mischiare il turno attuale e il corpus codificato nella `NN`


### Dialogue Systems {#dialogue-systems}

-   frame
    -   semplici strutture tipate con _slot_ da riempire
    -   rappresentano il dialogo
    -   informazioni fondamentali per il sistema
    -   aggiornato man mano
-   a valle del dialogo il frame completo può essere utilizzato da altri sistemi automatici

Approccio moderno che non passa per l'analisi classica della linguistica computazionale:

-   semantica semplice
    -   `GUS` slot/filler (1977)
    -   `FRAME` semantics
-   task-based dialogue agents
-   3-step algorithm
    -   domain detection \\(\to\\) set of frames
    -   intent detection \\(\to\\) a frame
    -   slot filling \\(\to\\) filled frame
-   frame:
    -   slot di un tipo
        -   ognuna associata con una domanda diretta all'utente
    -   ontologia di dominio
    -   il grosso limite semantico di questi frame è la **non ricorsività**

Approcci:

-   **rule-based** slot filling
    -   regexp, grammatiche
    -   high precision, low recall
        -   _brittle_
-   **statistics-based** slot filling
    -   `NL`
    -   _dialogflow_
        -   domain
        -   intent, high-level speech acts
        -   entities, ontology elements
    -   bisogno di un grosso corpus annotato
-   la **dinamica** del dialogo può essere catturata con la storia degli speech act
    -   permette una gestione del dialogo secondo la dinamica
    -   si può definire una policy a riguardo

Ci sono delle misure oggettive per valutare il sistema di dialogo:

-   _Trindi Ticklist_
-   misura la performance sul task


## Test {#test}

-   [Imitation Game]({{< relref "imitation_game.md" >}}) di Turing
    -   troppo dipendente dal giudice
        -   dalla sua intelligenza, umore, emotività
-   [Winograd Schema Challenge]({{< relref "winograd_schema_challenge.md" >}}) (`WSC`)


## Lexical Semantics {#lexical-semantics}


### Ontologie {#ontologie}

-   utili per avvicinare l'analisi semantica del linguaggio
-   `DOLCE` è un ontologia fondazionale

Top level delle ontologie divisa in

-   _perdurand_, eventi
    -   non hanno indicizzazione temporale
    -   non cambiano all'interno del tempo
    -   solo alcuni elementi sono presenti nel tempo
-   _endurant_, oggetti
    -   relazioni di parte time-indexed
    -   può cambiare nel tempo
    -   parti compresenti nel tempo
    -   partecipano nei _perdurant_

Per decidere se esistono relazioni di sottoclasse per gli eventi:

-   _identity criteria_
    -   condizioni che utilizziamo per determinare l'eguaglianza

Ci sono molte sfumature della relazione _part-of_

-   componente
-   ingrediente
-   porzione
-   area
-   ...

**Teoria delle qualità**:

-   introduce in un mondo logico un orizzonte numerico
-   descrizioni necessarie come complemento all'ontologia
-   distinzione
    -   qualità (_quality_) e il suo valore (_quale_)
        -   il _quale_ viene indicato all'interno dello spazio della qualità


### Reti Semantiche {#reti-semantiche}

-   formalismi che permettessero di aggregare conoscenze elementari in strutture più complesse, per rappresentare il dominio
-   accesso allo strutture in cui le conoscenze sono direttamente disponibili
-   le `RS` nate nei primi esperimenti di analisi di linguaggio
-   grafi relazionali (mondo dei blocchi)
    -   l'espressività può essere estesa reificando il predicato
        -   traduzione di tutte le relazioni con arità superiore a 2 in relazione binarie
        -   la granularità dell'informazione aumenta
-   molte delle nostre conoscenze sono organizzate gerarchicamente
    -   classi e sottoclassi
    -   le gerarchie si possono estendere alle azioni
-   due strategie
    -   relazione di copertura
        -   rappresento solo i legami essenziali
        -   efficiente sullo spazio
        -   inefficiente sul tempo
    -   chiusura transitiva
        -   rappresentare esplicitamente tutti i possibili legami
        -   efficiente sul tempo
        -   inefficiente sullo spazio
        -   manutenzione complessa
-   si trova un compromesso con archi _shortcut_
-   validità per _default_
    -   eccezioni memorizzate in corrispondenza dei nodi cui si riferiscono
    -   l'algoritmo di eredità lavora bottom-up seguendo la gerarchia `isA`
-   appartenenza e inclusione sono entrambe rappresentate con `isA`
-   manca una semantica formale delle rete semantica
    -   il significato della rete dipende dall'uso che se ne fa


### Sistemi a Frame {#sistemi-a-frame}

-   Minsky, 1975
-   rappresentazione a carattere generale (_frame_)
    -   poi raffinata e modificata per rendere conto dei dettagli della situazione
-   permette a un sistema di formulare _previsioni_ e avere _aspettative_
-   consente l'interpretazione di situazioni ambigue
-   i frame organizzano le conoscenze relative a un certo dominio per
    -   facilitare il reperimento di informazioni
    -   facilitare processi inferenziali
-   analogamente alle reti semantiche, i frame rappresentano le conoscenze in modo dichiarativo privo di semantica formale
-   Rosch, 1975
    -   tre livelli gerarchici
        -   base
            -   da queste si derivano gli altri concetti
        -   superordinato
        -   subordinato
-   l'appartenenza categoriale viene individuata nei termini di verosimiglianza con un _prototipo_


### Teorie Duali {#teorie-duali}

-   Daniel Kahneman
-   approccio duale al ragionamento
    -   **Dual Process Theories**, psicologia del ragionamento e razionalità
    -   due processi cognitivi
        -   sistema 1 e sistema 2
            -   implicito/esplicito
            -   automatico/controllabile
            -   evoluto prima/dopo
            -   linguaggio indipendente/legato al linguaggio
            -   parallelo, veloce/sequenziale, lento
            -   pragmatico, contestualizzato/logico, astratto
-   abilità concettuali categorizzabili in questi termini:
    -   S1: categorizzazione non monotona
        -   rappresentazione continua (sub-symbolic)
    -   S2: categorizzazione monotona
        -   rappresentazione proposizionale


### Semantica Lessicale {#semantica-lessicale}

-   disciplina che si occupa di stabilire cosa significhino le parole
    -   problemi: polisemia, semantica frasale
    -   analizza il contributo delle parola al significato della frase e come il contesto alteri il significato
-   **contesto**
    -   elementi adiacenti alla parola
    -   c. sintattico
        -   punto di vista proprietà sintattiche (nominale, verbale, aggettivale)
    -   c. semantico
        -   punto di vista proprietà semantiche
    -   c. linguistico (sintattico/semantico)
    -   c. situazionale (pragmatico/extralinguistico)
-   **ambiguità, polisemia**
    -   a. contrastiva (omonimia)
    -   a. complementare (polisemia)
    -   principio di economicità linguistica
        -   l'ambiguità contiene la dimensione del lessico
        -   verbi più polisemici perché completati dagli argomenti


### Teorie sulla natura del significato lessicale {#teorie-sulla-natura-del-significato-lessicale}

-   **teoria referenziale del significato**
    -   parole strumento attraverso il quale si fa riferimento all'esistente
    -   significato è la capacità di stabilire una relazione (riferimento) con elementi della realtà esistenti al di fuori della lingua
    -   riferimento:
        -   denotazione (classe di appartenenza)
        -   designazione (elemento della classe)
    -   2 interpretazioni della s. referenziale
        -   ampia
        -   restrittiva
            -   2 atti: riferimento e predicazione
-   **teoria mentalista o concettuale**
    -   arricchisce la t. precedente
    -   ipotesi: riferimento tra parole e realtà non è diretto ma mediato dall'immagine mentale che costruiamo
        -   immagini sono i _concetti_
        -   rappresentazioni mentali delle classi di oggetti
        -   i riferimenti sono alla concettualizzazione della realtà
    -   _mediazione concettuale_
        -   si parla di entità astratte/immaginarie
        -   eventi ipotetici
    -   concetti cognitivi/lessicalizzati
        -   primi instabili
        -   secondi stabili e socialmente condivisi
-   **teoria strutturale**
    -   significato consiste nel valore che la parola assume in relazione alle altre parole presenti nella lingua nello stesso campo semantico e che designano oggetti analoghi
    -   valore semantico è il contenuto informativo, acquisito per esclusione
-   **teoria dei prototipi**
    -   sviluppi della teoria mentalista
    -   prototipo elemento esemplare della categoria
        -   dispositivo fondamentale alla base della categorizzazione dell'esperienza
    -   alcuni elementi sono membri tipici e più rilevanti per rappresentare la classe
        -   al centro
    -   la categoria non ha confini netti
        -   tratti possono essere assenti o negati in entità che comunque appartengono alla categoria
-   **teoria distribuzionale**
    -   ipotesi distribuzionale di Harris (1956)
        -   significato determinato in larga misura dall'insieme di altre parole con cui co-occorrono
        -   parole simili quanto più lo sono i loro contesti di occorrenza
    -   ipotesi attuale per i _corpus_ di grandi dimensioni
    -   metafora geometrica di significato (vicinanza geometrica/semantica)
        -   rappresentazioni vettoriali


### Calcolo Sintagmatico del Significato {#calcolo-sintagmatico-del-significato}

-   qual'è il significato delle parole?
-   come si forma il significato delle frasi a partire dalle parole?
-   problemi:
    -   contestualità del significato
    -   polisemia delle parole
-   principio di composizionalità del significato
    -   come il significato degli enunciati si forma a partire dal significato degli elementi lessicali che li compongono
    -   il principio di c. si sospende per:
        -   espressioni idiomatiche
        -   metafore
        -   polisemia
-   2 approcci
    -   enumerazione dei sensi
        -   antieconomico e incompleto
    -   concezione dinamica del significato
        -   parole come entità permeabili
        -   significato di ciascuna parola interagisce con quello delle parole adiacenti
-   pricipi di interazione semantica
    -   co-composizione
        -   significato del verbo (base) interagisce con i suoi argomenti modificandolo
        -   significato base (non variabile) + componenti semantiche portate dai complementi
        -   significato specificato dal complemento
    -   forzatura (_coercion_)
        -   verbo combinato con un nome specifico lo spinge a significare ciò che la semantica del verbo richiede
        -   verbi aspettuali richiedono che l'oggetto sia un evento
    -   legamento selettivo
        -   gruppi sostativo-aggettivo
        -   l'aggettivo può selezionare una porzione del significato del nome
        -   l'aggettivo seleziona nei nomi l'evento che soddisfa lo scopo tipico di questi nomi


### WordNet {#wordnet}

-   online lexical reference system
-   synonym sets
    -   rappresentano un concetto sottostante
    -   legati tra loro da relazioni diverse
-   ordimento alfabetico pone parole legate a grande distanza nella lista
-   4 categorie
    -   nomi
        -   gerarchie
    -   verbi
        -   varietà di relazioni
    -   aggettivi
        -   iperspazi N-dimensionali
    -   avverbi
        -   iperspazi N-dimensionali
-   lexicalized concept &amp; utterance
    -   concetto e segno
-   lexical matrix
    -   righe significati
    -   colonne significanti
    -   entry implica che una forma può essere usata per designare un significato
        -   entries nella stessa colonna indicano polisemia
        -   entries nella stessa riga indicano sinonimia
-   _synset_
    -   significato rappresentabile dalla lista delle forme che possono esprimerlo
-   _gloss_
    -   differenzia il senso di una specifica forma rispetto alle altre nel _synset_
    -   può essere pensato come un _synset_ di un solo membro
-   _semantic relations_
    -   relazioni tra significati e quindi tra _synset_
    -   rel. simmetriche
    -   sinonimia
        -   sostituzione non cambia il valore di verità di una frase
            -   questa definizione è molto forte e pochi sono i veri sinonimi
            -   definizione rilassata considerando il contesto di sinonimia
    -   antinonimia
        -   difficile da definire
        -   relazione lessicale tra forme, non una relazione semantica tra significati
    -   iponimia
        -   relazione semantica tra significati
        -   rel. transitiva, asimmetrica
        -   genera una struttura semantica gerarchica
            -   c'è ereditarietà delle feature di un concetto generico e aggiunge almeno una feature che distingue l'iponimo dagli altri
    -   meronimo
        -   relazione _part-whole_, `HASA`
        -   rel. transitiva, asimmetrica


#### Nomi {#nomi}

-   sistema di ereditarietà lessicale
-   definizioni danno un termine superordinato + feature distintive
    -   feature distintive:
        -   attributi (modifica)
        -   parti (meronimia)
        -   funzioni (predicazione)
-   ogni dizionario contiene probabilmente dei circoli viziosi
    -   istanze in cui una parola A viene usata nella definizione della parola B che è usata per definire A
-   design fondamentale della memoria lessicale è che non sia un ciclo ma un albero
    -   un grafo aciclico
-   evidenze psicolinguistiche portano ad assumere una organizzazione secondo concetti superordinati gerarchicamente
    -   ip. tempi di reazione diversi per informazioni contenute _a monte_ nei concetti superordinati
    -   ip. i tempi di reazione indicano distanza pragmatica e non semantica


#### Componenti Semantiche {#componenti-semantiche}

-   gerarchia multipla
    -   nomi partizionati in set di primitive semantiche
        -   ognuno agisce come fonte di una gerarchia separata
    -   ogni gerarchia corrisponde a un campo semantico distinto con il proprio vocabolario
    -   un unico _beginner_ considerabile come componente semantica primitiva di tutte le parole nel suo campo semantico strutturato gerarchicamente
-   concetti generici
    -   livello in cui il più delle feature distintive si trovano
    -   basic-level categories / generic concepts
-   feature distintive
    -   dettagli dati dalle feature che distinguono i concetti tra loro
    -   3 tipi: attributi, parti, funzioni


#### Verbi {#verbi}

-   rete semantica
-   provvedono un framework relazionale e semantico per la frase
    -   struttura predicato-argomento (_subcategorization frame_)
    -   possibile struttura sintattica della frase
-   _subcategorization frames_
    -   legame tra nomi-argomenti e ruoli tematici/casi
    -   questa informazione sintattica e semantica è generalmente considerata parte dell'informazione lessicale del verbo
-   molti meno verbi che nomi
    -   maggiore polisemia
    -   significati più flessibili
    -   i verbi più frequenti sono anche i più polisemici e dipendono molto dai nomi con cui co-occorrono
-   troponimia
    -   dal greco _tropos_: maniera
    -   una specie di iponimia verbale
    -   verbo A è verbo B in una particolare maniera (intensità, causa)
    -   la gerarchia non può essere facilmente definita con un albero


### FrameNet {#framenet}

-   frame = tipologia di situazione, contesto
-   il significato alle parole viene assegnato assecondando il _frame_ in cui si opera
-   polisemia:
    -   un verbo con nominalizzazioni differenti che hanno significati distinti si può considerare polisemico
-   un _frame_ ha un vocabolario specifico che denomina i suoi constituenti
    -   vocabolario descrittivo degli elementi costituenti di ogni frame
        -   frame elements (`FEs`)
-   `FN` offre descrizioni di frame collegati e legami semantici tra parole per guidare giudizi di coerenza nell'analisi e nella disambiguazione


### Text Processing {#text-processing}


#### Tokenization {#tokenization}

-   splitting by word/sentence
-   distinzione:
    -   _content words_, informazioni sull'argomento del testo
    -   _context words_, informazioni sullo stile del testo


#### Stemming {#stemming}

-   `NLTK: snowball, porter`
-   ridurre le parole alla loro radice
-   avvicina al significato base della parola
-   due possibili errori:
    -   understemming, falso negativo
    -   overstemming, falso positivo


#### POS Tagging {#pos-tagging}

-   etichettatura delle parole secondo `POS`


#### Lemmatization {#lemmatization}

-   riduce le parole al loro _lemma_ o forma canonica
    -   forma di dizionario o citazione
-   un lemma rappresenta un gruppo di parole detto _lessema_
-   la performance dei _lemmatizers_ può essere migliorata con l'aggiunta dell'informazione data dal `POS` tagging


#### NER {#ner}

-   named entity recognition
-   posti, persone, organizzazioni


### N-gram Language Models {#n-gram-language-models}

-   modelli che assegnano probabilità a sequenze di parole
    -   bigrammi, trigrammi, n-grammi
    -   può assegnare probabilità a intere frasi
-   si computa la probabilità di sequenze decomponendole tramite _chain rule_
-   non è possibile stimare le probabilità semplicemente contando le occorrenze data una storia in un corpus esteso
    -   il linguaggio è creativo e anche sequenze semplici hanno frequenze nulle
-   la storia si può approssimare ad una finestra di parole precedenti
    -   _Markov assumption_, probabilità di una parole dipendente solo dalla precedente

Forma generale per n-grammi:
\\[P(w\_{1:n}) \simeq \prod\_{k=1}^n P(w\_k | w\_{k-1})\\]
Le probabilità degli n-grammi sono poi normalizzate per le frequenze dei termini.
Per evitare _underflow_ nel moltiplicare tante probabilità molto piccole si utilizzano le probabilità logaritmiche agendo poi di somme.


#### Valutazione {#valutazione}

-   estrinsica
    -   tramite utilizzo, misura del miglioramento dell'applicativo
-   intrinsica
    -   misura della qualità in maniera indipendente
    -   training e test set
-   _perplexity_
    -   frase fuori dal training set, probabilità alte buone
    -   `PPL` bassa indica che la frase è modellata bene
-   assunzioni di vocabolario
    -   chiuso, le parole utilizzate sono tutte conosciute
    -   aperto, si possono incontrare parole sconosciute
        -   out of vocabulary `OOV` words, `OOV` rate
        -   `UNK` words
            -   convertire parole sconosciute in `UNK` e poi trattarle come se conosciute
            -   creare vocabolario chiuse implicitamente sostituendo tutte le parole in training con frequenza sotto threshold con `UNK`


#### Smoothing {#smoothing}

-   vogliamo impedire che il modello assegni probabilità zero a eventi sconosciuti
-   _Laplace smoothing_
    -   +1 prima di normalizzare le probabilità
-   _interpolation_
    -   mix delle probabilità degli stimatori pesata
    -   combinando trigrammi, bigrammi, unigrammi


## Approcci alla Semantica {#approcci-alla-semantica}

-   semplificando:
    -   s. lessicale
    -   s. formale
    -   s. statistica
    -   s. linguistico-distribuzionale
        -   linguistico+statistico

Si illustrano il **Text Mining** (statistico) e poi approccio distribuzionale.


### Significato {#significato}

Tre principali teorie sulla costruzione del significato (_word meaning_)

-   primitive
    -   Kats, Wilks,  Lakoff
-   relazioni
    -   Quinlan, Fodor
    -   di per se una parola non ha significato, lo acquisisce nel contesto
-   composizioni
    -   Pustejovski
    -   le singole parole acquisiscono significato con  le loro relazioni ma creano anche significato composti quando messe insieme


#### Triangolo Semiotico {#triangolo-semiotico}

-   [C.S Peirce]({{< relref "c_s_peirce.md" >}})
-   **concetto** (significato, interpretazione)
-   **referente** (fenomeno, istanza)
-   **rappresentazione** (segno, termine, simbolo)


#### Granularità {#granularità}

La visione sulla struttura semantica può avere una certa profondità:

-   parola
-   chunk
-   frase
-   discorso
-   documento
-   collezione di documenti


#### Word Sense Disambiguation {#word-sense-disambiguation}

`WSD`

Identificazione del senso di una parola polisemica in una frase.

-   bisogno di un _Sense Inventory_ come WordNet


#### Word Sense Induction {#word-sense-induction}

`WSI`

Identificazione automatica dei sensi di una parola dato il suo uso in un corpus.

-   cattura i contesti che attribuiscono specifici significati
-   non ci si basa su risorse esterne
-   metodo _pseudoword_, accorpando i termini di cui definire e comparare i cluster


### Costruzione del Significato {#costruzione-del-significato}


#### Pustejovsky {#pustejovsky}

Teoria del _generative lexicon_, elegante ed espressiva ma complessa da implementare.

-   **Argument Structure**
-   **Event Structure**
-   **Qualia Structure**
    -   4 ruoli
        -   costitutivo: parte composizionale del concetto, materiale
        -   formale: definizione che definisce il concetto dagli altri del dominio
        -   telico: rappresenta l'obiettivo e la funzione del concetto
        -   agentive: entità che rappresentano l'origine del concetto
-   **Inheritance Structure**


#### Hanks {#hanks}

Teoria delle **valenze**

-   _valenza_ è la cardinalità degli argomenti che compongono la struttura radicata nel verbo
    -   argomenti chiamati _slot_
-   **Collocazione**
    -   combinazione di tutti i possibili _filler_ degli slot
    -   combinazione fatta tramite grandi quantità di dati
-   **Semantic Type**
    -   macro-categorie che raggruppano i vari _filler_
    -   per ogni slot


#### Affordance Linguistiche {#affordance-linguistiche}

-   _affordance_ termine coniato dallo psicologo americano James Gibson
    -   teoria per cui l'uso di un oggetto è suggerito dall'oggetto stesso
-   la teoria è proiettata sul linguaggio
    -   ogni parola ha un suo uso che essa stessa suggerisce
    -   in particolare è il contesto che ci da un'idea precisa di cosa significhi una parola sconosciuta

> Yesterday I saw a `grest` with a telescope, it was very fast.

<!--list-separator-->

-  Potenza generativa dei pattern

    > Lorem \* dolor sit \*, consectetur adipiscing \*.

    -   _linguistic instances_ occorrenze un pattern in un corpus
    -   detti anche **pattern non lessicalizzati**
    -   le proprietà associabili ai filler sono raggrupparli attraverso concettualizzazioni
        -   in cluster
        -   legare co-occorrenze degli elementi per ciascun filler
    -   per un pattern il primo filler avrà date proprietà, il secondo altre, etc.
        -   per una frase di senso compiuto in quel contesto
    -   potere espressivo e generativo maggiore del modello Hanks
        -   altro vantaggio è l'andamento logaritmico del numero di proprietà aggiunte in funzione dei termini aggiunti
            -   inizialmente molte proprietà nuove, poi molte ripetute
    -   le relazioni possono ricavarsi:
        -   **paradigmatiche**, da FrameNet o WordNet
        -   **sintagmatiche**, da corpora
        -   o ancora da annotazioni manuali, questionari, ML


### Text Mining {#text-mining}

-   applicazioni di [Data Mining]({{< relref "data_mining.md" >}}) al testo
-   approccio statistico di tipo bottom-up, partendo dall'analisi qualitativa e quantitativa di fenomeni specifici per effettuare inferenze
    -   contrapposta all'analisi classica invece top-down, a partire dalle regole della linguistica
-   codifica di parole come _token_
    -   sequenza di caratteri senza alcuna valenza lessicale
-   si utilizza la rappresentazione vettoriale di questi token[^fn:1]
    -   indicizzati in un dizionario che riporta le frequenze, codificando l'importanza di ogni parola nel testo
    -   con più corpus otteniamo una matrice sparsa, il dizionario considera tutta la collezione documentale
    -   estremamente efficiente in quanto basata sul prodotto di vettori
    -   misura di similarità _cosine similarity_
        -   \\[\cos (\theta) = \frac{A\cdot B}{||A|| ||B||}\\]
        -   prodotto degli elementi di vettori diviso per le norme dei vettori
        -   coseno misura l'angolo tra due punti[^fn:2] dello spazio multi-dimensionale


#### Metodi Statistici {#metodi-statistici}

-   frequenza
    -   **TF-IDF**, _Term Frequency_ normalizzata sulla lunghezza e _Inverse Document Frequency_
        -   \\[\frac{n\_{i,j}}{|d\_j|} \times \log \frac{|D|}{|\\{d : i\in d\\}|}\\]
-   co-occorrenza
    -   assume che parole di simile significato occorrano negli stessi contesti
    -   rappresentata in matrice diagonale \\(|D| \times |D|\\)
    -   mentre una cosine similarity potrebbe dare 0 per sinonimi la co-occorrenza probabilmente no


#### Applicazioni {#applicazioni}

-   Tag Clouds
-   Tag Flake
-   Document Clustering
-   Document Classification
-   Document Segmentation[^fn:3]
-   Document Summarization[^fn:4]
    -   estrattivi, estraggono le frasi più importanti[^fn:5]
    -   astrattivi, generalmente molto più complessi richiedono di nuovo contenuto testuale
-   Information Retrieval


### Semantica Distribuzionale {#semantica-distribuzionale}

> Le parole che si verificano negli stessi contesti tendono ad avere significati simili. -- Harris '57

<!--quoteend-->

> Una parola è caratterizzata dalla compagnia che mantiene. -- Firth

<!--quoteend-->

> L'uso congiunto delle parole serve principalmente a specificare più strettamente l'oggetto del discorso. -- Furnas '83

<!--quoteend-->

> C'è una struttura semantica latente sottostante nei dati che è parzialmente oscurata dalla casualità della scelta delle parole rispetto al loro recupero. -- Deerwester '90

<!--quoteend-->

> L'argomento del documento influenzerà in modo probabilistico la scelta delle parole dell'autore durante la scrittura del documento. -- Blei 2003

<!--quoteend-->

> Coppie di parole che si verificano in modelli simili tendono ad vere relazioni semantiche simili. -- Turney 2003

Ci si riferisce alla semantica distribuzionale in modi diversi in comunità differenti:

-   _Distributional Hypothesis_ in linguistica
-   _Distributional Semantics_ in ambito di [NLP]({{< relref "nlp.md" >}})
-   _Latent Semantic Analysis_ o _Vector Space Models_ in ambito di information retrieval
-   _Conceptual Spaces_ o _Graded Categorization_ in ambito di scienze cognitive
-   _Hyperspace Analogue to Language_ in psicometria
-   matrici di adiacenza in ambito di teoria dei grafi


#### Perché Matrici {#perché-matrici}

-   il linguaggio è un concetto approssimato come la rappresentazione vettoriale
-   le matrici sono a metà tra
    -   rappresentazione simbolica
    -   rappresentazione associazionistica
-   le matrici sono legate sia a
    -   _conceptual spaces_
    -   _prototype theory_
        -   prototipo come centroide delle categorie linguistiche nella mente


#### Configurazioni matriciali {#configurazioni-matriciali}

Peter Turney in un suo articolo del 2010 categorizza:

-   _Term-Document_ matrix
    -   semplice
    -   per similarità/clustering/classificazione di documenti
-   _Term-Context_ matrix
    -   generalizzazione della precedente
    -   per similarità tra parole, dipendenza sintattica, `WSD`, Information Extraction
-   _Pair-Pattern_ matrix
    -   proposta da Turney
    -   coppie per ragioni computazionali
    -   per _relational similarity_, _pattern similarity_
    -   relational clustering/classification


#### Similarità {#similarità}

-   _Semantic Similarity_
    -   più usata e mal interpretata
    -   concetti che hanno quasi lo stesso significato (sinonimia)
-   _Semantic Relatedness_
    -   spesso confusa con la precedente
    -   concetti con proprietà in comune, affinità semantica
    -   meronimi, antonimi, anche sinonimi
    -   spesso troppo generica per essere utilizzata in ambito operativo
-   _Attributional Similarity_
    -   stessa definizione precedente, in letteratura si preferisce s.r.
-   _Taxonomical Similarity_
    -   facilmente misurabile
    -   concetti che condividono iperonimi
-   _Relational Similarity_
    -   su coppie di concetti
-   _Semantic Association_
    -   termine dell'ambito delle scienze cognitive
    -   concetti che co-occorrono frequentemente

Molte definizioni diverse portano a confusione nel campo e ad una certa fragilità del concetto di similarità.


#### Word Order &amp; Composizionalità {#word-order-and-composizionalità}

-   rappresentazioni matriciali non codificano l'ordine delle parole nel testo
-   si raggiunge un massimo di 80% di accuratezza senza considerare l'ordine
    -   accettabile per molte applicazioni
-   possibile:
    -   l'uso di pair-pattern per ovviare al problema
    -   vettori di ordinamento ausiliari
-   altro problema è quello della **composizionalità**
    -   il linguaggio e la semantica lo sono, i vettori no
    -   possibile soluzione è quella di combinare vettori per una rappresentazione composta&nbsp;[^fn:6]

[^fn:1]: Rappresentazione inventata da Salton nel '74
[^fn:2]: Ogni documento è visto come un punto prendendo in considerazione il vettore corrispondente
[^fn:3]: Una sorta di topic modeling ma sequenziale e intradocumentale
[^fn:4]: valutati utilizzando ROUGE (Recall-Oriented Understudy for Gisting Evaluation)
[^fn:5]: Uno degli algoritmi storici è TextRank
[^fn:6]: il vettore di `vino` e quello di `rosso` li combino per creare un vettore di `vino rosso`
