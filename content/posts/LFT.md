+++
title = "Linguaggi Formali e Traduttori"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

-   Teacher:  Sproston Jeremy

Informazioni varie del Corso:

-   Lunedi' lezione sincrona per domande: 11:00

-   Prova scritta + orale facoltativo (necessario per la lode)
    2/3 del voto

-   Prova di laboratorio (progetto, interrogazione singola
    anche in caso di progetto di gruppo con gruppi da 3)

    -   Sostenibile dopo aver superato Teoria

    1/3 del voto

    -   [LFTCompiler]({{< relref "20210107003338-lftcompiler.md" >}})


## Testi {#testi}


### Compilatori {#compilatori}

Principi tecniche e strumenti


### Automi {#automi}

Automi, Linguaggi e Calcolabilita'


## Fasi Compilatore {#fasi-compilatore}

-   NB
    -   \\[DFA = NFA = \epsilon\text{-}NFA = RE\\]
    -   \\[DFA \subset DPDA \subset CFG \text{ non ambigue} \subset CFG = PDA\\]


### Analisi Lessicale {#analisi-lessicale}

sequenze di caratteri | `token` o `lessemi`

Si passa da

1.  Programma come sequenza di caratteri
2.  Programma come sequenza di token


#### Token {#token}

Costante numerica intera
sequenza non vuota di cifre decimali, preceduta da + o -
Costante numerica con virgola
due sequenza (almeno 1 non vuota) di cifre decimali separate da .
Identificatore
sequenza on vuota di lettere numeri e _ e non inizia con un numero


#### Lexer {#lexer}

`Analizzatore lessicale`
----&gt; [Codice](/home/dan/Code/Java/LFT/Lexer.java) &lt;----
La visione del programma passa da "carattere per carattere" a "token per token"

-   spazi e commenti vengono scartati dal lexer
    -   _\* \*_
    -   //
        -   finiscono con <span class="underline">a capo</span> o <span class="underline">EOF</span>

-   Token
    ![](/home/dan/Pictures/shots/1605620610.png)
    -   Identificatori
        -   non comincia con un numero
        -   non é composto solamente dal simbolo _
        -   Ovvero corrisponde all'espressione regolare
            -   ([a-zA-Z] | (_(_)\*[a-zA-Z0-9])) ([a-zA-Z0-9] | \_)\*


### Analisi Sintattica {#analisi-sintattica}

