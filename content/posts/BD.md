+++
title = "Basi di Dati"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

-   Esame:
    -   Scritto 70
        -   Teoria
        -   Lab - SQL
    -   Laboratorio 30
        -   Progettazione: [BD Vaccini]({{< relref "20210422185244-bd_vaccini.md" >}})

-   Testi di riferimento
    -   Basi di Dati: Modelli e Linguaggi di Interrogazione (Atzeni, Ceri, Paraboschi, Torlone)
    -   Sistemi di basi di dati: Fondamenti (Elmasri, Navathe)


## Basi di Dati Relazionali {#basi-di-dati-relazionali}


### Modello Relazionale {#modello-relazionale}

Distinzione tra

-   **schema** della base di dati
    -   componente intenzionale
-   **istanza** della base di dati
    -   componente estensionale

Costruttore: Relazione

<span class="underline">Anni 70 - Codd</span>

-   inventa il modello relazionale a seguito dei modelli gerarchico e reticolare
    -   basati su riferimenti espliciti con puntatori
-   modello relazionale: basato sui valori stessi
    -   per favorire l'indipendenza dei dati
-   implementato poi in DBMS reali nel 1981
-   Le relazioni hanno una naturale rappresentazione con le tabella

<span class="underline">3 Accezioni</span>

-   Relazione matematica
-   Relazione secondo il modello relazionale dei dati
-   Relazione (Relationship) che rappresenta una classe di fatti in un modello Entity Relationship; traduzione alternativa **associazione**

-   Relazione
    -   sottoinsiemi di prodotti cartesiani
        -   n-uple (basate su posizione)
        -   tuple (non importa la posizione ma il nome (attributo) nella tebella)
            -   un diverso concetto di relazione che quello matematico
-   Tabelle
    -   ordinamento tra righe irrilevante
    -   ordinamento tra colonne irrilevante
    -   le righe sono diverse fra loro
    -   le intestazioni delle colonne sono diverse tra loro
    -   ogni colonna ha valori omogenei
    -   le tabelle sono in relazione tra loro attraverso i valori stessi degli attributi
        -   indipendente dalle strutture fisiche, che possono cambiare dinamicamente
        -   Si rappresenta solo cio' che e' rilevante dal punto di vista dell'applicazione
        -   Portabilita' tra un DBMS ad un altro

-   Schema di base di dati:
    -   insieme di schemi di relazione
-   (Istanza di) Relazione
    -   su uno schema di relazione R(X) dave X sono attributi: insieme r di tuple su X
-   (Istanza di) Base di dati
    -   su uno schema di base di dati: insieme di relazioni \\(\\{r\_1, ... , r\_h\\}\\)

<span class="underline">Non sono permesse tabelle nidificate</span> **prima forma normale**

-   Informazione Incompleta
    -   no valori tampone
    -   valore extra: **NULL**
        -   devono essere imposte restrizioni sulla presenza di valori nulli
    -   casi - non distinti dai DBMS
        -   valore sconosciuto
        -   valore inesistente
        -   senza informazione


#### Vincoli di integritá {#vincoli-di-integritá}

-   si garantisce la correttezza della base di dati
-   si garantisce coerenza tra i valori
-   sono predicati logici che associano a ogni istanza un valore di veritá
-   ad ogni cambiamento il DBMS verifica tutti i vincoli
-   tipologie
    -   intrarelazionali
        -   vincoli di tupla
            -   booleani di atomi che confrontano valori di attributo o espressioni aritmetiche su di essi
    -   interrelazionali

<!--list-separator-->

-  Vincoli di chiave

    -   Superchiave
        -   insieme di attributi usato per identificare univocamente le tuple di una relazione
        -   un insieme di attributi \\(K\\) é detto superchiave di una relazione \\(r\\) se \\(r\\) non puó contenere due tuple che hanno valori uguali su \\(K\\)
        -   tutti i sottoinsiemi di una superchiave sono superchiavi
    -   Una chiave (candidata) di \\(r\\) é una superchiave minimale di \\(r\\)
        -   non contiene una superchiave: se si toglie un attributo da \\(K\\) allora \\(K\\) non sará piú una superchiave
        -   tutte le chiavi sono superchiavi
        -   l'insieme di tutti gli attributi di una relazione, pur essendo superchiave, non é detto sia una chiave
    -   Una chiave primaria é una particolare chiave di \\(r\\) scelta dal progettista, é una sola anche se le chiavi possono esse piú di una
        -   non puó assumere valori nulli
        -   é rappresentata mediante sottolineatura
        -   usata per stabilire corrispondanza tra relazioni
    -   Le chiavi sono utilizzate per fare riferimento a tuple in altre relazioni

<!--list-separator-->

-  Vincoli di integritá referenziale

    Vincoli foreign key

    -   tra relazioni diverse non possiamo utilizzare vincoli chiave con valori qualsiasi
        -   questi vincoli hanno un verso
        -   devono indicare valori gia' inseriti nella relazione referenziata
        -   fatto riferimento a chiavi, non per forza primarie

    <!--list-separator-->

    -  Azioni compensative

        -   Standard
            -   rifiuto dell'operazione
        -   Eliminazione in cascata
        -   Introduzione di valori nulli


### Algebra Relazionale {#algebra-relazionale}

Formalizzata da Codd, per l'interrogazione di basi di dati

-   é una costruzione procedurale, un elenco di passi per eseguire l'interrogazione
-   la risposta é sempre un modello relazionale
-   input: relazioni del modello relazionale
-   output: relazione del modello relazionale
    -   **relazione virtuale**


#### Operatori {#operatori}

<span class="underline">Di base</span>

-   selezione - sigma
    -   \\(0 \le |\sigma | \le |r|\\)
-   proiezione - pi
    -   \\(0 \le |\pi | \le |r|\\)
    -   non devono esserci ripetizioni nel risultato, viene compattato, altrimenti non sarebbe un insieme
    -   se gli attrimuti proiettati formano una suporchiave allora la || eq |r|
-   prodotto cartesiano
    -   utilizzato per costruire altri operatori
-   unione
    -   \\(max(|r\_1|,|r\_2|) \le |\cup| \le |r\_1|+|r\_2|\\)
-   differenza
    -   \\(0 \le |-| \le |r\_1|\\)
-   ridenominazione - ro

<span class="underline">Derivati</span>

