+++
title = "Sviluppo Software"
author = ["Daniel Biasiotto"]
date = 2022-03-03T00:08:00+01:00
tags = ["university"]
draft = false
+++

-   Info Corso
    -   Matteo Baldoni
    -   Sviluppo Agile
-   [PDF Version](/ox-hugo/sviluppo_software.pdf)


## Software {#software}

Include:

-   tutta la documentazione elettronica che serve agli utenti dei sistemi, agli sviluppatore e i responsabili della qualità

É caratterizzato da:

-   manutenibilità
-   fidatezza
-   efficienza
-   accettabilità

In generale un processo descrive

-   chi
-   fa cosa
-   come
-   quando

Per raggiungere un obiettivo

Le 4 _attività fondamentali_ comuni a tutti i processi software:

1.  specifiche
2.  sviluppo
3.  convalida
4.  evoluzione


### Modello a cascata {#modello-a-cascata}

Nel <span class="underline">modello a cascata</span> queste sono distinte e separate

-   requisiti in dettaglio
    -   non c'è feedback, molto lavoro speculativo
-   piano temporale delle attività da svolgere
-   modellazione
-   progetto software
-   programmazione software
-   verifica e rilascio

Parte dal presupposto che le specifiche sono prevedibili e stabili e possono essere definite correttamente sin dall'inizio, a fronte di un basso tasso di cambiamenti

-   nella realtà questo non avviene quasi mai, questo modello é ottimo in caso di sistemi critici

{{< figure src="../media/img/waterfall-workflow.jpg" >}}


### Modello di Sviluppo Incrementale {#modello-di-sviluppo-incrementale}

Nel <span class="underline">modello di sviluppo incrementale</span> queste sono intrecciate, aggiunte di funzionalità alla versione precedente (versioning)

-   utilizzato in caso di requisiti che cambiano durante lo sviluppo
    -   in molti casi se si procede progettando tutto fin dall'inizio si rischia di buttare molto del lavoro in seguito
-   si implementano immediatamente le funzionalità più critiche
    -   per rilasciare il prima possibile: il _feedback_ é l'aspetto più critico
    -   si procede per incrementi, _patch_
        -   il codice si degrada progressivamente
        -   per arginare la degradazione é necessario un continuo _refactoring_ del codice
-   per il management é più complesso gestire le tempistiche
    -   almeno in parte può essere essenziale pianificare le iterazioni
-   fin dall'inizio si procede con progettazione e testing del sistema

L'ambiente odierno richiede cambiamenti rapidi:

-   la rapidità delle consegne é quindi un requisito critico
-   i requisiti reali diventano chiari solo dopo il feedback degli utenti

per ciò questo metodo di sviluppo ha preso piede

Lo sviluppo é organizzato in sotto-progetti

-   progettazione
-   iterazione
-   test

Il progetto si adatta iterazione dopo iterazione al feedback, é _evolutivo_

-   ogni iterazione é una scelta di un sottoinsieme dei requisiti
    -   produce un sistema eseguibile e subito testabile

\\(\textsc{nb}\\)   L'output di una iterazione _non_ é un esperimento o un prototipo. É una sottoinsieme a livello di produzione del sistema finale.


#### Esempi {#esempi}

-   Unified Progress
-   Extreme Programming
-   Scrum


#### Vantaggi {#vantaggi}

-   riduzione rischi
-   progresso subito visibile
-   feedback immediato
-   gestione della complessità, evita la _paralisi da analisi_


#### Test Driven Development {#test-driven-development}

`TDD`
Diversi tipi di test:

-   _unitari_
    -   verificano il funzionamento di singole unità
    -   struttura in 4 parti
        1.  preparazione, instanziazione degli oggetti di testing e il contesto
        2.  esecuzione
        3.  verifica, spesso _assert_
        4.  rilascio, _garbage collection_
-   di _integrazione_
    -   verificano la comunicazione tra parti
-   _end-to-end_
    -   verificano il collegamento complessivo tra gli elementi del sistema
-   di _accettazione_
    -   verificano il funzionamento complessivo del sistema


#### Refactoring {#refactoring}

Strettamente legato al _testing_ in un ciclo di sviluppo incrementale.
A seguito di un _refactoring_ vengono rieseguiti tutti i test per assicurarsi di non aver provocato una _regressione_.

Esempi di refactoring:

-   _Rename_
-   _Extract Method_
-   _Extract Class_
-   _Extract Constant_
-   _Move Method_
-   _Introduce Explaining Variable_
-   _Replace Constructor Call with Factory Method_


