+++
title = "Linguaggi e Paradigmi di Programmazione"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

Prof: Luca Padovani


## Info Corso {#info-corso}

-   Orario
    -   Lun 16-18
    -   Gio 9-11
    -   Ven 16-18
-   Testi
    -   [Introduction to the Theory of Programming Languages]({{< relref "20210921124001-introduction_to_the_theory_of_programming_languages.md" >}})
    -   [Haskell: the Craft of Functional Programming]({{< relref "20210921124127-haskell_the_craft_of_functional_programming.md" >}})
    -   [Programming in Haskell]({{< relref "20210921130056-programming_in_haskell.md" >}})
    -   Modern Java in Action
-   Links
    -   <https://boystrange.github.io/LPP/>
-   Esame
    -   Esercizi di programmazione Haskell in tempo limitato
    -   Teoria
        -   Fondamenti del paradigma funzionale
    -   Esercizi (Java 8) e Domande - 9 CFU


## Teoria {#teoria}


### Introduzione {#introduzione}

Il paradigma funzionale mette le funzioni allo stesso livello delle variabili

-   é possibile definire funzioni che trasformano funzioni, che restituiscono funzioni, che utilizzano funzioni in input


#### Paradigmi e Storia {#paradigmi-e-storia}

-   imperativo
    -   C, Pascal
    -   programma come sequenza di comandi da eseguire
        -   l'esecuzione modifica lo stato della macchina ad ogni istruzione
-   object-oriented
    -   Smalltalk
    -   oggetti che comunicano tra loro
        -   permette di gestire piu' facilmente la complessita'
    -   programma come interazioni (metodi) tra oggetti
        -   le interazioni modificano lo stato della macchina
        -   i metodi sono riconducibili al paradigma imperativo
-   funzionale
    -   Haskell
    -   espressione valutazionale restituisce un risultato

Negli anni:

-   '50
    -   Assembly
    -   FORTRAN
        -   formula translator
        -   procedure, espressioni
    -   COBOL
        -   per gestione aziendale, introduce il record
-   '60
    -   ALGOL
        -   forma BNF
        -   indipendente dall'architettura
        -   blocchi, variabili locali, ricorsione
    -   BASIC
        -   facile da imparare ma poco strutturato
    -   Simula 67
        -   classi, oggetti, ereditarieta'
-   '70
    -   Pascal
        -   programmazione strutturata, tipi per evitare errori
        -   ideale per imparare a programmare
    -   Smalltalk
        -   programmazione ad oggetti estrema, tutto e' un oggetto
        -   l'unica operazione possibile e' l'invio di messaggi, metodi
    -   C
-   '80
    -   Ada
        -   evoluzione di Pascal con concorrenza e tipi astratti
        -   sviluppado dal ministero della difesa USA
    -   C++
    -   PostScript
        -   scripting basato sullo stack, interpretato dalle stampanti
    -   Perl
        -   linguaggio interpretato
-   '90
    -   Python
    -   Java
    -   PHP
    -   JavaScript


### Lambda-calcolo {#lambda-calcolo}

Ci si restringe sull'essenza della programmazione in linguaggio funzionale

-   si distilla un piccolo linguaggio facilmente studiabile

Differenze tra _linguaggio_ e _calcolo_

-   il calcolo é confluente
    -   il risultato non dipende dalle azioni intraprese per raggiungerlo
-   non é deterministico


#### Concetti {#concetti}

-   processo di valutazione / `riduzione`
-   funzioni con singolo argomento / `currificate` (Haskell Curry)
    -   funzioni di ordine superiore
        -   accettano come argomenti funzioni / restituiscono altre funzioni
    -   agendo per specializzazioni
-   linguaggi
    -   `eager`
    -   `lazy`
-   Sistema di `Tipi` / Algoritmo di `Inferenza`


#### Funzioni {#funzioni}

<!--list-separator-->

-  Punto di vista estensionale

    \\(f = \\{(0,1),(1,2),(2,5),\cdots\\}\\)

<!--list-separator-->

-  Punto di vista intensionale

    \\(f(x) = x^{2} + 1\\)


#### Sintassi {#sintassi}

-   Variabili
    -   \\(Var = \\{x,y,z.\cdots\\}\\)
        -   infinito
-   Sintassi
    -   \\(M,N ::= x \mid (\lambda x.M) \mid (M N)\\)
-   Terminologia
    -   \\((\lambda x.M)\\) astrazione o funzione con argomento \\(x\\) e corpo \\(M\\)
    -   \\((M N)\\) applicazione della funzione \\(M\\) all'argomento \\(N\\)
-   Esempi
    -   \\((\lambda x.x)\\) - Funzione Identitá
    -   \\(((\lambda x.(xx))(\lambda y.(yy)))\\) - loop infinito
    -   \\((\lambda f.(\lambda x.(f(f x))))\\)

<!--list-separator-->

-  Convenzioni Sintattiche

    -   parentesi esterne omesse
    -   corpo delle astrazioni si estende a destra
        -   a destra del punto
    -   l'applicazione é associativa a sinistra

<!--list-separator-->