-   intersezione
    -   \\(0 \le |\rho | \le min(|r\_1|,|r\_2|)\\)
-   join - theta
    -   unione di informazioni in schemi diversi
    -   prodotto cartesiano a cui e' applicata una selezione utilizzando il predicato theta
        -   NB gli schemi sono disgiunti
    -   cardinalité molto ampia
        -   \\(0 \le |\theta | \le |r\_1(A)|\cdot |r\_2(B)|\\)
-   join - equi
    -   utilizziamo solo ugualianze
    -   possiamo specificare meglio la cardinalitá, ottimizzabile
        -   confrontando una chiave primaria e un attributo con un vincolo di integritá
            -   \\(|\theta | = |r\_1|\\)
-   natural join
    -   deriva dall'equi-join
    -   eguaglia tutti gli attributi che hanno lo stesso nome
    -   molto facile sbagliare
    -   se gli schemi sono disgiunti corrisponde al prodotto cartesiano
    -   se applicato su schemi della stessa relazione corrisponde a trovare l'intersezione
-   quoziente
    -   binario, il secondo operando deve essere parte del primo
    -   r(A,B) q s(B)
        -   u(A) risultato, contiene le tuple che in r(A,B) compaiono in combinazione con ogni tupla in s(B)

I Join visti sono tutti Inner-join o Join interni

-   Outer (natural) Join - Join Esterni: mantengono tutte le tuple inserendo NULL dove non esiste corrispondenza
    -   Left join
    -   Right join
    -   Full join


#### Predicati {#predicati}

Un'espressione booleana formata componendo predicati atomici

-   attributo - costante
-   attributo - attributo
    -   '-' operatore di confronto

La cardinalitá di una predicato é compresa tra 0 (relazione vuota) e la cardinalitá di r, se il predicato é vero per ogni tupla

Per semplificare la lettura delle query si puó scriverne gli alberi sintattici


#### Interrogazioni con Negazione {#interrogazioni-con-negazione}

caso <span class="underline">semplice</span> se possibile utilizzare selezione 'diverso da', negandolo
caso <span class="underline">complesso</span> se é una negazione essenziale, é innegabile

-   premesse
    -   si lavora all'interno delle basi di dati: **Closed-World Assumption**
        -   tutto cio' che esiste é contenuto all'interno della base di dati
        -   i soli fatti veri del mondo sone quelli presenti nella base di dati
            -   se qualcosa non é descritto non esiste
-   si definisce l'universo \\(U\\)
    -   es: medici
-   si risponde in forma positiva alla domanda \\(P\\)
    -   es: tutti i medici primari
-   si risponde con il complemento \\(R : U-P\\)
    -   es: medici - medici_primari

<span class="underline">Negazione essenziale nascosta</span>

-   es: elencare i pazienti con un solo ricovero
    -   aka: elencare i pazienti ricoverati almeno una volta e che non hanno avuto due o piu' ricoveri
-   es: estrarre il massimo
    -   facciamo il prodotto cartesiano dell'attributo
        -   controlliamo se un numero é minore di almeno un altro numero della relazione

**La quantificazione universale é la negazione di una quantificazione esistenziale**


#### Semantica di Codd del valore nullo {#semantica-di-codd-del-valore-nullo}

-   Info esistente ma non nota
-   Info inesistente
-   Info che non si sa se classificare nel primo o nel secondo caso

Il modello relazionale non distingue i tre casi: <span class="underline">l'interpretazione del valore nullo é esterna al modello relazionale</span>

Il confronto tra una costante ed una tupla con valore nullo per Codd rispetta la **logica a 3 valori**

-   **False** (0)
-   **True** (2)
-   **Unknown** (1)
    -   sempre quando si confronta almeno un valore nullo
    -   non é possibile cercare valori NULL quindi: si introducono IS NULL e IS NOT NULL
        -   unici operatori che non danno mai NULL, solo TRUE o FALSE

Vanno estese le tabelle di veritá degli operatori base della logica classica

-   and
    -   minimo
-   or
    -   massimo
-   not
    -   2-p


#### Proprietá {#proprietá}

-   Commutativa del prodotto cartesiano
-   Commutativa del Theta-join
-   Associativa del prodotto cantesiano
-   Associativa ristretta del Theta-join
    -   a patto che gli attributi de Theta possano essere suddivisi
        -   vedere `slide 04`
-   Selezione multipla
-   Sostituzione di operatori
-   Distributiva della selezione rispetto alla proiezione
    -   la proiezione deve includere la selezione affinche la proprietá valga in entrambi i versi
-   Distributiva ristretta della selezione rispetto al prodotto cartesiano
-   Distributiva ristretta della selezione rispetta ai join
-   Distributiva della selezione rispetta all'unione, intersezione e differenza
-   Proiezione multipla
-   Distributiva della proiezione rispetta al prodotto cartesiano
-   Distributiva ristratta della proiezione rispetta al join
-   distributiva della proiezione rispetta all'unione


#### Calcolo Relazionale {#calcolo-relazionale}

<span class="underline">Linguaggio di tipo procedurale</span>

-   l'utente indica il risultato a cui vuole arrivare, il DBMS sceglie la strategia ottimale

L'interrogazione delle basi di dati puó avvenire con un approccio dichiarativo

-   si specificano le proprietá del risultato


#### Su tuple con dichiarazione di range {#su-tuple-con-dichiarazione-di-range}

L'algebra relazionale é procedurale, esiste un approccio dichiarativo fondato sulla logica:

-   Le variabili denotano tuple
-   si specifica il range dei valori (relazioni) che le variabili possono assumere

Un'integrazione ha questa forma:
     { `Target` | `Range List` | `Formula` }

Nella formula é possibile specificare anche predicati esistenziali o universali: \\(\exists\\) e \\(\forall\\)
In particolale la `formula` é un predicato del primo ordine che puó contenere sia variabili libere che quantificate (vincolate). Le variabili libere presenti devono essere dichiarate nella range list

Questo schema si trasporta direttamente su SQL:
      `select ... from ... where ...`

Il prodotto cartesiano é facilmente  esprimibile con
    { `x.*,y.*` | `x(R),y(S)` }

L'unione di due tuple non é esprimibile (con due relazioni nella range list otterremmo il prodotto cartesiano)

L'operatore di implicazione é utilizzato per definire della condizioni pregresse alla formula
\\(\alpha \implies \beta\\)