### Modello di Integrazione e Configurazione {#modello-di-integrazione-e-configurazione}

Nel <span class="underline">modello dell'integrazione e configurazione</span> si basa su un gran numero di componenti o sistemi riutilizzabili, piccoli sistemi che vengono configurati in nuove funzionalità

Il processo appropriato dipende dai requisiti e le politiche normative, dall'ambiente in cui il software sarà utilizzato


## Object Oriented Analysis/Design {#object-oriented-analysis-design}

`OOA/D`

Ai concetti vengono attribuite le _responsabilità_, a partire da queste si passa alla progettazione e poi al software
`OOD` é fortemente correlata alla/analisi dei requisiti/:

-   casi d'uso
-   storie utente

L'analisi si concentra sull'identificazione e la descrizione degli oggetti:

-   _concetti nel dominio del problema_

Queste analisi dei requisiti sono svolte nel contesto di processi di sviluppo:

-   Processo di sviluppo iterativo
-   Sviluppo Agile
-   Unified Process - `UP`


### Unified Process {#unified-process}

`UP`

-   cerca di bilanciarsi tra estrema agilità e pianificazione
-   la versione commerciale si chiama `RUP`, di `Rational`
-   iterazioni corte e timeboxed
-   raffinamento graduale
-   gruppi di lavoro auto-organizzati

Orizzontalmente:

-   **ideazione**
    -   approssimazione
    -   portata
    -   studio della fattibilità
-   **elaborazione**
    -   visione raffinata
    -   implementazione iterativo del nucleo
    -   risoluzione rischi maggiori, parte più critica
    -   implementata l'architettura del sistema, mitigazione rischi
-   **costruzione**
-   **transizione**

Tutte queste fasi includono analisi, progettazione e programmazione

Verticalmente si procede con:

-   discipline
    -   modellazione del business
    -   requisiti
    -   progettazione
    -   implementazione
    -   test
    -   rilascio
-   artefatti
    -   qualsiasi prodotto di lavoro

In questo processo é utilizzato solo `UML`

-   utilizzato solo se necessario, se viene tralasciato va indicato il motivo
-   i diagrammi seguono le iterazioni e gli incrementi

Quasi tutto in `UP` é opzionale, deciso dal project leader

{{< figure src="../media/img/agile-workflow.jpg" >}}


#### Requisiti {#requisiti}

Capacita o condizioni a cui il sistema e il progetto devono essere conformi

-   é l'utente che li stabilisce, non il progettista

Possono essere

-   _funzionali_
    -   requisiti comportamentali
    -   comportamenti del sistema
-   _non funzionali_
    -   scalabilità
    -   sicurezza
    -   tempi di risposta
    -   fattori umani
    -   usabilità

Nei processi a cascata sono molti i requisiti non utilizzati nei casi d'uso

-   spreco di tempo, denaro, rischi in più

Per evitare questo `UP` spinge al feedback

Modello requisiti `FURPS+`

-   modello dei casi d'uso
-   specifiche supplementari
-   glossario
-   visione
-   regole di business

La disciplina dei requisiti é il processo per scoprire cosa deve essere costruito e orientare la sviluppo verso il sistema corretto
Si incrementalmente una lista dei requisiti: _feature list_

-   breve descrizione
-   stato
-   costi stimati di implementazione
-   priorità
-   rischio stimato per l'implementazione

<!--list-separator-->