-  Variabili Libere e Legate

    -   \\(x\\) in \\(M\\) é legata se compare in sotto-termine
    -   diciamo che un'occorrenza di \\(x\\) in \\(M\\) é libera altrimenti

    Esempi

    -   \\(\lambda x.\\: x\\)
        -   nessuna variabile libera =&gt; termine chiuso
    -   \\(x \\: y \\: z\\)
        -   tutte le variabili sono libere
    -   \\((\lambda x.\\: x \\: y) \\: x\\)
        -   \\(x\\) sia legata che libera

    <!--list-separator-->

    -  Sostituzione

        -   \\(M\\{N/y\\}\\) é ottenuta sostituendo le occorrenze libere di \\(y\\) in \\(M\\) con \\(N\\)
        -   evitare la cattura delle variabili libere di \\(N\\) per non alterarne il senso
            -   le variabili libere sono definite esternamente allo scope della astrazione, non posso modificarle


#### Relazioni di Equivalenza {#relazioni-di-equivalenza}

<!--list-separator-->

-  &alpha;-conversione

    \\(y \notin fv(M) \implies \lambda x.M \\: \iff\_{\alpha}\\: \lambda y.M\\{y/x\\}\\)
    congruenza tra &lambda;-espressioni tali che hanno lo stesso corpo, solo con nome dell'argomento diverso

<!--list-separator-->

-  &beta;-riduzione

    <span class="underline">Applicare</span> una funzione \\(\lambda x.M\\) a un argomento \\(N\\) significa valutare il corpo in cui ogni occorrenza libera dell'argomento \\(x\\) é sostituita con \\(N\\).
    \\((\lambda x.M) \\: N \rightarrow\_{\beta}M\\{N/x\\}\\)

    -   \\(M \rightarrow\_{\beta}M^{'} \implies M \\: N \rightarrow\_{\beta}M^{'}\\:N\\)

    Da `redex` (reducible expression) a `ridotto`

    -   \\((\lambda x.M) \\: N\\)
    -   \\(M\\{N/x\\}\\)

<!--list-separator-->

-  &eta;-riduzione

    \\(x \notin fv(M) \implies \lambda x.M \\: x \rightarrow\_{\eta}M\\)

    -   \\(M \rightarrow\_{\eta}M^{'} \implies M\\: N \rightarrow\_{\eta}M^{'}\\: N\\)
    -   \\(M \rightarrow\_{\eta}M^{'} \implies N\\: M \rightarrow\_{\eta}N \\: M^{'}\\)
    -   \\(M \rightarrow\_{\eta}M^{'} \implies \lambda x.M \rightarrow\_{\eta} \lambda x.M^{'}\\)

<!--list-separator-->

-  Convertibilitá

    \\(N\rightarrow M \land M\rightarrow N  \implies M \leftrightarrow N\\)

    -   \\(\Leftrightarrow\\) indica la chiusura riflessiva e transitiva di \\(\leftrightarrow\\)

<!--list-separator-->

-  Confluenza

    **Teorema**:

    -   \\(M \Rightarrow N\_{1} \land M \Rightarrow N\_{2} \implies \exists N \mid N\_{1} \Rightarrow N \land N\_{2} \Rightarrow N\\)
    -   l'ordine delle riduzioni del &beta;-redex non importa
    -   il teorema si generalizza in \\(n\\) \\(N\\)

    Questo risultato é importante in quanto non risulta per nessun altro linguaggio di programmazione

    -   in quanto la memoria puó essere modificata dall'esecuzione, l'ordine diventa fondamentale
        -   al contrario del lambda calcolo che é un _linguaggio puro_
            -   come `Haskell`, nella sua versione piú pura
    -   _Es_: l'assegnamento é una espressione mista, sia espressione sia un comando

    <!--list-separator-->

    -  Forma Normale

        Un `M` é in forma normale se non puó piú essere ridotto, ovvero:

        -   \\(\nexists N \mid M \rightarrow N \implies M \nrightarrow\\)

        Un termine in forma normale ci indica che <span class="underline">la computazione é finita</span>

    <!--list-separator-->

    -  Corollario

        La forma normale di `M`, se esiste, é unica (a meno di &alpha;-conversioni).

<!--list-separator-->

-  Strategie di Riduzione

    In alcuni casi é piú efficiente l'uno, in altri l'altro

    <!--list-separator-->

    -  Ordine Applicativo

        redex piú a sinistra e piú interno, **linguaggi zelanti**
        `(\lambda x.x)((\lambda y.y)z) -> (\lambda x.x)z -> z`
        `.      ----------     --------`

        -   applicare una funzione a un argomento significa prima valutare l'argomento poi sostituire nel corpo della funzione

    <!--list-separator-->

    -  Ordine Normale

        redex piú a sinistra e piú esterno, **linguaggi pigri**
        `(\lambda x.x)((\lambda y.y)z) -> (\lambda y.y)z -> z`
        `-----------------     --------`

        -   applicare una funzione a un argomento significa sostituire l'argomento nel corpo della funzione
            -   si posticipa la valutazione degli argomenti fino a che non é strettamente necessaria

        Ottimizzabile in caso di argomenti valutati piú volte

        -   si memorizza il risultato parziale, in modo da non doverlo ricalcolare multiple volte
            -   questo é sicuro se il linguaggio é puro
            -   molto delicato da utilizzare in contesti diversi
            -   simile alla tecnica di _memoizzazione_ nella [Programmazione Dinamica]({{< relref "20210414192358-problems_algorithms.md#programmazione-dinamica" >}})

    <!--list-separator-->

    -  Teorema Normalizzazione

        Se \\(M \Leftrightarrow N\\) é normale, allora c'é una riduzione in ordine nomale \\(M \Rightarrow N\\)

        -   se la forma normale di un'espressione esiste, la posso trovare riducendo l'espressione in ordine normale
            -   in un numero finito di passi
        -   questa proprietá non vale per l'ordine applicativo
            -   potrebbe finire in un loop nel cercare di risolvere subito gli argomenti