-   se \\(\alpha\\) é falso l'implicazione é sempre vera

Manca comunque il concetto di ricorsione rispetto alla computazione

-   richiedono chiusura transitiva, SQL lo permette


#### Calcolo sui domini {#calcolo-sui-domini}


### SQL (LAB) {#sql--lab}

Standard `SQL-92`, il piú diffuso
La maggior parte dei DBMS si basa sull'architettura client/server

-   Server accetta le connessioni dei client e interagisce sui database su delega
-   il programmatore usa intefacce al DBMS chiamate `Client Library`


#### DLL {#dll}

Il linguaggio é <span class="underline">dichiarativo</span> per la maggior parte

-   l'utente definisce cosa vuole non come ottenerlo, si ignora idealmente l'aspetto prestazionale e di efficienza

-   `unique`
    -   se piú `null` non infrangeranno il vincolo
-   `primary key`
    -   possibile una tabella senza ma sconsigliabile
    -   sottointeso
        -   `not null`
        -   `unique`
    -   possibile sia composta da piú attributi
-   `foreign key` ... `refences`
    -   chiave esterna

Normalmente la violazione di un viscolo non vengono accettate
In caso di violazione di integritá referenziale si possono specificare reazioni diverse a seconda se la violazione sia interna o esterna

-   l'asimmetria deriva dal fatto che dal punto di vista applicativo la tabella esterna ricopre il ruolo di tabella <span class="underline">master</span> e quella interna di <span class="underline">slave</span>: `on update` ... / `on delete` ...
    -   `cascade`
        -   nuovo valore riportato in tutte le corrispondenti righe della tabella interna
        -   in caso di cancellazione si cancellano le righe nella interna
    -   `set null`
    -   `set default`
    -   `no action`
        -   l'azione non viene consentita
    -   non tutti i DBMS non sono possibili tutti questi vincoli di integritá referenziale
    -   é possibile assegnare nomi ai vincoli
        -   in modo da referenziarli per aggiornarli, modificarli, eliminarli
-   sintassi porticolare per la modificazione delle definizioni, della schema definito
    -   `alter`
    -   `drop`
    -   `add`

-   `insert into` ... `values` ...
-   `delete from` ... `where` ...
    -   se non specificato `where` saranno eliminate tutte le tuple

-   `like`
    -   utilizzabili caratteri speciali per ricerche regex-like, solitamente case-sensitive
    -   %
        -   sequenza di lunghezza arbitraria (anche zero)
    -   _
        -   carattere qualsiasi (deve esserci)

Per effettuare un join:

-   elencare le tabelle di interesse nel `from`
-   definire nel `where` le condizioni necessarie per il join

Oppure:

-   `join`
    -   `select` ... `from` ... `[ inner | right | left | full ] join` Tab1 `on` Cond `where` ...
    -   `outer join` ottengono tutto ció che ottiene un `inner` con in piú righe che non hanno una corrispondenza nella tabella di sinistra o destra
        -   **NB** il full join non é disponibile in <span class="underline">MySQL</span>
        -   le operazioni di outer join se concatenate vanno parentizzate per chiarire quale tabella sará la sx o dx dei join

In algebra relazionale le tabelle sono insiemi di tuple (quindi diverse tra loro)
In SQL si possono avere nelle tabelle risultanti righe uguali

-   per motivi di efficienza la rimozione dei duplicati é effettuata solo se richiesta dal utente
    -   `distinct`

É possibile specificare l'ordinamento del risultato delle query:

-   `order by` Attribute1 [asc | desc], Attribute2 [asc | desc] ...

Il default é <span class="underline">ascending</span> e quindi crescente

_null_ nella logica a 3 valori implica risultato sempre `unknown`, allora SQL offre i predicati:

-   `is null` che restituisce sempre **true** o **false**
-   `is not null` per l'opposto

Per la logica a 3 valori alcune apparenti tautologie su tabelle con presenti valori _null_ restituiranno risultati inaspettati

-   le tuple per cui la condizione é `unknown` sono escluse dal where normalmente
    -   é necessario specificare `where ... or ... is null`

Esiste la funzione `coalesce` che restituisce il primo parametro non nullo

-   _null_ se tutti sono nulli
-   puó essere utilizzato per sostituire eventuali _null_ nella tabella risultante della query

I commenti possono essere specificati:

-   -- Commento
-   _\* Commento multi-riga \*_


#### DML {#dml}

Funzioni aggregate

-   conteggio
-   somma
-   massimo
-   minimo

select ...

`count`

-   conta il numero del risultato della query
    -   anche eventuali NULL
-   puó essere utilizzato anche su singoli attributi, anche piú di uno (allora ignorerá i NULL)
    -   puó essere anche specificato `distinct`

`sum`
`avp`
`max`
`min`

-   questi 2 possono essere utilizzate su stringhe, seguendo l'ordine alfabetico

I DBMS di solito forniscono altre funzioni (come deviazione standard)

Non é possibile utilizzare F. aggregate nella clausola `where`

`group by`

-   aggrega secondo un attributo il risultato
-   gli attributi selezionati devono essere discriminanti
-   NULL é considerato un valore a parte, vengono raggruppati

clausola `having`

-   specifica condizioni da verificare dopo il risultato
-   diversamente da `where` vanno messe condizioni su funzioni aggregate

`operatori insiemistici`
si applicano a tabelle con esattamente gli stessi attributi
si inseriscono tra query

-   `union`
    -   `all` mantiene i duplicati
-   `intersect`
    -   `all` mantiene i duplicati
-   `except` / differenza
    -   `all` mantiene i duplicati

`query nidificate`
query all'interno di altre query

-   si risolvono problemi intermedi passando il risultato al problema esterno
-   `semplici` stratificate
    -   `where`
        -   se la query restituisce una sola riga allora si utilizzano i classici operatori
        -   altrimenti usiamo i quantificatori
            -   `any`
                -   il ris deve essere soddisfatto da almeno una riga
            -   `all`
                -   il ris deve essere soddisfatto da tutte le righe
                -   in caso di NULL all non seleziona mai nessuna riga
-   `in` e `not in`

-   `correlate` incrociate
    -   dall'interno si fanno riferimento a tabelle esterne
    -   le query vengono valutate con passaggio di binding tra un conteste e l'altro
    -   `exists` e `not exists`
        -   vera se la query interna non é vuota o lo é