Vedi: [Parser Top-Down](#parser-top-down) e [Codice Parser a Discesa Ricorsiva](/mnt/archive/DanyB/Code/Java/LFT/Parser.java)

-   Prende input dall'analizzatore lessicale
-   Crea un Albero Sintatico
    -   che sará utilizzato poi dal Analizzatore Semantico
        -   vedi [Analisi Semantica <span class="underline">Non affrontata nel corso</span>](#analisi-semantica)
-   In caso l'input non corrisponda ad un albero lessicale
    -   deve restituire un errore

-   Espressioni Booleane
    -   RELOP \\(\in\\) \\(\\{==, <>, <=, >=, <, >\\}\\)

-   Separatore
    -   punto e virgola
        -   <span class="underline">non</span> un terminatore di istruzione

-   Produzioni
    ![](/home/dan/Pictures/shots/1605619407.png)
    -   In caso di rami annullabili attenzione ai FOLLOW

<!--listend-->

-   Sintassi scheme-like
    -   espressioni aritmetiche
        -   notazione prefissa
        -   puó comprendere ID
        -   operatori
            -   \* + : varianti n-arie: n&gt;=1
            -   - / : binarie
        -   compaiono nelle espressioni booleane
            -   impatto sull'insieme GUIDA

    -   assegnamento
        -   notazione prefissa

    -   espressioni relazionali
        -   notazione prefissa


### Analisi Semantica {#analisi-semantica}

-   Si occupa della valutazione delle espressioni


#### SDD {#sdd}

`Syntax Directed Definition`
Definizioni dirette dalla sintassi strumento che permette la `traduzione`

-   consistono in
    -   grammatica libera
        -   specifica la sintassi
            -   gli operatori qui sono sintattici
    -   attributi
        -   risultati della traduzione
            -   sono riferiti dall'analizzatore lessicale
        -   (nome, valore)
        -   rappresentano una qualunque informazione associata ad un nodo
    -   regole semantiche
        -   come calcolare gli attributi
        -   specificano regole di calcolo e assegnamento tra attributi per ogni produzione
            -   gli operatori qui sono semantici/matematici
        -   sono valutate in ordine arbitrario
            -   richiedono la costruzione di un albero sintattico annotato

Con cui si definisce un `albero sintattico annotato`

-   i cui nodi possono essere annotati con 0 o piú attributi

<!--list-separator-->

-  Attributi

    -   Sintetizzati
        Il suo valore dipende da quello di attributi dei figli ed eventualmente
        da altri attributi di se stesso
    -   Ereditati
        Il suo valore dipende da quello dal padre e dai fratelli del nodo

<!--list-separator-->

-  Grafo delle dipendenze

    Alcuni attributi dipendono da altri, questo impone un'ordine tra questi

    -   se il grado contiene dei cicli non é possibile trovare un'ordine di
        valutazione degli attributi

<!--list-separator-->

-  S-attribuite

    Contiene solo attributi sintetizzati

    -   ogni S-attribuita é a sua volta L-attribuita

<!--list-separator-->

-  L-attribuite

    Per ogni produzione \\(A\to X\_1 X\_2 ... X\_n\\)
    e ogni attributo ereditato \\(X\_i.e\\) la regola semantica che definisce il valore di \\(X\_i.e\\)
    dipende solo da

    -   attributi ereditati da \\(A\\)
    -   attributi sintetizzati ed ereditati dai simboli \\(X\_1, X\_2, ... , X\_{i-1}\\) alla sinistra di \\(X\\)


#### SDT {#sdt}

`Syntax-Directed Translation scheme`
Schema di traduzione, variante SDD che rende esplicito l'ordine di valutazione degli attributi

-   grammatica in cui le produzioni sono arricchite da frammenti di codice
    -   azioni semantiche
        -   eseguite nel momento che i simboli alla loro sinistra sono stati riconosciuti
        -   simili alle regole semantiche degli SDD
            -   specificano il calcolo degli attributi ma anche codice arbitrario
            -   l'ordine di esecuzione é esplicito a differenza delle regole semantiche
            -   essendo eseguite da sinistra verso destra non richiedono la costruzione
                dell'albero sintattico annotato

<!--list-separator-->

-  da SDD L-attribute a SDT

    data \\(A\to X\_1 X\_2 ... X\_n\\)

    1.  subito prima di \\(X\_i\\)
        -   azione semantica che calcola il valore degli attributi ereditati
            -   che possono solo dipendere da attributi ereditati di \\(A\\) e attributi dei nodi
                fratelli alla sua sinistra
    2.  in fondo alla produzione
        1.  azione semantica che calcola il valore degli attributi sintetizzati di \\(A\\)


#### Traduzione on the fly {#traduzione-on-the-fly}

Attributi sintetizzati `principali`

-   il loro valore include sempre la concatenazione dei valori dello stesso attributo
    per tutte le variabili nel corpo di ogni produzione oltre che eventuali variabili ausiliarie
-   la concatenzazione rispetta l'ordine delle variabili nel corpo delle produzioni
    Es, trasformazione da forma infissa a postfissa

\\(E \to E\_1 + T \\{ E.post = E\_1.post || T.post || "..." \\}\\)
Questo viene tradotto on the fly in <span class="underline">{ print("...") }</span>


## Automi {#automi}


### Esempio {#esempio}

automa: riconosce stringhe
stati finiti: memoria finita
input: stringa
output: "si" se riconosciuta "no" altrimenti

L'automa ha visione `locale e limitata` , legge un simbolo alla volta

L'automa altera il suo stato in base al simbolo letto

Se alla fine della stringa l'automa si trova in uno `stato finale` la stringa é accettata, altrimenti rifiutata


### Automi a stati finiti deterministici `DFA` {#automi-a-stati-finiti-deterministici-dfa}

Deterministico: lo stato in cui si sposta é univocamente determinato dallo stato corrente e dal input

Quintupla composta da:

1.  \\(Q\\) - insieme finito di stati
2.  \\(\Sigma\\) - alfabeto riconosciuto
3.  \\(\delta\\) - funzione di transizione
4.  \\(q\_{0}\\) - e' lo stato iniziale
5.  \\(F\\) - insieme di stati finali


#### Funzione di transizione estesa {#funzione-di-transizione-estesa}

funzione definita su stringhe invece che singoli simboli
definito per induzione


#### Linguaggio riconosciuto {#linguaggio-riconosciuto}

Stringhe definite sull'alfabeto che per mezzo della F di transizione estesa portano ad uno `stato finale` dell'automa


### Automi a stati finiti non deterministici `NFA` {#automi-a-stati-finiti-non-deterministici-nfa}

Non deterministico: l'automa puo' scegliere di spostarsi in 0 o piu' stati possibili

-   Il codominio della funzione di transizione e' l'insieme delle parti degli stati \\(Q\\)

Quintupla composta da:

1.  \\(Q\\) - insieme finito di stati
2.  \\(\Sigma\\) - alfabeto riconosciuto
3.  \\(\delta\\) - funzione di transizione il cui codominio e' un'insieme delle parti di Q
4.  \\(q\_0\\) - e' lo stato iniziale
5.  \\(F\\) - insieme di stati finali

    Insiemi singoletto indicano transizioni deterministiche (da funzione di transizione estesa)
    Automi che possono eseguire transizioni spontanee senza leggere alcun simbolo nella stringa da riconoscere

    -   passa di stato anche senza consumare alcun simbolo


#### epsilon-chiusura {#epsilon-chiusura}

calcolare l'insieme di stati raggiungibili solo con transizioni-epsilon
`ECLOSE`

-   la chiusura e' transitiva
-   la chiusura di q include q
    ECLOSE(S) = Unione di ECLOSE(q_i)

    Gli NFA sono un caso particolare di epsilon-NFA in cui non ci sono transizioni epsilon

    -   il potere riconoscitivo degli epsilon-NFA e' <span class="underline">almeno</span> pari a quello dei DFA/NFA

<!--list-separator-->

-  Teorema

    Dato un eNFA E esiste un DFA D tale che L(D) = L(E)


### Passaggio da `DFA` a `NFA` e viceversa {#passaggio-da-dfa-a-nfa-e-viceversa}

Da NFA a DFA sono possibili `fino` a \\(2^n\\) stati

Da un DFA con piu' stati finali e' possibile ricavare un e-NFA equivalente con un unico stato finale


### Espressioni regolari `RE` {#espressioni-regolari-re}

Sono un approccio generativo alle classi di Linguaggi
E' sempre possibile creare un e-NFA a partire da una RE

Denotano un Linguaggio con
\\(L(E)\\)
Definito per induzione

\\(L(0) = 0\\)
\\(L(\epsilon) = \\{\epsilon\\}\\) _/ la stringa vuota
\\(L(a) = {a}\\)
\\(L(E+F) = L(E) \cup L(F)\\)
\\(L(EF) = L(E)L(F)\\)
\\(L(E\*) = L(E)^\*\\)   /_ chiusura di Kleene


#### precedenza {#precedenza}

1.  \*
2.  concatenazione
3.  +


#### Proprietá {#proprietá}

<!--list-separator-->

-  Unione

    -   Commutativa
    -   Associativa
    -   Idempotenza
    -   Identitá

<!--list-separator-->

-  Concatenazione

    -   Associativa
    -   Identitá
    -   Assorbimento
    -   distributivitá

<!--list-separator-->

-  Chiusura di Kleene

    -   Idempotenza


### Indistinguibilitá tra stati {#indistinguibilitá-tra-stati}

`Equivalenza`
    (relazione riflessiva, simmetrica e transitiva)
Due stati hanno lo stesso potere discriminante se presa una qualunque stringa del linguaggio si arriva ad uno stato finale in entrambi i casi o no in entrambi i casi, la indichiamo con ~

-   Puó esserci una stringa che `distingue` i due stati
-   Uno stato finale é distinto da altri stati non finali dalla stringa vuota


#### Minimizzazione di Automi {#minimizzazione-di-automi}

si raggiunge un automa minimo:
\\((Q/\tilde,\Sigma,\delta,[q\_0],F/\tilde)\\)
in cui
\\(\delta([p],a)=[\delta(p,a)]\\)
Non esiste un automa corrispondente con meno stati dell'automa minimo


#### Equivalenza di Automi {#equivalenza-di-automi}

Puó essere usato l'algoritmo riempi tabella per decidere se due automi sono equivalenti
Si crea l'unione dei due DFA:
\\(A = (Q\_1 \cup Q\_2, \Sigma, \delta, q\_1, F\_1 \cup F\_2)\\)
\\(\delta(q,a) = \delta\_1 \cup \delta\_2\\)
Se \\(q\_1\\) e \\(q\_2\\) risultano indistinguibili in \\(A\\) allora \\(A\_1\\) e \\(A\_2\\) sono <span class="underline">equivalenti</span>


### Automi a Pila `PDA` {#automi-a-pila-pda}

`Approccio Riconoscitivo`
    Utilizza operazioni push e pop su una pila di dimensione illimitata

-   Simbolo sentinella \\(Z\_{0}\\) che indica la fine della stringa, é il simbolo della pila con cui quest'ultima viene inizializzata
-   Ad ogni lettura di un simbolo l'automa fa push(x) o push(b) dipendentemente dal Linguaggio
-   La \\(\epsilon\\) transizione finale puó eseguire solo se peek restituisce \\(Z\_{0}\\)

\\(P=(Q,\Sigma,\Gamma,\delta,q\_{0},Z\_{0},F)\\)

-   \\(\Sigma\\) = alfabeto di input
-   \\(\Gamma\\) = alfabeto della pila
-   \\(\delta:Q\times(\Sigma\cup\\{\epsilon\\})\times\Gamma \to p(Q\times\Gamma^{\*})\\) = funzione di transizione


#### Descrizioni istantanee {#descrizioni-istantanee}

Fissato un automa a pila \\(P\\)
\\(D.I.=(q,w,\alpha)\\)

-   stato in cui si trova l'automa
-   ció che rimane da riconoscere nella stringa di input
-   contenuto della pila dalla cima al fondo (sx a dx)

<!--list-separator-->

-  Mosse

    relazioni da \\(D.I.\\) a \\(D.I.\\)
    \\(I\vdash\_{P}J\\)
    chiusura riflessiva e transitiva
    \\(I\vdash^{\*}\_{P}J\\)


#### Linguaggio Accettato {#linguaggio-accettato}

Per stato finale:
    \\(L(P) = \\{w\in\Sigma^{\*}\mid(q\_{0},w,Z\_{0})\vdash\_{P}^{\*}(q,\epsilon,\alpha), q\in F\\}\\)
Per pila vuota:
    \\(N(P)=\\{w\in\Sigma^{\*}\mid(q\_{0},w,Z\_{0})\vdash^{\*}\_{P}(q,\epsilon,\epsilon)\\}\\)

-   Per stato finale il contenuto della pila nella \\(D.I.\\) finale é irrilevante
-   Per pila vuoto lo stato nela \\(D.I.\\) finale puó non essere finale

In ogni caso la stringa di input deve essere consumata completamente


#### Automi a Pila Deterministici {#automi-a-pila-deterministici}

`DPDA`
Strettamente meno espressivi dei `PDA`

-   riconoscono comunque <span class="underline">ogni</span> Linguaggio Regolare
-   riconoscono i linguaggi liberi <span class="underline">non inerementemente ambigui</span>

Dimostrabile:

1.  Per ogni CFG \\(G\\) esiste un PDA \\(P\\) tale che \\(N(P) = L(G)\\)
2.  Per ogni PDA \\(P\\) esiste una CFG \\(G\\) tale che \\(L(G) = N(P)\\)

I DPDA a paritá di stato simbolo letto e simbolo sulla pila possono fare al massimo una mossa.

-   \\(\delta(q,a,X) \cup \delta(q,\epsilon,X)\\) deve contenere al massimo un elemento

Mentre il linguaggio \\(ww^R\\) non é riconoscibile in quanto fa uso chiave del non determinismo mentre \\(wcw^R\\) é riconoscibile grazie al simbolo sentinella \\(c\\)

-   Dim - Ogni linguagio regolare é riconosciuto da un DPDA

    -   \\(A = (Q,\Sigma,\delta\_A,q\_0,F)\\)
    -   \\(P = (Q,\Sigma,\\{Z\_0\\}, \delta\_P,q\_0,Z\_0,F)\\)

    dove

    -   \\(\delta\_P(q,a,Z\_0) = \\{(\delta\_A(q,a,Z\_0))\\}\\) per ogni \\(q \in Q, a \in \Sigma\\)
    -   \\(\delta\_P(q,\epsilon,Z\_0) = \emptyset\\)

Dimostrabile

1.  Per ogni DPDA \\(P\\) esiste una grammatica libera <span class="underline">non ambigua</span> \\(G\\) tale che \\(L(G)=N(P)\\)
2.  Il viceversa non vale

_La famiglia dei linguaggi riconoscibili da DPDA é inclusa in - ma non concide con - quella dei linguaggi generabili da grammatiche libere non ambigue_


### Parser Top-Down {#parser-top-down}

Vedi:[File dedicato]({{< relref "20201110134001-parser_top_down.md" >}})


## Grammatiche Libere {#grammatiche-libere}

`Teorema`

Per ogni linguaggio regolare \\(L\\) esiste una grammatica \\(G\\) tale che \\(L(G) = L\\)

-   dove \\(L(G)\\) é il linguaggio generato da \\(G\\)

<!--listend-->

-   le grammatiche possono generare tutti i linguaggi regolari
-   possono anche generare linguaggi non regolari
    -   stringhe palindrome
    -   parentesi bilanciate

_I linguaggi liberi includono propriamente i linguaggi regolari_


### LL(1) {#ll--1}


### Non LL(1) {#non-ll--1}


#### Fattorizzazione {#fattorizzazione}

\\(A \to \alpha \beta\_1 | \alpha \beta\_2 \\)
quindi
GUIDA\\((A \to \alpha\beta\_1) \cap\\) GUIDA\\((A \to \alpha\beta\_2) =/= \emptyset\\)

<span class="underline">Soluzione</span>
Fattorizzare il previsso comune in una variabile a parte \\(A'\\)


#### Ricorsione immediata a sinistra {#ricorsione-immediata-a-sinistra}

\\(A \to A\alpha | \beta\\)

<span class="underline">Soluzione</span>
Nuova variabile \\(A'\\) per spostare la ricorsione da sinistra a destra
\\(A \to \beta A'\\)   \\(A' \to \epsilon | \alpha A'\\)

In generale l'eliminazione della ricorsione a sinistra non garantisce che la grammatica risultante sia LL(1)


#### Ricorsione indiretta a sinistra {#ricorsione-indiretta-a-sinistra}

\\(S \to Aa | b\\)
\\(A \to Ac | Sd | \epsilon\\)

<span class="underline">Soluzione</span>

1.  si impone un ordine arbitrario alle variabili
2.  considerando ogni variabile nell'ordine imposto si elimina la ricorsione immediata per quella variabile e si riscrivono le occorrenze di quella variabile che compaiono nei corpi delle produzione delle variabili seguenti


## Linguaggi {#linguaggi}


### Linguaggio regolare {#linguaggio-regolare}

Esiste almeno un Automa A che lo riconosce


#### Linguaggi Regolari {#linguaggi-regolari}

`def` Un Linguaggio riconoscibile da un `DFA`

<!--list-separator-->

-  I linguaggi regolari sono chiusi rispetto all'operazione di unione

    'Collego' i due automi deterministici attraverso uno stato q0 che con epsilon-transizioni passa da uno o dall'altro

<!--list-separator-->

-  I linguaggi regolari sono chiusi rispetto all'operazione di concatenazione

    'Collego' lo stato finale (che non sara' piu' finale) del e-NFA corrispondente al primo automa con quello iniziale di quello e-NFA del successivo, con una epsilon-transizione

<!--list-separator-->

-  Chiusura `dim`

    p- \\(L\cup L^{'}\\)

    -   Dati \\(E\_{1}\\) e \\(E\_{2}\\)
        -   Si dimostra che \\(E\_{1}+E{\_2}\\) genera \\(L\cupL^{'}\\)
        -   Essendo quella ancora un'espressione regolare anche il linguaggio generato sará regolare
    -   \\(LL^{'}\\)
    -   Simile all'unione
    -   \\(not{L}\\)
    -   \\(not{L}= \Sigma^{\*}-L\\)
    -   si crea un automa \\(B = (Q,\Sigma,\delta,q\_{0},Q-F)\\)
        -   abbiamo complementato l'insieme degli stati finali
    -   i\\(L\cap L^{'}\\)
    -   Si utilizzano le leggi di De Morgan
        -   ci si riconduce al caso dell'unione e della complementazione
    -   O si construisce un automa \\(B\\) che riconosce una simulazione dei due automi iniziali \\(A\_1\\) e \\(A\_2\\)
    -   \\(L -L^{'}\\)
    -   \\(L\_1 - L\_2 = L\_1 \cap notL\_2\\)
    -   \\(L^{R}\\)
        -   L rovesciato
    -   Si ricava un \\(E^R\\) per induzione

        \\(\emptyset^R=\emptyset\\)
        \\(\epsilon^R=\epsilon\\)
        \\(a^R=a\\)
        \\((E\_1+E\_2)^R={E\_1}^R+{E\_2}^R\\)
        \\((E\_1 E\_2)^R = {E\_2}^R {E\_1}^R\\)
        \\((E^\*)^R = (E^R)^\*\\)
        Facile poi dimostrare che \\(L(E^R) = L(E)^R\\)
        Tutti questi sono ancora regolari


### Linguaggi non Regolari {#linguaggi-non-regolari}


#### Pumping Lemma {#pumping-lemma}

Per ogni linguaggio regolare \\(L\\) esiste \\(n\\) appartenente a \\(N\\) tale che per ogni \\(w\\) appartenente a \\(L\\) con \\(|w|>= n\\) esistono \\(x,y,z\\) tc \\(w=xyz\\) :

1.  \\(y \ne\epsilon\\)
2.  \\(|xy|\le n\\)
3.  \\(xy^kz\\) appartiene \\(L\\) per ogni \\(k\ge 0\\)
    Abbiamo una stringa media \\(y\\) non vuota che puó essere replicata un numero arbitrario di volte sempre ottenendo un Liguaggio Regolare.
    -   Esempio
        -   \\(L=\\{a^kb^k \mid k >= 0\\}\\) non é regolare

<!--list-separator-->

-  dim

    -   \\(L\\) regolare
    -   \\(A = (Q,\Sigma,\delta,q\_0,F)\\) tc \\(L=L(A)\\)
    -   \\(n=|Q|\\)
    -   \\(|w|>=n\\) tc \\(w=a\_1a\_2...a\_m\\) con \\(m>=n\\)
    -   Dopo \\(m\\) passaggi lo stato \\(q\_m\\) deve essere `finale` per definizione
    -   Il numero di stati attraversati sará \\(m+1\\)
    -   \\(m>=n\\) implica \\(m+1>n\\) quindi gli stati attraversati non possono essere tutti distinti
    -   \\(q\_i =q\_j\\) ( \\(i<j\\) ) é il primo `stato che si ripete` nel cammino dell'automa

    Allora concludiamo identificando \\(x,y,z\\)

    -   \\(x=a\_1a\_2...a\_i\\)
    -   \\(y=a\_{i+1}a\_{i+2}...a\_j\\)
    -   \\(z=a\_{j+1}a\_{j+2}...a\_m\\)
    -   \\(y!=\epsilon\\) in quanto \\(i<j\\)
    -   \\(|xy|<=n\\) in quanto \\(q\_i=q\_j\\) é il primo stato che si ripete e sono al massimo \\(n+1\\)
    -   \\(xy^kz\\) appartiene a \\(L\\) per ogni \\(k>=0\\)


### Linguaggi Liberi dal Contesto {#linguaggi-liberi-dal-contesto}

Le grammatiche libere sono un approccio generativo alle stringhe
\\(L = {a^nb^n \mid n \in \N}\\) non e' regolare:

-   e' il inguaggio delle parentesi bilanciate

\\(G=(V,T,P,S)\\) e' una `grammatica libera`

-   \\(V\\) variabili o simboli non terminali
-   \\(T\\) terminali
-   \\(P\\) produzioni \\(A\to \alpha\\)
    -   testa
    -   corpo
        -   La riscrittura della \\(A\\) in \\(\alpha\\) (sequenza arbitraria di simboli terminali o non) é libera dal contesto
-   \\(S\\) simbolo iniziale

`Derivazioni`:

-   derivazione in un solo passo
-   derivazione in zero o piu' passi

Il potere riconoscitivo delle grammatiche libere e' almeno tanto quanto quello dei linguaggi regolari

`Derivazioni canoniche`

-   leftmost
    -   \\(\Rightarrow\_{lm}\\)

-   rightmost

    -   \\(\Rightarrow\_{rm}\\)

    Se esistono due derivazioni canoniche distinte (entrambe `lm` o `rm`) per la stessa stringa allora \\(G\\) e' `ambigua`


#### Alberi Sintattici {#alberi-sintattici}

Derivazioni differenti possono generare lo stesso programma

-   anche imponendo regole all'ordine delle riscritture

Gli alberi sintattici (alternativa alle generazioni) astraggono dall'ordine delle riscritture e
permettono di ragionare sulla `struttura` delle stringhe

-   grammatiche ambigue
    -   piú alberi con lo stesso prodotto
    -   non é avere derivazioni distinte che mi porta ad alberi diversi e quindi ambiguitá

Data una grammatica \\(G = (V,T,P,S)\\) gli alberi sintattici di \\(G\\):

-   ogni nodo etichettato con una var in \\(V\\)
-   ogni foglia etichettata da \\(V\\) o \\(T\\) o \\(\epsilon\\)
-   \\(\epsilon\\) significa unico figlio del genitore
-   se un nodo \\(A\\) i suoi figli sono etichettati (sx a dx)
    -   \\(X\_{1},X\_{2},...,X\_{n}\\)
    -   \\(A\to X\_{1},X\_{2},...,X\_{n}\\) e' una produzione in \\(P\\)

Il `prodotto` é la stringa ottenuta concatenando(sx verso dx) le etichette di tutte le foglie

<!--list-separator-->

-  Teorema

    \\(A\to\_{G}^{\*} \alpha\\) se e solo se esiste un albero sintattico di \\(G\\) con radice \\(A\\) e prodotto \\(\alpha\\)

<!--list-separator-->

-  Risoluzione delle ambiguitá (grammatiche in forma infissa)

    -   `Precedenza` degli operatori
    -   `Associativitá` degli operatori
        -   per operatori associativi questo non é un problema
        -   lo é per altri operatori

    `Soluzione ad hoc`
    Utilizziamo associativitá a sinistra, sbilanciamo le espressioni e le stratifichiamo

    -   Espressione = somma di termini
    -   Termine = prodotto di fattori
    -   Fattore = costante o espressione tra parentesi

    Nuova grammatica:
        \\((\\{E,T,F\\},\\{0,1,...,9,+,\*,(,)\\},P,E)\\)
        Produzioni:

    -   \\(E\to T \mid E+T\\)
    -   \\(T\to F \mid T \times F\\)
    -   \\(F\to0\mid1\mid...\mid9\mid(E)\\)

<!--list-separator-->

-  Linguaggi inerentemente ambigui

    \\[L = \\{a^n b^n c^m d^m \mid n \ge 1, m \ge 1\\} \cup \\{a^n b^m c^m d^n \mid n\ge 1, m \ge 1\\}\\]
    Qualunque Grammatica che genera \\(L\\) ha sempre almeno due derivazioni canoniche distinte che generano una stringa della forma \\[ a^n b^n c^n d^n \\]


#### Pumping Lemma {#pumping-lemma}


#### Chiusura {#chiusura}

<!--list-separator-->

-  Unione &amp; Concatenazione

    <span class="underline">SI</span>
    dati \\(L\_1 = L(G\_1)\\) e \\(L\_2 = L(G\_2)\\)
    dove \\(V\_1 \cap V\_2 = \emptyset\\)
    costruiamo la grammatica
    \\((V\_1 \cup V\_2, T\_1\cup T\_2, P\_1 \cup P\_2 \cup \\{S\to S\_1 \mid S\_2\\},S)\\)
    che genera \\(L\_1 \cup L\_2\\)
    e la grammatica
    \\((V\_1 \cup V\_2, T\_1\cap T\_2, P\_1 \cap P\_2 \cap \\{S\to S\_1 S\_2\\},S)\\)
    che genera \\(L\_1 L\_2\\)

<!--list-separator-->

-  Intersezione

    <span class="underline">NO tra 2 Linguaggi Liberi</span>
    \\(L\_1 = \\{a^n b^n c^m \mid \ge 0\\}\\)
    \\(L\_1 = \\{a^m b^n c^n \mid \ge 0\\}\\)
    Sono liberi ma
    \\(L\_1 \cap L\_2 = \\{a^n b^n c^n \mid n \ge 0\\}\\)
    Non é libero, dimostrabile con il pumping lemma
    <span class="underline">SI tra linguaggio Libero e linguaggio Regolare</span>
    NB: L'intersezione non é piú un linguaggio regolare
    es.
    \\(L = \\{a^n b^n \mid n \ge 0\\}\\) e \\(R = L(a^\* b^\*)\\)
    \\(L\cap R = L\\) il quale non é regolare

<!--list-separator-->

-  Complemento &amp; Differenza

    <span class="underline">NO</span>
    Se fossero chiusi per complemento allora
    \\(L\_1 \cap L\_2 = \overline{\overline{L\_1 \cap L\_2}} = \overline{\overline{L\_1} \cup \overline{L\_2}}\\)
    Contrario a ció dimostrato
    Il complemento é esprimibile per differenze e quindi nemmeno la differenza é chiusa

<!--list-separator-->

-  Inversione

    <span class="underline">SI</span>
    \\(G^R = (V,T,P^RS)\\) dove \\(P^R= \\{A \to \alpha^R\mid A \to \alpha \in P\\}\\)
    Si dimostra che \\(L(G^R) = L(G)^R\\)


## JVM {#jvm}

Vedi: [IJVM]({{< relref "20200531062306-ijvm.md" >}}), [Bytecode Instruction Listing](https://en.wikipedia.org/wiki/Java_bytecode_instruction_listings)
Progetto: [Translator.java](~/Code/Java/LFTCompiler/Translator.java)

-   Interprete `bytecode`
-   macchina virtuale basata su `pila`
-   basso e alto livello (gestione della pila / oggetti)
-   `Garbage Collector`

Pipeline del corso:
  .lft \\(\to\\) .j \\(\to\\) .class \\(\to\\) output


### Pila {#pila}

Composta da Frames

-   uno per ogni metodo in esecuzione
    -   `NB`
        I metodi non statici hanno come primo argomento il riferimento all'oggetto ricevente
-   argomenti e variabili riferite con il loro indirizzo nella pila
-   `Instruction Set`
    _Gestione della Pila_

    -   istore
    -   iload
    -   swap

    _Aritmetica_

    -   ineg
    -   iadd
    -   isub
    -   imul

    _Gestione Array_

    -   newarray
    -   arraylength
    -   iaload
    -   iastore

    _Controllo del Flusso_

    -   goto
    -   if_icmpeq
    -   if_icmpne
    -   if_icmple
    -   if_icmpge
    -   if_icmplt
    -   if_cmpgt
    -   invokestatic
    -   return
    -   ireturn


### Espressioni {#espressioni}


#### Aritmetiche {#aritmetiche}


#### Logiche {#logiche}

Implementazione di `Valutazione Corto-Circuitata`


### Problemi {#problemi}

la compilazione di un metodo comporta il calcolo della `dimensione del suo frame`

-   variabili locali
-   pila degli operandi

inoltre deve assicurarsi che se il `tipo di ritorno` é diverso da void ci sia un valore restituito
Questo senza eseguire il codice, utilizzando l'_analisi statica del codice\_
Nello sviluppo ci occupiamo di

-   metodi statici
-   con tipo di ritorno int o void


#### Verifica del Return {#verifica-del-return}

Analisi di ogni cammino per verificare che alla fine di ogni metodo ci sia una istruzione return

-   l'analisi é statica in quanto non tiene conto dell'effettivo flusso di esecuzione del metodo
    -   non garantisce che il return sia eseguito
        -   in caso di ciclo infinito
        -   in caso di eccezione

Vengono fatte delle `approssimazioni`:

-   non sono valutate `espressioni booleane` anche se banali: il problema é `indecidibile`
-   non viene controllato se il tipo di ritorno é giusto o meno
    -   necessita un'altra analisi dei  tipi

Questo é implementato con un attributo

-   `S.ret`
    -   true se l'espressione di S termina é perché esegue una return
    -   in caso di liste di Comandi
        -   l'attributo é determinato dall'OR tra i Comandi che compongono la lista:
            -   questa informazione puó essere utile per individuare la presenza di codice morto
                -   warning o errore


#### Allocazione delle variabili locali {#allocazione-delle-variabili-locali}

Il piú piccolo numero di slot necessari all'interno di un frame per la memorizzazione di argomenti e variabili locali

-   determinare il numero massimio di variabili che sono _contemporaneamente_ attive
    -   tener conto della localitá delle variabili

Questo é implementato con un attributo

-   `S.locals`
    -   max{ S1.locals, S2.locals }
        -   nel caso di _if else_ o _liste di comandi_


#### Calcolo dimensione massima della pila {#calcolo-dimensione-massima-della-pila}

Numero massimo di slot occupati sulla pila degli operandi durante l'esecuzione di un metodo

-   tenendo conto del codice prodotto
    -   approssimare per eccesso la dimensione massima della pila

Implementato con l'attributo _stack_ per `E`, `B`, `S`

-   `E.stack`
    -   &gt;= 1
-   `E_list.stack`
    -   &gt;= 0

_NB_
L'`associativitá a sinistra` mantiene la `pila piccola` perché le sottoespressioni vengono valutate man mano che si incontrano da sinistra verso destra