#### Programmare nel &lambda;-calcolo {#programmare-nel-and-lambda-calcolo}

<!--list-separator-->

-  Booleani

    `TRUE = \lambda x.\lambda y.x`
    `FALSE = \lambda x.\lambda y.y`
    `IF = \lambda z.z`
    `AND = \lambda x.\lambda y.IF x y FALSE`
    `OR = \lambda x.\lambda y.IF x TRUE y`
    `NOT = \lambda x.\lambda y.IF x FALSE TRUE`

    L'ordine applicativo non puó  essere utilizzato nel caso di questo `IF`

    -   questo perché nel caso del `False` l'elemento piú interno é quello che non andrebbe valutato, sprecando computazione per valutarlo inutilmente

<!--list-separator-->

-  Coppie

    `PAIR = \lambda x . \lambda y . \lambda z . z x y`
    `FST = \lambda p . p TRUE`
    `SND = \lambda p . p FALSE`

<!--list-separator-->

-  Naturali

    Come iteratori:
    `n = \lambda f . \lambda x . f^n x`
    `SUCC = \lambda a . \lambda f . \lambda x . a f (f x)`
    `ADD = \lambda a . \lambda b . b  SUCC a`
    `MUL = \lambda a . \lambda b . b (ADD a) 0`
    `EXP = \lambda a . \lambda b . b (MUL a ) 1`

    Il predecessore é piú complesso

    -   idea: applicare `n` volte una funzione che calcola `n` coppie, questa n-esima coppia nella prima componente avrá `n-1`

    `ISZERO = \lambda a . a (\lambda x . FALSE) TRUE`
    `FACT = \lambda a . IF (ISZERO a) 1 (MUL a (FACT (PRED a)))`

    -   non é una definizione in senso stretto, compare il nome della funzione anche a destra

    Da questa scrittura si evince che `FACT` é in forma

    -   \\(x = F(x)\\)
    -   `FACT = AUX FACT`

    Che é la definizione di <span class="underline">punto fisso</span> della funzione `F`
    Definiamo allora l'operatore di punto fisso:
    `FIX = \lambda f . (\lambda x . f (x x)) (\lambda x . f (x x))`
    allora
    `FACT = FIX AUX`

<!--list-separator-->

-  Estendere il calcolo

    Per ragioni di efficienza ogni linguaggio di programmazione basato sul &lambda;-calcolo fornisce dati nativi (numeri, booleani, caratteri, ...)

    -   questo peró permette di espressioni <span class="underline">sintatticamente corrette ma prive di significato</span>

    <!--list-separator-->

    -  Sistema di tipi

        Il problema é indecibile, vanno quindi previste delle approssimazioni conservative nello sviluppo di un **sistema di tipi**

        <!--list-separator-->

        -  **Giudizio di Tipo**

            -   \\(\vdash M :\\: t\\)
                -   `M` é ben tipato e ha tipo `t` nel _contesto_ &Gamma;

        <!--list-separator-->

        -  **Proprietá**

            -   Lemma **Subject Reduction**
                -   \\(\Gamma \vdash M : \\: t \land M \rightarrow N \implies \Gamma \vdash N : \\: t\\)
            -   Teorema **Progresso**
                -   \\(\vdash M : \\: t \land M \Rightarrow N \not\rightarrow \\: \implies N \mbox{ é un valore}\\)
                    -   quindi <span class="underline">una costante o una astrazione</span>


#### Algoritmo di Inferenza {#algoritmo-di-inferenza}

<!--list-separator-->

-  Fase di Costruzione dell'albero sintattico

    L'albero corrispondente al termine \\(M\\) é \\(T[M]\\)
    Casi:

    -   variabile
    -   costante
    -   lambda astrazione
        -   _si estende a destra_
    -   applicazione
        -   _associativa a sinistra_
    -   if then else

<!--list-separator-->

-  Fase dell'Annotazione dell'albero sintattico

    _e della generazione dei vincoli_

    Visita dal basso verso l'alto, a partire dalle foglie

    -   **variabile di tipo**
        -   \\(\text{TVar} = \\{\alpha,\beta,\gamma, \cdots\\}\\)
    -   **espressione di tipo**
        -   \\(\tau , \sigma := \begin{cases}\alpha \\\ \mbox{Bool} \\\ \tau \rightarrow \sigma \end{cases}\\)
    -   **vincolo**
        -   \\(\tau = \sigma\\)

    Annotazioni:

    -   variabile - \\(\alpha\\)
        -   nuova variabile di tipo, stessa per tutte occorrenze
    -   costante - \\(\mbox{Bool}\\)
    -   lambda - \\(\alpha \rightarrow \tau \qquad \tau\\)
        -   \\(\alpha\\) é nuova o la stessa di una occorrenza precedente della stessa variabile nel corpo
    -   applicazione - \\(\alpha \\;\mid\\; \tau \qquad \sigma\\)
        -   \\(\alpha\\) é nuova, generato il <span class="underline">vincolo</span> \\(\tau = \sigma \rightarrow \alpha\\)
    -   applicazione - \\(\tau\_{2}\\;\mid\\; \tau\_{1}\rightarrow\tau\_{2}\qquad\sigma\\)
        -   ottimizzazione, generato il <span class="underline">vincolo</span> \\(\tau\_{1} = \sigma\\)
    -   if then else - \\(\tau\_{2} \\;\mid\\; \tau\_{1} \qquad\tau\_{2} \qquad \tau\_{3}\\)
        -   generati i <span class="underline">vincoli</span>
            -   \\(\tau\_{1}=\mbox{Bool}\\)
            -   \\(\tau\_{2} = \tau\_{3}\\)