## Programmazione di Basi di Dati {#programmazione-di-basi-di-dati}

-   Ciclo di vita di un sistema informativo:
    -   Studio di fattibilitá
    -   Raccolta e analisi dei requisiti
    -   Progettazione
    -   Implementazione
    -   Validazione e collaudo
    -   Funzionamento
-   Modello 3-tier (ogni strato offre API)
    -   User Interface
    -   Business
    -   Data
        -   DBMS
-   Fasi Progettazione
    -   Raccolta e _Analisi dei requisiti_ (informali)
    -   Progettazione _concettuale_ (indipendente dal DBMS)
        -   separazione netta tra schema concettuale e logico
        -   produce
            -   schema ER
            -   Documentazione complementare (business rules)
    -   Progettazione _logica_
    -   Progettazione _fisica_ (Basi di dati II)

Il processo di riproduzione di uno schema concettuale a partire da una schema logico é chiamato Reverse Engineering


### Metodologie e modello Entity-Relationship (LAB) {#metodologie-e-modello-entity-relationship--lab}

`ER`
Non modella il comportamento del sistema, come UML, ma <span class="underline">modella i dati</span>


#### Costrutti {#costrutti}

<!--list-separator-->

-  Entitá

    Rappresentano aspetti del mondo reale con <span class="underline">esistenza "autonoma"</span> ai fini della'applicazione
    Sono rappresentate da rettangoli, hanno nomi propri e unici.
    L'occorrenza di un'entitá é un oggetto della classe che l'entita rappresenta. Le entitá possono essere pensate come l'`insieme` delle loro occorrenze
    Un'occorrenza di entitá non si riduce ai valori che la identificano: questo a differenza del modello relazionale

<!--list-separator-->

-  Attributi

    <span class="underline">Proprietá delle entitá o associazioni</span> che sono di interesse ai fini dell'applicazione

    -   dominio, insieme dei valori ammissibili per l'attributo
    -   linea con pallino vuoto
    -   possono essere composti se sono a loro volta divisi in sottoattributi
        -   **questo non ha una corrispondenza nel modello relazionale**
    -   possono avere una cardinalitá
        -   se non specificata si sottointende 1:1
        -   attributi multivalore
            -   costrutto non ammesso dal modello relazionale
                -   ogni tupla ha un singolo valore

<!--list-separator-->