-  Casi d'uso

    Catturano (in `UP` e `Agile`) i requisiti funzionali
    Sono descrizioni testuali che indicano l'uso che l'utente farà del sistema

    -   attori; qualcuno o qualcosa dotato di comportamento
    -   scenario (istanza di caso d'uso); sequenza specifica di azioni e interazioni tra sistema e attori
    -   caso d'uso; collezione di scenari correlati (di successo/fallimento) che descrivono un attore che usa il sistema per raggiungere un obiettivo specifico

    `UP` é _use-case driven_, questi sono il modo in cui si definiscono i requisiti di sistema

    -   i casi d'uso definiscono analisi e progettazione
    -   i casi sono utilizzati per pianificare le iterazioni
    -   i casi definiscono i test

    Il **modello dei casi d'uso** include un grafico `UML`

    -   é un modello delle funzionalità del sistema

    I casi d'uso non sono orientati agli oggetti, ma sono utili a rappresentare i requisiti come input all' `OOA/D`

    -   l'enfasi é sull'utente, sono il principale metodo di inclusione dell'attore nel processo di sviluppo
    -   questi non sono algoritmi, sono semplici descrizioni dell'interazione, non la specifica di implementazione
        -   il _come_ é obiettivo della progettazione `OOD`
        -   i casi descrivono gli eventi o le interazioni tra attori e sistema, si tratta il _cosa_ e nulla riguardo al _come_

    I casi devono essere _guidelines_, esprimerle in uno  **stile essenziale**. A livello delle intenzioni e delle responsabilità, non delle azioni concrete.

    <!--list-separator-->

    -  Attori

        Sono ruoli svolti da persone, organizzazioni, software, macchine

        -   primario
        -   di supporto
            -   offre un servizio al sistema
            -   chiarisce interfacce esterne e protocolli
        -   fuori scena
            -   ha interesse nel comportamento del caso d'uso

    <!--list-separator-->

    -  Formati

        -   breve
            -   un solo paragrafo informale che descrive solitamente lo scenario principale
        -   informale
            -   più paragrafi in modo informale che descrivono vari scenari
        -   dettagliato
            -   include precondizioni e garanzie di successo

<!--list-separator-->

-  Requisiti non funzionali

    Possono essere inclusi nei casi d'uso se relazionati con il requisito funzionale descritto dal caso.
    Altrimenti vengono descritti nelle specifiche supplementari.

<!--list-separator-->

-  SSD

    Diagrammi di Sequenza di Sistema

    -   illustra eventi di input e output relativi ai sistemi in discussione
    -   diagrammi di sequenza `UML`
    -   sviluppo _blackbox_, non si pensa al come ma al cosa
        -   l'intenzione dell'utente
    -   input dei contratti

<!--list-separator-->

-  Contratti

    -   usano **pre** e **post** condizioni per definire nel dettaglio i cambiamenti agli oggetti <span class="underline">concettuali</span> nel <span class="underline">modello di dominio</span>

    Precondizioni: _ipotesi significative sullo stato del sistema o degli oggetti del modello di dominio prima dell'esecuzione dell'operazione di sistema_
    Postcondizioni: _descrive i cambiamenti di stato degli oggetti del dominio dopo il completamento dell'operazione_

    -   oggetti creati
    -   collegamenti formati/rotti
    -   attributi modificati

    I contratti sono input per il processo di progettazione software.


#### Modello di Dominio {#modello-di-dominio}

Casi d'uso e specifiche supplementari sono input che vanno a definire il modello di dominio

\\(\textsc{definition}\\)   Nel `UP` il _Modello di Dominio_ é una rappresentazione delle classi concettuali della situazione reale. Queste _non sono_ oggetti software.

-   si può pensare come un dizionario visivo, mostra le astrazioni  e le loro relazioni in maniera immediata
-   non tratta le responsabilità/metodi degli oggetti, questi sono prettamente software
-   possibile distinguere:
    -   **simboli**
    -   **intenzioni**
        -   proprietà intrinseche, definizione
    -   **estensioni**
        -   esempi e casi in cui la classe concettuale si applica


#### Modello di Progetto {#modello-di-progetto}

_Architettura Logica e Layer_
Si tratta di un modello indipendente dalla piattaforme che definisce i `layer`:

-   gruppi di classi software, `packages`, sottoinsiemi con responsabilità condivisa
    -   `User Interface`
    -   `Application Logic`
    -   `Domain Objects`
    -   `Technical Services`

I modelli per gli oggetti possono essere

-   statici, definiscono (_diagrammi delle classi_)
    -   package
    -   nomi delle classi
    -   attributi
    -   firme delle operazioni
-   dinamici, rappresentano il comportamento del sistema (_diagrammi di sequenza_)
    -   collaborazione tra oggetti per realizzare una caso d'uso
    -   i metodo delle classi software

<!--list-separator-->

-  Diagrammi dei Package

    Vista _statica_

<!--list-separator-->

-  Diagrammi di Interazione

    Vista _dinamica_

    > Un interazione é una specifica di come alcuni oggetti si scambiano messaggi nel tempo per eseguire un compito nell'ambito di un certo contesto.

    <!--quoteend-->

    > Un compito é rappresentato da un messaggio che dà inizio all'interazione

    -   questo messaggio é detto _messaggio trovato_

    Per questo scopo vengono usati i _diagrammi di sequenza_ o i _diagrammi di comunicazione_
    In particolare questi sono chiamati `Design Sequence Diagram - DSD`.

<!--list-separator-->

-  Diagrammi delle Classi

    `Design Class Diagram - DCD`
    Vista _statica_

    > Il diagramma delle classi di progetto é un diagramma delle classi utilizzato da un punto di vista software o di progetto.

    A differenza del `Modello di Dominio` in questo contesto la visibilità ha un significato:

    -   le associazioni qui hanno un verso

<!--list-separator-->

-  Progettazione a oggetti

    -   _Quali sono le responsabilità dell'oggetto?_
    -   _Con chi collabora l'oggetto?_
    -   _Quali design pattern devono essere applicati?_

    Si parte dal `Modello di Dominio`, ma l'implementazione impone dei vicoli ulteriori dovuti al `Object Oriented`

    -   vengono letti e implementati i contratti, con le loro pre e post-condizioni
    -   non si creano nuove associazioni nel `Modello di Dominio`: siamo a livello del codice e si fanno scelte progettuali di _visibilità_


#### Ideazione {#ideazione}

Si tratta dello studio di fattibilità

-   si decide se il caso merita un'analisi più completa

La documentazione possibile é tanta ma tutto é opzionale

-   va documentato solo ciò che aggiunge valore al progetto


#### Elaborazione {#elaborazione}

Alla fine di questa fase si ha un'idea chiara del progetto

-   vengono stipulati contratti e obiettivi chiari, temporali e sui requisiti


#### Costruzione {#costruzione}

Durante questa fase i requisiti principali dovrebbero essere stabili


#### Transizione {#transizione}


## Unified Modeling Language {#unified-modeling-language}

`UML`

Strumento per pensare e comunicare

-   utilizzato per rappresentare il modello di dominio/concettuale
-   permette un passaggio più veloce da modello a design/progettazione
    -   il gap rappresentativo sarà più semplice

<span class="underline">É un linguaggio visuale per la specifica, la costruzione e la documentazione degli elaborati di un sistema software</span>

-   de facto standard in particolare per software OO
-   può essere utilizzato come abbozzo, progetto o linguaggio di programmazione
-   la modellazione agile enfatizza l'uso di `UML` come abbozzo


## Pattern {#pattern}

Riassunto di esperienze precedenti, permettono di individuare le pratiche ottime nello sviluppo di progetti complessi.
Un _Pattern_ é una coppia _problema-soluzione_ ben conosciuta e con un nome associato.

L'approccio complessivo é guidato dalla **responsabilità**[^fn:1]:

-   `RDD` - Responsibility-Driven Development

In `UML` la responsabilità é un _contratto_ o un _obbligo_ di un classificatore.
Sono correlate agli obblighi o al comportamento di un oggetto, sono di due tipi:

1.  di fare
    -   fare qualcosa esso stesso
    -   chiedere ad altri di eseguire azioni
    -   controllare e controllare attività di altri
2.  di conoscere
    -   i propri dati
    -   gli oggetti correlati
    -   cose che può derivare o calcolare


### GRASP {#grasp}

`General Responsibility Assignment Software Patterns`

> Capire le responsabilità é fondamentale per una buona programmazione a oggetti. \\(\qquad\qquad\qquad\\) ~ [Martin Fowler]({{< relref "martin_fowler.md" >}}) [#cit]({{< relref "20210604132601-cit.md" >}})

[GRASP]({{< relref "grasp.md" >}}) tratta i pattern di base per l'assegnazione di responsabilità.

-   buon [blog post](http://www.kamilgrzybek.com/design/grasp-explained/) a riguardo

Disegnare i diagrammi di interazione é occasione di considerare le responsabilità (metodi) e assegnarle.

La progettazione modulare é uno dei principi (`High Cohesion` - `Low Coupling` )

-   questi sono pattern _valutativi_, non ci danno la soluzione direttamente


#### Creator {#creator}

-   _Chi crea un oggetto_ `A`?
-   _Chi deve essere responsabile della creazione di una nuova istanza di una classe?_

Assegna alla classe `B` la responsabilità vale una delle seguenti condizioni:

-   `B` contiene o aggrega con una composizione oggetti di tipo `A`
-   `B` registra `A`
    -   ovvero ne salva una `reference` in un campo
-   `B` utilizza strettamente `A`
-   `B` possiede i dati per l'inizializzazione di `A`
    -   quindi `B` é un `Expert` rispetto ad `A`


#### Information Expert {#information-expert}

-   _Chi ha una particolare responsabilità?_

Assegna la responsabilità alla classe che contiene le informazioni necessarie per soddisfarla.

-   `Expert`


#### Low Coupling {#low-coupling}

-   _Come ridurre l'impatto dei cambiamenti?_
-   _Come sostenere una dipendenza bassa?_

Assegna le responsabilità in modo tale che l'accoppiamento (non necessario) rimanga basso.
Questo é un principio da utilizzare per valutare le scelte possibili e gli altri pattern.

-   classi per natura **generiche** e che verranno riutilizzate devono avere un accoppiamento particolarmente basso.
-   il rapporto tra classi-sottoclassi é un **accoppiamento forte**
-   accoppiamento alto con elementi _stabili_ o _pervasivi_ causano raramente problemi
    -   il problema sorge con _accoppiamento alto con elementi per certi aspetti instabili_


#### High Cohesion {#high-cohesion}

-   _Come mantenere gli oggetti focalizzati, comprensibili e gestibili?_
    -   effetto collaterale, sostenere `Low Coupling`

Assegna le responsabilità in modo tale che la coesione rimanga alta.
Questo é un principio da utilizzare per valutare le scelte possibili e gli altri pattern alternativi.

Una classe con una bassa coesione fa molte cose non correlate tra loro o svolge troppo lavoro.
La coesione può essere misurata in termini di:

-   <span class="underline">coesione di dati</span>
-   <span class="underline">coesione funzionale</span>
    -   questa corrisponde al principio di `High Cohesion`
    -   Grady Booch: c'è una coesione funzionale alta quando gli elementi di un componente _lavorano tutti insieme per fornire un comportamento ben circoscritto_
-   <span class="underline">coesione temporale</span>
-   <span class="underline">coesione per pura coincidenza</span>  ~~bad~~


#### Controller {#controller}

-   _Qual é il primo oggetto oltre lo strato_ `UI` _che riceve e coordina ("controlla") un'operazione di sistema?_

Assegna la responsabilità a un oggetto che rappresenta uno di questi:

-   il <span class="underline">sistema complessivo</span>, un oggetto radice o entry point del software, un sottosistema principale
    -   _controller facade_
-   uno <span class="underline">scenario di un caso d'uso</span> all'interno del quale si verifica l'operazione di sistema
    -   _controller di sessione_ o _controller di caso d'uso_

Il `Controller` é un pattern di delega:

-   oggetti dello strato `UI` catturano gli eventi di sistema generati dagli attori
-   oggetti dello strato `UI` devono delegare le richieste di lavoro a oggetti di un altro strato
-   il `Controller` é una sorta di _facciata_ appunto
    -   controlla e coordina ma non esegue lui stesso le operazioni, secondo la `High Cohesion`

> Il controller `MVC` é distinto e solitamente dipende strettamente dalla tecnologia utilizzata per la `UI` e fa parte di questo strato.
> A sua volta delegherà al `Controller` dello strato di Dominio.


#### Polymorphism {#polymorphism}


#### Pure Fabrication {#pure-fabrication}


#### Indirection {#indirection}


#### Protected Variations {#protected-variations}


### GoF {#gof}

`Gang of Four`
[GoF]({{< relref "gof.md" >}}) sono idee di progettazione più avanzate rispetto a  [GRASP]({{< relref "grasp.md" >}}).

-   non sono proprio principi
-   articoli di [journaldev](https://www.journaldev.com/31902/gangs-of-four-gof-design-patterns) a riguardo

{{< figure src="../media/img/gof-patterns.png" >}}

<span class="underline">Soluzioni progettuali comuni</span>, _emergono_ dal codice di progetti di successo.
Un fattore emerso é la superiorità della _composizione_ rispetto all'_ereditarietà_:

-   **Ereditarietà**
    -   la sottoclasse può accedere ai dettagli della superclasse
    -   **whitebox**, a scatola aperta
    -   é definita _staticamente_, non é modificabile a tempo di esecuzione
    -   una modifica alla superclasse potrebbe avere ripercussioni indesiderate sulla classe che la estende
        -   non rispetta l'incapsulamento
-   **Composizione**
    -   le funzionalità sono ottenute tramite composizione/assemblamento di oggetti
    -   riuso **blackbox**, i dettagli interni sono nascosti
    -   una classe che utilizza un'altra classe può referenziarla attraverso una _interfaccia_, questo meccanismo é dinamico
        -   questa composizione tramite interfaccia rispetta l'incapsulamento, solo una modifica all'interfaccia comporterebbe ripercussioni

Questo aiuta a mantenere le classi _incapsulate_ e _coese_.

Il meccanismo di <span class="underline">ereditarietà</span> può essere realizzata in due modi:

1.  **Polimorfismo**
    -   le sottoclassi possono essere scambiate l'una con l'altra
    -   si utilizza una superclasse comune
    -   si sfrutta _l'upcasting_
2.  **Specializzazione**
    -   le sottoclassi guadagnano elementi e proprietà rispetto alla classe base
    -   meglio utilizzare la delega che direttamente l'ereditarietà

I pattern mostrano che il **polimorfismo** e il _binding dinamico_ é molto sfruttato, mentre la **specializzazione** non é comunemente utilizzata in buone soluzioni.


#### Creazionali {#creazionali}

Riguardanti l'_instanziazione_ delle classi

1.  [Abstract Factory]({{< relref "abstract_factory.md" >}})
    -   _interfaccia_ factory
    -   classe factory concreta per ciascuna famiglia di elementi da creare
    -   opzionalmente definire una classe astratta che implementa l'interfaccia factory e fornisce servizi comuni alle factory concrete che la estendono
    -   il cliente che la utilizza non ha conoscenza delle classi concrete
        -   la factory si occupa di creare oggetti correlati tra loro
    -   una variante crea la factory come [Singleton]({{< relref "singleton.md" >}})
    -   utilizzata in libreria Java per le `GUI`
2.  [Builder]({{< relref "builder.md" >}})
3.  [Factory Method]({{< relref "factory_method.md" >}})
4.  [Lazy Initialization]({{< relref "lazy_initialization.md" >}})
5.  [Prototype Pattern]({{< relref "prototype_pattern.md" >}})
6.  [Singleton]({{< relref "singleton.md" >}})
    -   é consentita/richiesta <span class="underline">una sola istanza</span> di una classe
    -   gli altri oggetti hanno bisogno di un punto di accesso globale e singolo al _singleton_
    -   si definisce un **metodo statico** della classe che restituisce l'oggetto _singleton_
        -   questo in Java
        -   restituisce un puntatore all'oggetto se già esiste, se non esiste ancora prima lo crea
            -   [Lazy Initialization]({{< relref "lazy_initialization.md" >}})
        -   questa implementazione é preferibile
            -   la classe può essere raffinata in sottoclassi
            -   la maggior parte dei meccanismi di comunicazione remota object oriented supporta l'accesso remoto solo a metodi d'istanza
            -   una classe non é sempre _singleton_ in tutti i contesti applicativi, dipende dalla `virtual machine`
    -   il _singleton_ può essere anche implementato come **classe statica**
        -   non un vero e proprio _singleton_, si lavora con la classe statica non l'oggetto
        -   la classe statica ha metodi statici che offrono ciò che é richiesto
    -   in `UML` é indicato con un \\(1\\) nella sezione del nome, in alto a destra
    -   può esserci concorrenza in _multithreading_
7.  [Double-check Locking]({{< relref "double_check_locking.md" >}})


#### Strutturali {#strutturali}

Riguardanti la _struttura_ delle classi/oggetti

1.  [Adapter]({{< relref "adapter.md" >}})
    -   gestire interfacce incompatibili
    -   fornire interfaccia stabile a comportamenti simili ma interfacce diverse
    -   converti l'interfaccia originale in un'altra interfaccia, attraverso un _adapter_ intermedio
    -   da preferire l'utilizzo di un riferimento `Adaptee` da parte del `Adapter`, per incapsulamento
        -   questo piuttosto che _estendere_ direttamente l'`Adaptee`
2.  [Bridge]({{< relref "bridge.md" >}})
3.  [Composite]({{< relref "composite.md" >}})
    -   trattare un gruppo o una struttura composta nello stesso modo di un oggetto non composto
    -   si definiscono classi per gli oggetti composti e atomici in modo che implementino la stessa _interfaccia_
    -   rappresenta gerarchie _tutto-parte_
    -   permette di ignorare le differenze tra oggetti semplici e composti
        -   saranno le differenze interne a definire le operazioni, il `client` non vede questo
    -   <span class="underline">costruisce strutture ricorsive</span> dove il cliente gestisce un'unica entità
4.  [Decorator]({{< relref "decorator.md" >}}) o _Wrapper_
    -   permettere di assegnare responsabilità addizionali a un oggetto dinamicamente
    -   inglobare l'oggetto all'interno di un altro che aggiunge le nuove funzionalità
        -   più flessibile dell'estensione della classe, completamente dinamico
        -   evitano l'esplosione delle sottoclassi
        -   simile al [Composite]({{< relref "composite.md" >}}) ma aggiunge funzionalità
5.  [Facade]({{< relref "facade.md" >}})
6.  [Flyweight]({{< relref "flyweight.md" >}})
7.  [Proxy]({{< relref "proxy.md" >}})


#### Comportamentali {#comportamentali}

Riguardanti l'_interazione_ tra classi

1.  [Chain of Responsibility]({{< relref "chain_of_responsibility.md" >}})
    -   utilizzato nella gestione delle _eccezioni_, delega a ritroso
2.  [Command]({{< relref "command.md" >}})
3.  [Event Listener]({{< relref "event_listener.md" >}})
4.  [Hirarchical Visitor]({{< relref "hirarchical_visitor.md" >}})
5.  [Interpreter]({{< relref "interpreter.md" >}})
6.  [Iterator]({{< relref "iterator.md" >}})
7.  [Mediator]({{< relref "mediator.md" >}})
8.  [Memento]({{< relref "memento.md" >}})
9.  [Observer]({{< relref "observer.md" >}})
    -   oggetti _subscriber_ interessati ai cambiamenti o agli eventi di un oggetto _publisher_
        -   spesso associato al pattern architetturale `MVC`
    -   Il _publisher_ vuole un basso accoppiamento con i _subscriber_
    -   `interface` _subscriber_ o _listener_, gli oggetti subscriber implementano questa interfaccia
        -   il _publisher_ notifica i cambiamenti
    -   dipendenza **uno-a-molti**
10. [State]({{< relref "state.md" >}})
    -   il comportamento di un oggetto dipende dal suo stato
        -   i metodi contengono logica condizionale per casi
    -   classi _stato_ per ciascun stato implementanti una `interface` comune
        -   delega le operazioni che dipendono dallo stato all'oggetto stato corrente corrispondente
        -   assicura che l'oggetto contesto referenzi sempre un oggetto stato che riflette il suo stato corrente
11. [Strategy]({{< relref "strategy.md" >}})
    -   algoritmi diversi che hanno obiettivi in comune
    -   strategie come oggetti distinti che implementano una `interface` comune
12. [Template method]({{< relref "template_method.md" >}})
13. [Visitor]({{< relref "visitor.md" >}})
    -   separare l'operazione applicata su un contenitore complesso dalla struttura dati cui é applicata
    -   oggetto `ConcreteVisitor` in grado di percorrere la collezione
        -   applica un metodo proprio su ogni oggetto `Element` visitato (parametro)
    -   gli oggetti della collezione implementano una `interface` `Visitable` che consente al visitatore di essere accettato e invocare l'operazione relativa all'elemento


## Laboratorio {#laboratorio}

Progetto `Cat & Ring`


### Fase Preliminare dell'ideazione {#fase-preliminare-dell-ideazione}


#### Glossario {#glossario}


### UC Dettagliati {#uc-dettagliati}


#### Chef {#chef}

-   Chef Claudio, ansioso
    1.  foglio riepilogativo ricette e preparazioni di tutti i servizi (automatico)
        -   _opzionalmente_ puó decidere di aggiungere cose al foglio (non al menù)
    2.  ordina l'elenco per importanza/difficoltà (il metodo é soggettivo)
        -   questo puó essere fatto anche in un momento successivo o puó essere modificato
    3.  tabellone dei turni: assegna a ogni elemento dell'elenco il _turno_ e un cuoco (disponibile per quel turno)
        -   stima del tempo necessario a ogni cuoco
        -   quantità e porzioni
    4.  revisione degli assegnamenti e dell'ordine di questi
    5.  parallelamente sono creati i fogli riepilogativi dei _servizi_
-   Chef Tony, rilassato
    1.  fogli riepilogativi ricette e preparazioni di tutti i servizi (automatico)
    2.  ordina l'elenco per giorno del servizio
    3.  fogli riepilogativi dei _servizi_: assegna turno e cuoco (disponibile in quel turno)
        -   segna se ci sono preparati già pronti/avanzati da servizi precedenti
    4.  tabellone dei turni: per preparazioni critiche nelle tempistiche le assegna a turni successivi
        -   anche senza scegliere subito il cuoco

\\(\textsc{nb}\\)   emergono due nuovi concetti:

-   il **foglio riepilogativo**
    -   è associato ad un servizio all’interno di un evento, e riassume le ricette/preparazioni da preparare per quel servizio, riportando per ciascuna: se è stata assegnata, a chi e quando; se non è stata assegnata perché non serve prepararla; se il compito assegnato è stato portato a termine, e in tal caso eventuali commenti a riguardo del cuoco che l’ha preparata. Solo lo chef che ha in carico un evento e i relativi servizi può modificare (aggiungendo, eliminando o cambiando) l’elenco dei compiti nei relativi fogli riepilogativi.
-   il **tabellone dei turni**
    -   riepiloga ciascun turno i compiti già assegnati indipendentemente dal servizio per cui sono assegnati. E’ usato dallo chef per capire lo “stato” di un turno, e dai cuochi per sapere cos’hanno da fare. E’ dunque pubblico; ogni qual volta uno chef modifica i compiti a partire dal proprio foglio riepilogativo, anche il contenuto del tabellone viene modificato.

Queste sono due visualizzazioni di una stessa informazione, l'utente inserirà l'informazione una volta sola.

-   responsabilità del sistema queste visualizzazioni


#### Primi UC {#primi-uc}

-   Claudio
    1.  crea foglio riepilogativo per un servizio di un evento **oppure** apre un foglie riepilogativo esistente (tra i servizi degli eventi di cui é stato incaricato)
    2.  **opzionalmente** aggiunge preparazioni/ricette all'elenco
    3.  ordina l'elenco per importanza e/o difficoltà
    4.  **opzionalmente** consulta tabellone turni
    5.  assegna un compito a un cuoco in un dato turno (sia sul tabellone dei turni che sul foglio riepilogativo) **oppure** modifica un assegnamento **oppure** elimina un assegnamento
    6.  **opzionalmente** specifica per il compito inserito nel tabellone una stima del tempo necessario
    7.  **opzionalmente** specifica per il compito inserito nel fogilo riepilogativo le quantità/porzioni da preparare

_ripete dal passo 4. fino a che soddisfatto_

-   Tony
    1.  crea foglio riepilogativo per un servizio di un evento **oppure** apre un foglie riepilogativo esistente (tra i servizi degli eventi di cui é stato incaricato)
    2.  **opzionalmente** apre più fogli riepilogativi ripetendo il passo 1.
    3.  assegna compito a cuoco per dato turno (sia sul foglio riepilogativo che sul tabellone dei turni) **oppure** specifica che la ricetta/preparazione é già pronta **oppure** assegna un compito a un turno senza specificare il cuoco
    4.  indica quantità/porzioni per il compito inserito

_ripete dal passo 3. fino a che soddisfatto_
_torna al passo 2. oppure conclude_


#### UC Combinato {#uc-combinato}

1.  Genera foglio riepilogativo **oppure** apre foglio esistente (relativo a eventi cui é incaricato)

_se desidera ripete 1. per aprire più fogli parallelamente_
_se desidera continua con 2. altrimenti termina il caso d'uso_

1.  **opzionalmente** aggiunge preparazioni/ricette al foglio
2.  **opzionalmente** ordina l'elenco
3.  **opzionalmente** consulta tabellone dei turni
4.  assegna un compito in un dato turno e **opzionalmente** a un cuoco **oppure** specifica se il compito é già stato svolto **oppure** modifica un compito già inserito **oppure** elimina un compito già inserito
5.  **opzionalmente** specifica tempo necessario al compito e/o quantità/porzioni da preparare

_ripete dal passo 4. fino a che soddisfatto_

\\(\textsc{nb}\\)  i passi 1. (per la generazione) e 4. (gestione delle 2 viste, _foglio servizio_ e _tabellone turni_ ) sono responsabilità del **Sistema**


#### Estensioni {#estensioni}


### Progettazione {#progettazione}

Riguardo lo strato di _domain_

-   passaggio all'inglese per dividere il linguaggio prettamente tecnico e quello leggibile dai clienti
-   domain modules
    -   `MenuManagement`
    -   `KitchenTaskManagement`
-   _technical services_
    -   persistence on `DB`
    -   login

Gestione con `grasp controller` degli eventi tra `UI` e `Domain`

Il `Design Class Diagram` o `DCD`

-   é un documento unico per il progetto
    -   riporta tutte le classi
-   entro questo si puó suddividere in moduli, ma questi rimangono interdipendenti tra loro
-   questa é la parte statica

Il `Detailed Sequence Diagram` o `DSD`

-   la parte dinamica
-   le interazioni tra gli oggetti per eseguire le operazioni necessarie
-   a questo livello si vedono le chiamate e le risposte
    -   e anche le notifiche tra `observed` e `observer`

[^fn:1]: \\(\textsc{nb}\qquad\\) quella della responsabilità é una metafora per semplificare il ragionamento