<!--list-separator-->

-  Fase di Risoluzione dei vincoli

    Si parte da un sistema ottenuto dalla fase precedente della forma:

    \\(\\{\tau\_{i} = \sigma\_{i}\\}\_{1\le i \le n}\\)

    Si determina se questo ammette una soluzione

    -   cerchiamo la soluzione piú generale

    Si procede agendo per **sostituzioni**

    -   \\(\theta(\tau)\\) sostituendo in \\(\tau\\) tutte le \\(\alpha\\) con \\(\theta(\alpha)\\)

    Dove \\(\theta\\) é detta **soluzione** (o **unificatore**) del sistema se

    \\(\forall i : 1\le i \le n \implies \theta(\tau\_{i}) = \theta(\sigma\_{i})\\)

    L'algoritmo:

    -   \\(\tau = \tau\\)
        -   eliminare il vincolo
    -   \\(\tau = \alpha \land \tau\\)  non é una variabile
        -   rimpiazzare il vincolo con \\(\alpha = \tau\\)
    -   \\(\tau \rightarrow \tau^{'} = \sigma \rightarrow \sigma^{'}\\)
        -   rimpiazzare il vincolo con \\(\tau = \sigma \land \tau^{'}=\sigma^{'}\\)
    -   \\(\tau \rightarrow \sigma = \text{Bool} \lor \text{Bool} = \tau \rightarrow \sigma\\)
        -   l'algoritmo fallisce con <span class="underline">errore di tipo</span>
    -   \\(\alpha = \tau\\)
        -   \\(\alpha \neq \tau\\) ma \\(\alpha\\) compare in \\(\tau\\)
            -   l'algoritmo fallisce con <span class="underline">occur check</span>
        -   \\(\alpha\\) non compare in \\(\tau\\), \\(\alpha\\) compare altrove
            -   sostituire \\(\alpha\\) con \\(\tau\\) in tutti gli altri vincoli (\\(\alpha = \tau\\) rimane)
    -   nessuna trasformazione applicabile
        -   l'algoritmo ha successo

<!--list-separator-->

-  Estensioni

    Costanti:

    -   False, True
    -   numeri **interi**
    -   numeri **float**

    Aggiungiamo i tipi corrispondenti.

    Le fasi 1 e 2 non hanno variazioni.
    La fase 3 fallisce se c'é un vincolo:

    -   \\(\tau \rightarrow \sigma = \text{Int}\\)
    -   \\(\text{Int} = \tau \rightarrow \sigma\\)
    -   \\(\text{Int} = \text{Bool}\\)

    Aggiungendo le **liste**:
    \\(c \in \\{\cdots, [\\:] ,(:)\\}\\)

    Tipi:

    -   \\((:) : : \alpha \rightarrow [\alpha] \rightarrow [\alpha]\\)
    -   \\([\\:] : : [\alpha]\\)

    La fase 1 non varia.
    La fase 2:

    -   ogni occorrenza di un costruttore fa uso di nuove variabili di tipo
        -   questo vale per qualsiasi funzione _polimorfa_

    La fase 3:

    -   i vincoli \\([\tau] = [\sigma]\\) si rimpiazza con \\(\tau = \sigma\\)
    -   fallisce per vincoli
        -   \\([\tau] = \text{Bool}\\)
        -   \\(\text{Bool} = [\tau]\\)
        -   \\([\tau] = \sigma\_{1} \rightarrow \sigma\_{2}\\)
        -   \\(\alpha = [\alpha]\\) - _occur check_
            -   il tipo contiene se stesso ed é contenuto da se stesso, errore

    Stesse considerazione valgono per le **coppie**:
    \\(c \in \\{\cdots,(\\:,)\\}\\)
    Tipo:

    -   \\((\\:,) : : \alpha \rightarrow \beta \rightarrow (\alpha,\beta)\\)

    Le costanti includono le **funzioni di libreria**:
    \\(c \in \\{\cdots, \text{id}, \text{head}, \text{tail}, \cdots\\}\\)

    Per la **ricorsione**:
    \\(f = M\\)

    La fase 1:

    -   \\(f\\) é trattato come una variabile

    La fase 2:

    -   \\(f\\) é trattato come una variabile
    -   alla fine dell'annotazione generare il vincolo \\(\alpha = \tau\\)
        -   \\(\alpha\\) variabile associata a \\(f\\)
        -   \\(\tau\\) annotazione associata a \\(M\\)


### Correttezza {#correttezza}

Le dimostrazioni sono semplificate dal fatto che la funzione non mostra il suo stato al programmatore, tutto si trova nella definizione della funzione.

Gli _approcci_ possibili sono:

-   test
    -   non esaustiva
        -   puó dimostrare la presenza di un problema ma non la sua assenza
    -   piú facile