-  Associazione

    Rappresentano legami logici tra due e piú entitá
    Sono rappresentate da rombi. Sono linee semplici che collegano le associazioni, non c'é un verso di lettura.
    Le Associazioni possono essere ricorsive.

    -   Simmetriche
    -   Non simmetriche
        -   occorre specificare i versi che specificano la associazione

    Le occorrenze di un'associazione fra due entitá sono le coppie delle occorrenze delle entitá.
    Un'associazione puó essere pensata come l'`insieme` delle sue occorrenze (essendo un'insieme <span class="underline">non possono esserci duplicati</span>)

    -   **cardinalitá** , numero di occorrenze dell'associazione a cui l'occorrenza di entitá puó partecipare
        -   nella pratica si usano
            -   0, 1 , n (minimo)
                -   si usa piú spesso una c.minima 0
                    -   perché alla prima occorrenza di entitá spesso non esistono ancora le corrispondenti occorrenze delle entitá a essa collegate
            -   1, n     (massimo)
        -   classificazioni (si considerano le cardinalitá massime a sx e dx)
            -   molti a molti
            -   uno a molti
            -   uno a uno

<!--list-separator-->

-  Identificatori

    Simile al concetto di chiave primaria ma **diverso**

    -   che é un concetto del modello relazionale
        -   **differenza**: possiamo avere piú identificatori allo stesso tempo, nel modello relazionale abbiamo una sola chiave primaria

    Identificano univocamente le occorrenze di una entitá, rappresentati da pallini pieni
    Distinti in

    -   identificatore interno
        -   attributi dell'entitá
    -   identificatore esterno
        -   attributi dell'entitá e entitá esterne attraverso associazioni

    Ogni entitá deve avere almeno un identificatore, questo per facilitare il passaggio al modello relazionale.

    -   NB
        -   ogni attributo che fa parte di un identificatore deve avere cardinalitá (1,1)
        -   in id. esterna é possibile solo attraverso associazioni a cui l'entitá da identificare partecipa con cardinalitá (1,1)
        -   una id. esterna puó convolgere entitá a loro volta identificate esternamente purché non vengano generati cicli

<!--list-separator-->

-  Generalizzazioni

    Mette in relazione una o piú entitá

    -   \\(E\\) generalizzazione dei figli
        -   figli sono _specializzazioni_ di \\(E\\)

    -   Proprietá
        -   ogni occorrenza di una specializzazione é una occorrenza di \\(E\\)
        -   ogni proprietá di \\(E\\) é una proprietá dei figli, per ereditarietá
    -   Classificazioni (combinabili)
        -   Totale/Parziale
            -   ogni occorrenza padre é occorrenza di almeno una dei figli; altrimenti é parziale
        -   Esclusiva/Sovrapposta
            -   ogni occorrenza padre é occorrenza al piú di una delle entitá figlie; altrimenti é sovrapposta

    -   Sottoinsieme
        -   generalizzazione con una sola entitá figlia


#### Documentazione {#documentazione}

-   Descrizione dei concetti
    -   dizionario dei dati per le entitá
    -   dizionario dei dati per le associazioni
-   Vincoli non esprimibili in E-R: **business rules**
    -   Vincoli di integritá
    -   Vincoli di derivazione


### Progettazione Concettuale e Logica (LAB) {#progettazione-concettuale-e-logica--lab}


#### Concettuale {#concettuale}

Analisi dei requisiti, spesso ambigui.
Vanno rimosse le ambiguitá

-   fonti di requisiti
    -   utenti
        -   utenti diversi possono fornire info contraddittorie
            -   vanno verificati gli aspetti essenziali e i casi limite
    -   documentazione esistente
        -   normative
        -   regole interne
    -   realizzazioni preesistenti

<!--list-separator-->

-  Pattern di progettazione

    un ricettario di casi comuni di progettazione

    -   `Reificazione di attributo di entitá`
        -   una associazione non puó rappresentare cose che si ripetono
    -   `Part-of`
    -   `Instance-of`
    -   `Storicizzazione di un'entitá`
        -   generalizzazione
            -   storico
                -   aggiunge attributi (fine)
            -   corrente
    -   `Storicizzazione di un'associazione`
        -   si sdoppia la associazione
        -   o si reifica l'associazione e poi si generalizza quest'ultima
    -   `Evoluzione di concetto`
    -   `Reificazione di associazione ternaria`
        -   permette di capire la correttezza dell'associazione ternaria

<!--list-separator-->

-  Strategie di progettazione

    -   `top-down`
        -   serie di raffinamenti successivi
        -   aumenta il dettagli passo passo
        -   entitá senza attributi e relazioni
            -   poi concretizziamo aggiungendo dettagli
        -   pro: si possono ignorare i dettagli inizialmente
        -   contro: é possibe solo se si possiede una visione gloxarlle di tutte le componenti
    -   `bottom-up`
        -   partiamo da specifiche divise in parti elementari
            -   di queste sono fatti i singoli schemi ER
        -   poi aggreghiamo in uno schema finale
        -   pro: le parti semplici sono da spartire e sviluppare a se stanti
        -   contro: possono sorgere problemi nel aggregare schemi completamente diversi
    -   `inside-out`
        -   individuiamo concetti chiave e partiamo da lí
        -   ci espandiamo a partire da questi ultimi
        -   pro: non richiede passi di integrazione
        -   contro: ogni passo vanno riesaminati gli elementi presenti e non presenti

    <span class="underline">Nella pratica si utilizza una strategia ibrida</span>

    -   vanno suddivisi i requisiti in componenti separati
    -   si forma uno schema scheletro
        -   fa da base per successivi raffinamenti

<!--list-separator-->

-  Schema di Analisi

    -   Inizialmente
        -   vanno specificate parole abigue, concetti simili tra loro
            -   individuare omonimie (stessa parola ma diverso concetto) e sinonimie (stessa parola e stesso concetto)
                -   posti (di impiego), posto (di nascita)
                -   luoghi (di nascita), luogo (delle lezioni)
                -   partecipanti, studenti
        -   standardizzare la sintassi
            -   es: "per ENTITÁ rappresentiamo ATTRIBUTI"
        -   costruire un glossario dei termini
            -   termine | descrizione | sinonimi | collegamenti
            -   ancora un lavoro linguistico, non corrispondono necessariamente alle entitá
    -   **Strutturazione dei Requisiti** in gruppi di frasi omogenee
        -   Frasi relative ai partecipanti
        -   Frasi relative ai datori di lavoro
        -   Frasi relative ai corsi
        -   Frasi relative a particolari partecipanti
        -   Frasi relative ai docenti
    -   **Operazioni** (piú impattanti sul sistema) sui dati
        -   e frequenza
        -   per assicurarci che i dati permettano di svolgere tutti le operazioni
        -   per poter considerare l'efficienza del nostro schema logico piú avanti
    -   **Progettazione concettuale** vera e propria
        -   se un concetto da proprietá significative e descrive oggetti con esistenza autonoma
            -   **entitá**
        -   se é semplice e non ha proprietá
            -   **attributo** ad un'altra entitá
        -   se correla due o piú concetti
            -   **associazione** (se non possono ripetersi, altrimenti dovrá essere un'altra entitá)
        -   se é un caso  particolare di un altro
            -   **generalizzazione**

<!--list-separator-->

-  Qualitá di uno schema ER

    -   Correttezza
    -   Completezza
    -   Leggibilitá
    -   Minimalitá


#### Logica {#logica}

Obiettivo: <span class="underline">tradurre lo schema concettuale in uno schema logico che rappresenti gli stessi dati in maniera corretta ed efficiente</span>

-   é necessario considerare le prestazioni
-   ci sono aspetti non direttamente rappresentabili

IN:

-   schema concettuale
-   info sul carico applicativo
    -   utili nella ristrutturazione dello schema concettuale dal punto di vista dell'efficienza
-   modello logico che si intendo usare (nel nostro caso relazionale)

OUT:

-   schema logico
-   vincoli di integritá
-   documentazione associata

<!--list-separator-->

-  Fasi

    <!--list-separator-->

    -  Ristrutturazione dello schema concettuale (EER)

        -   vanno rimosse inefficienze
        -   se serve si cambiano le business rules

        Si crea uno schema che non é piú uno schema concettuale in quanto si introducono considerazioni applicative
        Non si possono valutare prestazioni senza parametri fisici

        -   facciamo solo una stima con indicatori di **massima**
        -   **Indicatori di prestazione**
            -   _tempo_
                -   numero di occorrenze di entitá e di associazioni visitate per eseguire un'operazione sul DB
            -   _spazio_
                -   necessario per rappresentare i dati
            -   _volume_
                -   numero di occorrenze
                -   dimensione degli attributi
            -   caratteristiche delle _operazioni_
                -   operazione interattiva/batch
                -   frequenza
                -   entitá/associazioni coinvolte

        -   **Tavola dei Volumi**
            -   concetto | tipo | volume

        -   **Tavola delle Operazioni**
            -   operazione | descrizione | tipo | frequenza
                -   particolare attenzione per le op. di tipo interattivo
            -   di solito sufficiente considerare solo le operazioni principali per la regola 80-20

        Passi:

        1.  Analisi delle `ridondanze`
            1.  ridondonza: informazione significativa ma derivabile da altre
                -   si decide se eliminare o mantenere le ridondanze
                    -   **passo piú difficile**
                    -   derivabile da attributi della stessa entitá o associazione
                    -   derivabile da attributi di altre entitá o associazioni
            2.  <span class="underline">vantaggi</span>
                -   in caso di op. di interrogazione/lettura dei dati
                    -   semplificate
                    -   piú efficienti
            3.  <span class="underline">svantaggi</span>
                -   op. di inserimento e modifica dei dati
                    -   meno efficienti
            4.  maggiore occupazione di spazio
            5.  Analisi **costi/benefici**
            6.  per ogni ridondanza
                -   per ogni operazione significativa su cui la presenza o assenza della ridondanza puó avere effetto
                    -   schema delle operazioni nei due scenari
                    -   tavola degli accessi nei due scenari

        2.  Eliminazione delle `generalizzazioni`
            1.  accorpamento dei figli della generalizzazione nel genitore
                -   se la generalizzazione é totale/esclusiva vanno aggiunte regole aziendali
                    -   esclusiva: vincolo che gli attributi non possono essere contemporaneamente valorizzati
                    -   totale: vincolo che gli attributi non possono essere contemporaneamente valorizzati
                -   conveniente quando le operazioni non fanno troppa distinzione tra le istanze della varie entitá (le transazioni accederebbero infatti a un'unica tabella relazionale)
                -   spreca spazio producendo una base di dati con valori nulli
            2.  accorpamento del genitore della generalizzazione nei figli
                -   possibile quando la generalizzazione é a partecipazione totale
                    -   conveniente quando le operazioni effettuano pochi accessi alle istanze di entrambe le entitá
                    -   ottimizza maggiormente lo spazio rispetto alle altre alternative perché usa meno attributi e associazioni
            3.  sostituzione della generalizzazione con associazioni
                -   se esclusiva occorre aggiungere il vincolo che ogni occorrenza del genitore non puó partecipare contemporaneamente alle due relazioni
                -   se totale occorre aggiungere il vincolo che ogni occorrenza del genitore deve partecipare ad una delle relazioni

        3.  `Partizionamento` / `Accorpamento` di entitá e associazioni
            -   dipende dalle transazioni che accedono alle istanze, se necessitano spesso di informazioni relative ad altre entitá
            -   gli accorpamenti si fanno in genere su entitá legate da associazioni 1 a 1

        4.  Scelta degli `identificatori principali`
            -   si sceglie un identificatore per le entitá che ne hanno piú di uno
            -   indispensabile per la traduzione nel modello relazionale
            -   criteri
                -   assenza di opzionalitá
                -   semplicitá
                -   utilizzo nelle operazioni piú frequenti o importanti
            -   se nessun identificatore rispetta i requisiti si introducono nuovi attributi (codici) appositamente
            -   puó essere necessario creare un identificatore surrogato

        5.  Eliminazione degli `attributi multivalore`
            -   si reificano in entitá e si collegano con relazioni

        6.  Eliminazione degli `attributi composti`
            -   vengono ereditati direttamente dall'entitá

    <!--list-separator-->

    -  traduzione verso il modello logico e ottimizzazione

        -   algoritmo traduce lo schema
            -   Le `entitá` diventano relazioni con gli stessa attributi delle entitá
            -   Le `associazioni` diventano relazioni con attributi delle associazioni + gli identificatori delle entitá coinvolte

        **Associazioni:**
        (le cardinalitá minime non sono tenute in conto, sarebbero necessari costrutti SQL complessi e poco efficienti)

        -   molti a molti
            -   attributi
                -   chiavi delle entitá legate
                -   suoi attributi
            -   la chiave primaria é l'unione delle chiavi delle entitá (ora a loro volta relazioni)
            -   vincoli di integritá referenziale
                -   Tra gli attributi della ex associazione e gli attributi delle ex entitá
            -   puó essere comodo ridenominare gli attributi con il nome delle entitá
                -   in questo modo lo schema sará piú facilmente leggibile
            -   non cambia anche per associazioni ricorsive
        -   uno a molti
            -   possiamo accorpare gli attributi della relazione dell'associazione in uno delle due ex entitá, quella che avrá la stessa chiave primaria (dalla parte del 1 non dei molti)
            -   la relazione puó modellare sia cardinalitá minima 1 che 0
                -   0 allora gli attributi saranno **NULLABLE**
        -   uno a uno
            -   due modi simmetrici e entrambi validi
                -   con vincoli unique sulla relazioni
            -   terza possibilitá
                -   usare un'unica relazione
                    -   puó non essere fedele all'idea iniziale
            -   se ci sono cardinalitá minime 0
                -   se solo 1 conviene tradurre dalla parte 1,1
                    -   si evitano valori nulli nella relazione
                -   se entrambi
                    -   si aggiunge una relazione per l'associazione con chiave primaria una tra le due chiavi delle entitá e un vincolo unique sulla chiave non utilizzata
                        -   non ci sono valori nulli a differenza delle altre possibilitá


### Ottimizzazione {#ottimizzazione}


#### Logica {#logica}

1.

2.

3.

4.

5.

6.

7.


#### Fisica {#fisica}


### Normalizzazione {#normalizzazione}

Le forme normali sono proprietá che garantiscono l'assenza di determinati difetti nella base di dati
Una relazione _non_ in forma normale:

-   presenta <span class="underline">ridondanze</span>
-   causa <span class="underline">anomalie</span> quando si aggiornano, cancellano e inseriscono dati
    -   `Criticitá di esprimibilitá`
    -   `Criticitá di efficienza`
        -   per cambiare un dato questo va modificato in _tutte_ le tuple che lo coinvolgono

Queste forme sono definite sul modello relazionale (solitamente)
La **normalizzazione** puó essere usata come tecnica di **verifica** dei risultati della progettazione


#### Dipendenze Funzionali {#dipendenze-funzionali}

Ci sono attributi che caratterizzano concetti, inoltre alcuni attributi hanno una correlazione tra di loro.
Esistono vincoli (a volte impliciti) tra attributi che caratterizzano lo stesso concetto
\\(X\\) e \\(Y\\) sottoinsiemi di attributi di \\(A\\)
Vincolo di dipendenza funzionale \\(X \rightarrow Y\\) (\\(X\\) _determina_ \\(Y\\))

-   se e solo se
    -   \\(\forall t\_1,t\_2\in r (t\_1[X]=t\_2[X] \implies t\_1[Y]=t\_2[Y])\\)

Le dipendenze funzionali si modellano conoscendo il _dominio_ che si rappresenta

<!--list-separator-->

-  Problema dell'equivalenza

    Come stabilire che due insiemi di dipendenze funzionali sono equivalenti?

    -   dimostrazione della biimplicazione
    -   utilizzare la **Teoria di Armstrong**
    -   calcolarne la chiusura

    Due `def` di equivalenza

    1.  \\(F \equiv G \iff F\vdash G \land G \vdash F\\)
        -   deducibile
    2.  \\(F \equiv G \iff F^+ = G^+\\)

    La chiusura di un insieme di dipendenze funzionali e la chiusura di un insieme di attributi sono strettamente legati:
    \\(X \rightarrow Y \in F^+ \iff Y \subseteq X\_X^+\\)
    allora
    controllo che ogni \\(X \rightarrow Y\\) di \\(F\\) é deducibile in \\(G\\): \\(Y \subseteq X\_G^+\\) e viceversa che ogni \\(X \rightarrow Y\\) di \\(G\\) é deducibile in \\(F\\): \\(Y \subseteq X\_F^+\\)

    1.  \\(F \equiv G \iff \forall X \rightarrow Y \in F(Y \subseteq X\_G^+) \land \forall X \rightarrow Y \in G(Y \subseteq X\_F^+)\\)

    <!--list-separator-->

    -  Teoria di Armstrong

        **Assiomi** della Teoria di Armstrong

        -   assiomi non sono dimostrabili, _sarebbero meglio definibili come regole_
        -   Riflessivitá
        -   Unione
        -   Transitivitá

        Si dimostra che la Teoria é `corretta` e `completa`

        **Regole** aggiuntive

        -   Espansione
        -   Decomposizione
            -   si applica solo al conseguente
        -   Pseudo-transitivitá
        -   Prodotto

    <!--list-separator-->

    -  Chiusura di un insieme F

        Calcolo di \\(F^\*\\) applicando Armstrong fino a che non é piú possibile applicarne le regole
        \\(F \equiv G \iff F^+ = G^+\\)
        ma la complessitá di un algoritmo che verifica l'equivalenza é almeno **esponenziale** in \\(|F|\\)

    <!--list-separator-->

    -  Chiusura di un insieme di Attributi

        \\(X\_F^+ = \\{A \mid X \rightarrow A \in F^+\\}\\)
        Ottenibile con un algoritmo,
        possiamo ciclare sul insieme \\(F\\) aggiungendo gli attributi alla chiusura passo passo e ripetendo fino al termine del algoritmo
        É dimostrabile che l'algoritmo é `corretto` e `completo`
        La complessitá é **polinomiale**

<!--list-separator-->

-  Dipendenze Funzionali e Superchiavi

    Nuova definizione in luce della definizione di Dip. F.
    Dato uno schema di relazione \\(R(A)\\) con Dip. F. \\(F\\) un insieme di attributi \\(K \subseteq A\\) é superchiave se e solo se \\(A=K\_F^+\\)

    -   cioé se in \\(F^+\\) si trova il vincolo di dipendenza funzionale \\(K \rightarrow A\\)

    Una chiave (candidata) é una superchiave minimale


#### Decomposizioni {#decomposizioni}

Normalizzazione consistente nella decomposizione di uno schema di relazione in modo da ottenere piú schemi che rispettino una forma normale e minimizzino le anomalie

-   esistono diverse forme normali

<!--list-separator-->

-  Senza perdita

    Da una relazione originale ottengo la decomposizione proiettandola rispetto agli attributi scelti
    \\(r\_1(A\_1) = \pi\_A\_1(r(A))\\)
    \\(r\_2(A\_2) = \pi\_A\_{2}(r(A))\\)
    \\(A\_1 \cup A\_2 = A\\)
    Posso ricomporre le informazioni con un natural join, includendo peró eventuali `spurie`

    -   pur avendo tuple in piú ho una `perdita di informazioni` in quanto non si sa quale sia la combinazione originale

    <span class="underline">Una decomposizione é senza perdita se non ha tuple spurie nel self join</span>

    `Teorema`
    La decomposizione di \\(R\\) é senza perdita di informazione per ogni istanza che soddisfa le dipendenze funzionali \\(F\\) se e solo se:
    \\(A\_1 \cap A\_2\\) é superchiave di \\(A\_1\\) oppure
    \\(A\_1 \cap A\_2\\) é superchiave di \\(A\_2\\)

    -   questa intersezione di attributi é quella usata dal natural join per ricomporre \\(R\\)

    Quindi con \\(K\\) superchiave di \\(R\\) se e solo se \\(K \rightarrow A \in F^+\\)
    \\(A\_1 \subseteq (A\_1 \cap A\_2)\_F^+ \lor A\_2 \subseteq (A\_1 \cap A\_2)\_F^+\\)

<!--list-separator-->

-  Che conservano le dipendenze

    Definendo le restrizioni di \\(F\\) di \\(R\\) in

    -   \\(F\_1\\) restrizione di \\(F\\) in \\(R\_1\\)
    -   \\(F\_2\\) restrizione di \\(F\\) in \\(R\_2\\)

    `def` restrizione

    -   \\(F\_1 = \\{X\rightarrow Y \mid (X \rightarrow Y \in F^+) \land (X,Y\subseteq A\_i)\\}\\)

    Ma alcune decomposizioni non conservano le dipendenze

    -   andrebbero aggiunte le d.f. perse come vincoli globali
        -   molto costoso, all'aggiunta di una tupla andrebbe fatto il join e ricontrollata la condizione


#### Le Forme Normali {#le-forme-normali}

Sono ricette di buona progettazione volte alla minimizzazione delle ridondanze e anomalie
A una forma puó essere associato un algoritmo di normalizzazione
Esistono forme diverse, diversi compromessi tra proprietá delle decomposizione, compattezza e minimizzazione delle anomalie

<!--list-separator-->

-  BCNF

    Per ogni \\(X \rightarrow Y \in F\\) si verifica almeno una delle condizioni:

    1.  \\(Y \subseteq X\\) ovvero \\(X \rightarrow Y\\) é una dipendenza riflessiva
    2.  \\(X\\) é superchiave di \\(R\\)

    La BCNF, escludendo le d.f. banali (riflessive), ammette solo d.f. che dipendono da superchiavi

    -   evita `ridondanze`
        -   aka ripetizione evitabile
        -   evitabili se deducibile da altre informazioni
        -   ogni d.f. introduce una ripetizione
        -   ma se ogni d.f. non banale é BCNF non ho ripetizioni in quanto X é superchiave per def, quindi non é detto che due tuple con X uguale siano uguali su Y
    -   evita `anomalie`
        -   aggiornamento
            -   causate da ridondanze
            -   in BCNF non ci sono ridondanze
        -   inserimento/cancellazione
            -   ogni concetto viene rappresentato in una relazione a sé e quindi un inserimento non darebbe problemi di NULL

    Ma esistono degli schemi che víolano la BCNF e per cui non esiste alcuna decomposizione in BCNF che conservi le dipendenze

<!--list-separator-->

-  3NF

    -   meno restrittiva
    -   non elimina tutte le anomalie
    -   é sempre possibile raggiungerla conservando le dipendenze funzionali

    `def` **Attributo Primo**
    Data una relazione \\(R(A)\\) gli attributi \\(Y \subseteq A\\) sono detti **attributi primi** se e solo se \\(Y \subseteq K\\), dove \\(K\\) é chiave di \\(R(A)\\)

    Per ogni \\(X \rightarrow Y \in F\\) si verifica almeno una delle seguenti proprietá:

    1.  \\(X \rightarrow Y\\) é riflessiva
    2.  \\(X\\) é superchiave
    3.  \\(Y\\) sono attributi primi

    Se una relazione é in BCNF allora é anche in 3NF, <span class="underline">l'inverso non é necessariamente vero</span>.
    La 3NF puó avere <span class="underline">anomalie</span> di inserimento e cancellazione


#### Insieme di copertura minimale {#insieme-di-copertura-minimale}

Un insieme \\(F^'\\) di d.f. é un insieme di copertura minimale rispetto a \\(F\\) quando:

1.  \\(F^' \eq F\\)
    -   \\(F^'\\) é **copertura** per \\(F\\)
2.  in ogni \\(X \rightarrow Y \in F^'\\), \\(Y\\) é attributo singolo
    -   **forma canonica**, non necessario ma semplifica la trattazione
3.  ogni \\(X \rightarrow Y \in F^'\\) é priva di attributi estranei
4.  ogni \\(X \rightarrow Y \in F^'\\) non é ridondante

2., 3. e 4. indicano che \\(F^'\\) é **minimale**

`Algoritmo`

1.  decomporre in attributi singoli le d.f.
2.  eliminare attributi estranei
3.  eliminare d.f. ridondanti

La complessitá é **polinomiale**

-   contiene cicli su F e cicli su X con all'interno il calcolo della chiusura di attributi che é polinomiale

<!--list-separator-->

-  Attributo estraneo

    Un attributo in uno d.f. che é possibile rimuovere continuando ad avere un insieme di d.f. equivalente

    -   possibile calcolarlo con la chiusura degli attributi

<!--list-separator-->

-  Dipendenze ridondanti

    Possibile rimuoverla continuando ad avere un insieme di d.f. equivalente

    -   verificabile usando la chiusura di un insieme di attributi


## Sistemi per la gestione dei dati {#sistemi-per-la-gestione-dei-dati}


### Metodi di accesso e indici {#metodi-di-accesso-e-indici}


### Ottimizzatore logico e fisico {#ottimizzatore-logico-e-fisico}


### Cenni {#cenni}


#### Gestione della concorrenza {#gestione-della-concorrenza}


#### Gestione del ripristino {#gestione-del-ripristino}


## Definizioni {#definizioni}


### Base di Dati {#base-di-dati}

-   accezione generica - `metodologica`
    -   insieme organizzato di dati utilizzati per il supporto allo svolgimento delle attivita' di un ente
-   accezione specifica - `metodologica e tecnologica`
    -   insieme di dati gestito da un `DBMS`


### DBMS {#dbms}

`Data Base Management System`
Componente Software specificamente dedicata alla gestione delle basi di dati

-   Oracle DB
-   PostreSQL
-   MySQL
-   Microsoft SQL Server
-   Microsoft Access
-   SQLite
    -   contenuto in una libreria C (embedded)

Sistema che gestisce collezioni di dati

-   grandi
    -   non stanno in RAM
    -   il limite deve essere solo quello fisico
-   persistenti
    -   tempo di vita non limitato alla singola esecuzione
-   condivise
    -   tra sistemi informativi
    -   il DBMS fa da <span class="underline">mediatore</span> tra database e applicativi
    -   vantaggi
        -   no ridondanza
        -   no incoerenza
    -   svantaggi
        -   gestione della concorrenza
            -   accessi contemporanei (gestiti dai DBMS)
-   privatezza
    -   meccanismi autorizzazione
-   affidabilitá
    -   resistenti a malfunzionamenti hardware e software
    -   tecniche
        -   gestione delle transazioni
-   efficienza
    -   i tempi devono essere accettabili
-   efficacia


#### Architettura {#architettura}

utente - Schema Logico - Schema Interno - Base Dati

-   Schema Logico
    -   secondo un modello logico
-   Schema Interno
    -   specifico del DBMS utilizzato

Indipendenza tra livello Logico e Fisico

<!--list-separator-->

-  ANSI-SPARC

    Architettura a tre livelli
    utente - schema esterno - schema logico - schema interno - BD

    -   Schema Esterno
        -   a partire dallo schema logico forma nuove `Viste`


### Indipendenza {#indipendenza}


#### Fisica {#fisica}

Livello logico e esterno sono indipendenti da quello fisico

-   una relazione éutilizzata allo stesso modo qualunque sia la realizzazione fisica
-   la realizzazione fisica puó cambiare senza problemi


#### Logica {#logica}

Lo schema esterno é indipendente da quello logico


### Transazione {#transazione}

Sequenza di operazioni considerate in modo atomico anche in presenza di concorrenza
La conclusione definitiva di una transazione corrisponde ad un impegno aka `commit`


### Modello dei dati {#modello-dei-dati}

Insieme dei costrutti utilizzati per organizzare i dati di interesse e descriverne la dinamica

-   meccanismi di strutturazione
    -   costruttori di tipo

**Modelli Concettuali**

-   non disponibili nei DBMS
-   modello utilizzato per la progettazione
-   rappresentazione astratta
-   `Entity Relationship`

**Modelli Logici**

-   utilizzati da DBMS
    -   `Relazionale`
    -   Gerarchico
    -   a oggetti
    -   NoSQL


### Linguaggi {#linguaggi}


#### DML {#dml}

Manipolazione, interrogazione e aggiornamento di istanze di basi di dati


#### DDL {#ddl}

Definizione di schemi (logici, esterni, fisici) e operazioni generali


### Sistema Informativo {#sistema-informativo}

NON necessariamente un Sistema Informatico (questo ne é una parte)
Componente che gestisce le informazioni di una Base Dati

-   Raccolta
-   Archiviazione
-   Elaborazione
-   Distribuzione


### Dato - Informazione {#dato-informazione}

-   dati: vanno elaborati
    -   vanno interpretati
-   informazioni
    -   utilizzati nella interpretazioni di dati