-   dimostrazione
    -   esaustiva
    -   difficile, soprattutto se il linguaggio é imperativo


#### Relazioni totali {#relazioni-totali}

<div class="code">

foo :: Int -&gt; Int -&gt; Int -&gt; Int

</div>

Essendo l'ordine tra numeri **totale** é possibile considerare un numero finito di casi complessivamente **esaustivi**


#### Induzione {#induzione}

Il principio di induzione permette di dimostrare una proprietá per un insieme **infinito** di casi.

1.  Si dimostra il caso base
2.  Si dimostra il caso induttivo
    -   assumendo che a proprietá sia vera per il caso precedente \\((n-1)\\)

<!--list-separator-->

-  Principio di Induzione Forte

    \\((\forall m < n : P (m)) \implies P(n)\\: \forall n \in \mathbb{N}\\)

<!--list-separator-->

-  Principio di Induzione sulle liste finite

    Ogni lista é costruita a partire dalla lista vuota e un numero finito di applicazioni del costruttore : o `cons`

    -   \\(P([])\\)
    -   \\(P(xs) \implies P(x : xs) \forall x \land xs\\)

    Come per il principio di induzione sui naturali é possibile generalizzare a tutte le liste <span class="underline">piú corte</span> di quella considerata per dimostrare il caso induttivo


#### Estensionalitá {#estensionalitá}

\begin{align\*}
(.)\\: f \\: id &= f\\: \\\\
(.)\\: f\\: id\\: x &= f\\: x
\end{align\*}

Si applicano funzioni diverse ad uno stesso argomento arbitrario \\(x\\) e si dimostra che il risultato non cambia.


#### Legge di Fusione {#legge-di-fusione}

Se

\begin{align\*}
f\\: a &= b \\\\
f\\: (g\\: x\\: y)
 &= h\\: x (f\\:y)
\end{align\*}

Allora

\begin{align\*}
f\\:.\\:\text{foldr}\\:g\\:a = \text{foldr}\\:h\\:b
\end{align\*}


### Stream {#stream}

O liste infinite

-   `Haskell` ne gestisce una parte finita grazie alla _lazyness_

La _bisimulazione_ serve per stabilire delle relazioni tra liste infinite.

-   una tecnica indiretta per egualiare stream sintatticamente diversi


#### List Comprehension {#list-comprehension}

\\[S = \\{2 \cdot x \mid x \in N , x \le 10\\}\\]

```haskell
l = [x*2 | x <- [1..10]]
m = [x | x <- [50..100],
         x 'mod' 7 == 3] -- filters
xs = [(i,j) | i <- (1,2),
              j <- (1..4)]
```

Sintassi ispirata alla <span class="underline">definizione intensionale di insiemi</span>.


#### Liste infinite in Haskell {#liste-infinite-in-haskell}

In `Haskell`

```haskell
ones::[Integer]
ones = 1 : ones
ones = 1 : [1 | _ <- ones]

-- fibonacci
fibs::[Integer]
fibs = 1: 1: zipWith(+) fibs tail fibs
fibs = 1: 1: [x+y | x <- fibs, y <- tail fibs] -- wrong
fibs = 1: 1: [x+y | x <- fibs, y <- [head(tail fibs)] -- still wrong
fibs = 1: 1: [x+y | x:y:xs <- tails fibs] -- Data.List
```

La seconda versione di `fibs` non funziona in quanto con 2 generatori la list comprehension agisce come un for sui due, elemento per elemento; la seconda lista in `y` non finisce di ciclare e considera solo il primo `x` (1)
La terza rimane sbagliata a causa della prioritá del generatore, che precede tutto ( `<-` )
L'ultima versione risolve il problema con il _pattern matching_ e la funzione `tails` in `Data.List`


#### Formalmente {#formalmente}

Stream definiti su \\(A\\):
\\[A^w = \\{\sigma \mid \sigma : \\{0,1,2,\cdots\\}\rightarrow A \\}\\]

-   liste enumerate
-   \\(A\\), il codominio, puó essere qualsiasi insieme
    -   uno Stream é infinito per definizione, il codominio di una funzione non puó essere \\(\emptyset\\)
    -   \\(A\\) non puó essere \\(\emptyset\\)

\\(\sigma(0)\\)

-   `head`

\\(\sigma'(n) = \sigma(n+1)\\)

-   derivata prima
-   `tail`

\\(\sigma(n)\\)

-   ennesimo di \\(\sigma\\)

\\(\sigma^{(0)} = \sigma\\)

-   derivata zeresima

\\(\sigma^{(k+1)}=(\sigma^{(k)})'\\)

-   induttivamente; derivata di ordine superiore

\\[\sigma= a : \tau = (a,\tau(0),\tau(1),\cdots) \\]

-   \\[\sigma(0) = a \qquad \sigma' = \tau\\]


## Laboratorio {#laboratorio}


### Haskel {#haskel}


#### Storia {#storia}

-   \\(\lambda\\) calcolo
    -   Alonzo Church
        -   calcolare con le funzioni, cosi' come con in numeri
        -   tutto e' una funzione con 1 IN e 1 OUT
            -   funzioni anonime
                -   identita'
                    -   \\(\lambda x,x\\)
    -   Haskell Curry
        -   currying
-   LISP - anni '50
    -   John McCarthy
        -   elaborazione informazione non-numerica/simbolica
        -   LISP = List Processor
            -   cons e map nascono qui
        -   primo <span class="underline">garbage collector</span>
-   ML
-   SASL, KRC, Miranda
    -   linguaggi <span class="underline">lazy</span> con valutazione solo al momento della richiesta della funzione
    -   SASL introduce guardie e currying
-   Haskell - anni '90
    -   linguaggio lazy, standardizzato
    -   separazione tra puro e impuro
        -   monadi
    -   overloading
    -   grosso impatto sul calcolo parallelo


#### Casi di Studio {#casi-di-studio}

<!--list-separator-->

-  Contatore accessi Web

    -   [Source](https://boystrange.github.io/LPP/HitCounter)

    Relazione biunivoca tra IP e utenti unici in accesso

    Java

    ```java
    public static int counter(InputStream stream) {
        Scanner scanner = new Scanner(stream);
        Set<String> clients = new HashSet<>();
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String ip = line.substring(0, line.indexOf(' ') + 1);
            clients.add(ip);
        }
        return clients.size();
    }
    ```

    Bash

    ```bash
    cut -d' ' -f1 | sort -u | wc -l
    ```

    Haskell

    ```haskell
    import Data.List (nub);
    counter :: String -> Int
    counter = length . nub . map (\line -> takeWhile (/= ' ') line) . lines
    ```

    Java 8

    ```java
    public static long counter(InputStream stream) {
        InputStreamReader reader = new InputStreamReader(stream);
        return new BufferedReader(reader)
            .lines()
            .map(line -> line.substring(0, line.indexOf(' ') + 1))
            .distinct()
            .count();
    }
    ```

<!--list-separator-->

-  Fibonacci Logaritmico

    <div class="code">

    type Matrice = (Integer, Integer, Integer, Integer)

    mul :: Matrice -&gt; Matrice -&gt; Matrice
    mul (a₁₁, a₁₂, a₂₁, a₂₂) (b₁₁, b₁₂, b₂₁, b₂₂) =
      (a₁₁ \* b₁₁ + a₁₂ \* b₂₁,
       a₁₁ \* b₁₂ + a₁₂ \* b₂₂,
       a₂₁ \* b₁₁ + a₂₂ \* b₂₁,
       a₂₁ \* b₁₂ + a₂₂ \* b₂₂)

    pow :: Matrice -&gt; Int -&gt; Matrice
    pow a k | k == 0         = (1, 0, 0, 1)

    | k \`mod\` 2 == 0 = b \`mul\` b         |
    |----------------------------------------|
    | otherwise      = a \`mul\` b \`mul\` b |

    where
      b = a \`pow\` (k \`div\` 2)

    fibonacci :: Int -&gt; Integer
    fibonacci k = risultato
      where
        (_, risultato, \_, \_) = (1, 1, 1, 0) \`pow\` k

    </div>

<!--list-separator-->

-  Ordinamento

    <div class="code">

    insertSort :: [Int] -&gt; [Int]
    insertSort []       = []
    insertSort (x : xs) = insert x (insertSort xs)
      where
        insert x [] = [x]
        insert x (y : ys) | x &lt;= y    = x : y : ys

    |                             |
    |-----------------------------|
    | otherwise = y : insert x ys |

    split :: [Int] -&gt; ([Int], [Int])
    split []           = ([], [])
    split [x]          = ([x], [])
    split (x : y : xs) = (x : ys, y : zs)
      where
        (ys, zs) = split xs

    merge :: [Int] -&gt; [Int] -&gt; [Int]
    merge []       ys = ys
    merge xs       [] = xs
    merge (x : xs) (y : ys) | x &lt;= y    = x : merge xs (y : ys)

    |                                   |
    |-----------------------------------|
    | otherwise = y : merge (x : xs) ys |

    mergeSort :: [Int] -&gt; [Int]
    mergeSort []  = []
    mergeSort [x] = [x]
    mergeSort xs  = merge (mergeSort ys) (mergeSort zs)
      where
        (ys, zs) = split xs

    </div>

<!--list-separator-->

-  Java Virtual Mini-Machine

    vedi: [IJVM]({{< relref "20200531062306-ijvm.md" >}}), [JVM]({{< relref "LFT.md#jvm" >}})
    Istruzioni:

    -   `PUSH v`
    -   `LOAD x`
    -   `STORE x`
    -   `OP f`
    -   `IF R l`
    -   `RETURN`

    <div class="code">

    type Value = Int
    type Var   = Int     -- indice di una variabile
    type Stack = [Value] -- con : inseriamo in testa
                         -- estraiamo con pattern matching
    type Frame = [Value] -- qui invece dobbiamo accedere
                         -- in posizioni arbitrarie

    </div>

    Per i `Frame` definiamo:

    <div class="code">

    load :: Var -&gt; Frame -&gt; Value
    load _ []       = 0
    load 0 (v : <span class="underline">)   = v
    load n (\_</span> : vs) = load (n-1) vs

    store :: Var -&gt; Value -&gt; Frame -&gt; Frame
    store 0 v []          = [v]
    store 0 v (\_ : vs)    = v : vs
    store n v []          = 0 : store (n-1) v [] -- inizializzazione a 0
    store n v (w : vs)    = w : store (n-1) v vs

    </div>

    Le Istruzioni possiamo pensarle come sottoclassi di una classe astratta `Istruzione`

    <div class="code">

    data Instruction
      = PUSH Value

    | LOAD Var                               |
    |----------------------------------------|
    | STORE Var                              |
    | OP (Value -&gt; Value -&gt; Value)     |
    | IF (Value -&gt; Value -&gt; Bool) Code |
    | RETURN                                 |

    type Code = [Instruction]

    </div>

    Queste definizioni algebriche sono simili a produzioni di una grammatica

    Permettono l'espressione di codice di questa forma:

    <div class="code">

    fibonacci :: Code
    fibonacci = init
      where
        init = PUSH 0 :
               STORE m :
               PUSH 1 :
               STORE n :
               loop
        loop = LOAD k :
               PUSH 0 :
               IF (==) fine :
               LOAD n :
               LOAD n :
               LOAD m :
               OP (+) :
               STORE n :
               STORE m :
               LOAD k :
               PUSH 1 :
               OP (-) :
               STORE k :
               loop
        fine = LOAD m :
               RETURN : []
        k    = 0
        m    = 1
        n    = 2

    </div>

    L'implementazione é completata con un interprete:

    <div class="code">

    run :: Code -&gt; Frame -&gt; Value
    run = aux []
      where
        aux :: Stack -&gt; Code -&gt; Frame -&gt; Value
        aux (v : [])     (RETURN : <span class="underline">)   _  = v
        aux vs           (PUSH v : is)  fr = aux (v : vs) is fr
        aux vs           (LOAD x : is)  fr = aux (load x fr : vs) is fr
        aux (v : vs)     (STORE x : is) fr = aux vs is (store x v fr)
        aux (w : v : vs) (OP f : is)    fr = aux (f v w : vs) is fr
        aux (w : v : vs) (IF p is : <span class="underline">)   fr | p v w = aux vs is fr
        aux (</span></span> : _ : vs) (IF _ _ : is)  fr = aux vs is fr

    </div>


#### Caratteristiche Linguaggio {#caratteristiche-linguaggio}

<!--list-separator-->

-  Guardie

    Introducono delle condizioni, alternativa al piú operazionale `if...then...else`

    ```haskell
    assoluto :: Int -> Int
    assoluto n | n >= 0 = n
               | n < 0  = negate n
    ```

    Nel caso che i casi siano <span class="underline">esaustivi</span> l'ultimo identificatore puó essere `otherwise`
    L'ordine delle guardie é significativo, sará scelta la prima guardia il cui valore sia valutato `True`

<!--list-separator-->

-  Ricorsione

    Non esistono _loop_ non esistendo la memoria, e quindi variabili su cui fare iterazione. e
    É quindi necessario utilizzare le definizioni ricorsive:

    ```haskell
    fattoriale :: Int -> Int
    fattoriale n | n == 0    = 1 -- supponendo n >= 0
                 | otherwise = n * fattoriale (n - 1)
    ```

    Si possono specificare piú equazioni, semplificando il codice

    ```haskell
    fattoriale :: Int -> Int
    fattoriale 0 = 1 -- lo 0 fa riferimento al parametro utilizzato
    fattoriale n = n * fattoriale (n - 1)
    ```

    Altro esempio classico, la sequenza di fibonacci

    ```haskell
    fibonacci :: Int -> Int
    fibonacci 0 = 0
    fibonacci 1 = 1
    fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
    ```

    Anche usando questa forma Haskell valuta le funzioni dall'alto verso il basso, nell'ordine.

    -   i pattern piú generali vanno piú in basso, `Haskell` in caso emette un `Warning` riguardo la ridondanza dei match non raggiungibili

    <!--list-separator-->

    -  Dall'iterazione alla ricorsione

        Esistono algoritmi piú efficienti in forma iterativa

        -   `fibonacci` applicato ricorsivamente ha una complessitá \\(n^{2}\\)
        -   una versione iterativa in un linguaggio imperativo ha complessitá \\(n\\)

        É possibile riprodurre anche in `Haskell` l'iterazione con un metodo meccanico

        -   inserire le variabili che vengono modificate nell'iterazione all'interno di una funzione ricorsiva che simula il ciclo

        <!--listend-->

        ```java
        public static int fibonacci(int k) {
            assert k >= 0;
            int m = 0;
            int n = 1;
            while (k > 0) {
                n = n + m;
                m = n - m;
                k = k - 1;
            }
            return m;
        }

        ```

        ```haskell
        fibonacciAux :: Integer -> Integer -> Int -> Integer
        fibonacciAux m _ 0 = m
        fibonacciAux m n k = fibonacciAux n (m + n) (k - 1)

        fibonacci :: Int -> Integer
        fibonacciAux 0 1 -- applicazione parziale

        fibonacci :: Int -> Integer
        fibonacci = aux 0 1
          where
            aux m _ 0 = m
            aux m n k = aux n (m + n) (k - 1)
        ```

        Una serie di chiamate ricorsive del genere consumerebbe memoria aumentando la dimensione dello stack dei frame? Meno efficiente del corrispettivo imperativo?
        No, il compilatore `Haskell` ricicla il vecchio frame delle funzione in quanto vede che i vecchi valori non sono utilizzati dopo la prima applicazione

        -   quando la funzione é _ricorsiva in coda_, ovvero la chiamata ricorsiva é l'ultima cosa fatta dalla funzione

<!--list-separator-->

-  Funzioni Anonime

    <span class="underline">&lambda;-Astrazioni</span>

    ```haskell
    (\x -> x+1)
      2
    (\x -> x >= 0) 2
    ```

    In Haskell, si dice **sezione** un'espressione racchiusa tra parentesi in cui un operatore binario viene applicato a uno solo dei suoi due argomenti.

    ```haskell
    (1 +)
    ('mod' 2)
    ```

<!--list-separator-->

-  Currying

    ```haskell
    addizione :: Int -> Int -> Int
    addizione x y = x + y
    addizione = \x -> \y -> x + y -- espandendo in lambda astrazioni é piú chiaro il tipo
    ```

    Da qui emerge l'associativitá a destra del tipo freccia:

    ```haskell
    (Int -> (Int -> Int))
    ```

    Questo é speculare alla composizione in lambda calcolo

    Si puo' convertire tra tipi numerici utilizzando:

    -   `fromIntegral`
    -   `truncate`
    -   `round`

<!--list-separator-->

-  Coppie e Tuple

    E' sufficiente circondare gli elementi con parentesi tonde

<!--list-separator-->

-  Liste

    Sequenza omogenea di elementi, che hanno quindi lo stesso tipo
    La sintassi utilizza le parentesi quadre.

    -   `[1..]` lista con tutti i numeri interi da 1 in avanti
        -   possibile perche' il linguaggio e' lazy

    Ogni lista puo' essere contruita a partire da due _costruttori canonici_

    -   `X : L`
        -   utilizzando _cons_
    -   `1 : 2 : 3 : []`
        -   cons e lista vuota

    Esiste funzione di concatenazione di liste

    -   `++`
        -   non modifica le liste di partenza, ne crea una nuova
        -   un linguaggio puro come `Haskell` non modifica strutture esistenti


#### Tipi e Classi {#tipi-e-classi}

`Haskell` e' un linguaggio fortemente tipato

<!--list-separator-->

-  Tipi primitivi

    -   `Int` numeri interi a precisione finita
    -   `Integer` numeri interi a precisione arbitraria
    -   `Float` numeri in virgola mobile a precisione singola
    -   `Double` numeri in virgola mobile a precisione doppia
    -   `Bool` booleani
         Il comando `:type` di GHCi interroga `Haskell` sul tipo inferito ad una espressione
        Si puo' scrivere il tipo di un valore affianco ad esso con la sintassi `:: Int`
        -   non e' una conversione di tipo, e' solo una annotazione utile al compilatore

<!--list-separator-->

-  map

    <div class="code">

    map :: (a -&gt; b) -&gt; [a] -&gt; [b]
    map _ [] = []
    map f (x : xs) = f x : map f xs

    </div>

<!--list-separator-->

-  filter

    <div class="code">

    filter :: (a -&gt; bool) -&gt; [a] -&gt; [b]
    filter _ [] = []
    filter p (x : xs) | p x       = x : filter p xs

    |                         |
    |-------------------------|
    | otherwise = filter p xs |

    </div>

<!--list-separator-->

-  fold

    <div class="code">

    foldr :: (a -&gt; b -&gt; b) -&gt; b -&gt; [a] -&gt; b
    foldr _ x [] = x
    foldr f x (y : ys) = f y (foldr f x ys) -- come fosse associativo a destra

    </div>


### Java8 {#java8}

Introduce _Lambda Espressioni_  e _Stream_ (ovvero liste infinite)

-   introdotti durante la revisione delle `Collection`
    -   nella revisione é stato utilizzato il <span class="underline">paradigma funzionale</span>
-   Queste `Stream` sono lazy e sono molto piú ad alto livello degli _stream_ a livello di `OS`

Java é un linguaggio _procedurale_, dove viene manipolata la mamoria. Al contrario di linguaggi _dichiarativi_ dove il programmatore si occupa del `cosa`, non del `come` (`SQL`, `Haskell`)

-   la _lazyness_ é perfetta quando si trattano strutture infinite, permette infatti di non valutare tutto l'argomento prima di applicare funzioni


#### Polimorfismo {#polimorfismo}

`class B extends class A` \\(\implies B <: A\\)

-   `B` é sottotipo e puó essere utilizzato in qualsiasi contesto in cui `A` puó essere utilizzato

Il `bytecode Java` non é generico di per se (lo era), quindi a quel livello sono automaticamente introdotti cast dal compilatore

Il `super` viene legato a tempo di compilazione (statico) a differenza di `this` (dinamico)


#### Filters {#filters}

Utilizzando un `Design Pattern Strategy` posso parametrizzare il predicato rispetto al filtro

-   rendendolo polimorfo
-   utilizzando una `Interface` per una classe-predicato che implementerá effettivamente il `test`
-   che poi é utilizzabile anche con le classi anonime _al volo_


#### Lambda {#lambda}

`(parameters) -> expression`
oppure
`(parameters) -> { statements; }`

```java
(x:int) -> x
// or
(x:int) -> {return x;}
```

non é introdotto un nuovo costruttore di tipo, vengono riutilizzate le `interfacce funzionali`

-   questa interfaccia ha un solo metodo astratto che corrisponde al body della \\(\lambda\\)
-   esistono interfacce di questo tipo predefinite, ovviamente ne si puó definire
    -   `@FunctionalInterface`
        -   `Predicate<T>`
        -   `Comparator<T>`
        -   `Callable<T>`
        -   `Runnable<T>`
        -   `Function<T>`
    -   [Docs Java8](https://docs.oracle.com/javase/8/docs/api/java/util/function/package-summary.html)
