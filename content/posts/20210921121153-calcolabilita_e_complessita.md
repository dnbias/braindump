+++
title = "Calcolabilitá e Complessitá"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

Prof: Stefano Berardi


## Info Corso {#info-corso}

-   Testo:
    -   [Introduction to the theory of Computation]({{< relref "20210921121359-introduction_to_the_theory_of_computation.md" >}})
-   Link:
    -   <https://turingmachinesimulator.com/>


## Teoria {#teoria}


### Macchina di Turing {#macchina-di-turing}

<span class="underline">The Church-Turing Thesis</span>
Utilizzata per definire un problema risolvibile

-   nato per dare una definizione semplice di risolvibilitá
    -   un qualsiasi computer puó essere ridefinito con una `MdT` equivalente
-   unico accesso alla memoria
    -   come un nastro, legge dall'inizio fino alla fine
        -   lenta
        -   non é una architettura realmente implementabile

Caratterizzata da:

-   controllo
    -   stati interni
        -   che definiscono comportamenti diversi
-   memoria/tape
    -   testa di lettura
    -   alfabeto a scelta

-   l'Input é finito
-   la fine del Input é marcata con un simbolo speciale

A differenza degli Automi a Stati Finiti puó sovrascrivere, appunta per aiutarsi nell'esecuzione

-   una macchina di turing puó simulare qualsiasi macchina a differenza di un DFA

La Macchina di Turing essendo estremamente semplice é ottima per lo studio della Calcolabilitá


#### Definizione Formale {#definizione-formale}

`MT 1936`
7-tupla \\((Q,\Sigma,\Gamma,\delta,q\_0,q\_{accept},q\_{reject})\\)

1.  \\(Q\\): insieme di stati
2.  \\(\Sigma\\): alfabeto di Input non contenente il simbolo di blank
3.  \\(\Gamma\\): alfabeto del nastro
4.  \\(\delta: Q \times \Gamma \rightarrow Q \times \Gamma \times \\{L,R\\}\\): funzione di transizione
    -   Left (&lt;) / Right (&gt;)
5.  \\(q\_{accept}\\)

<!--listend-->

-   Lo stato di rifiuto non viene inserito, é sottointeso a ogni Input non riconosciuto una transizione allo stato di rifiuto, bloccante
-   Lo stato \\(S\\) di `StayPut` é simulabile muovendosi continuamente \\(L\\) e \\(R\\), raddoppiando gli stati
-   Il nastro infinito a destra e sinistra si simula sulle celle pari e dispari su un nastro infinito solamente a destra


#### Grafi {#grafi}

<!--list-separator-->

-  Stringhe Uguali

    {{< figure src="/ox-hugo/grafoEs1.jpg" >}}

<!--list-separator-->

-  Stringa di 0 di lunghezza 2^n

    {{< figure src="/ox-hugo/graphPowerOfTwoLength.jpg" >}}


#### Macchine Turing a piú registri {#macchine-turing-a-piú-registri}

Con piú _tapes_ diventa molto piú semplice controllare stringhe, ci si avvicina nel comportamente ad una macchina di Von Neumann
Il primo nastro é l'Input, gli altri sono registri
\\(\delta: Q \times \Gamma^{k} \longrightarrow Q \times \Gamma^{k} \times \\{L,R,S\\}^{k}\\)

-   con \\(k\\) simboli / tapes
-   \\(S\\) é `StayPut`

Si puó simulare una `MT` a piú nastri con una `MT` ad un nastro solo

-   perché? per semplificare la definizione di calcolo
-   se un algoritmo a piú nastri é lineare su un nastro sará **quadratico**

{{< figure src="/ox-hugo/3tapes1tape.jpg" >}}


#### Enumeratori {#enumeratori}

Sono `TM` che enumerano stringhe.

\\(\textsc{\textbf{theorem}}\\)     Si puó definire un enumeratore \\(E\\) che enumeri un linguaggio \\(L\\) se e solo se esiste una `TM` \\(M\\) che riconosca (decida positivamente) il linguaggio \\(L\\)
\\(\textsc{\textbf{proof}}\\)      Partiamo a dimostrare che se esiste un tale \\(E\\) allora esiste una \\(M\\) che riconosca il linguaggio enumerato \\(L\\)

Possiamo definire \\(M\\) su input \\(w\\):

-   simula \\(E\\)
-   per ogni stringa enumerata da \\(E\\) confrontala con \\(w\\)
-   se \\(w\\) é uguale _accetta_, altrimenti continua con la simulazione di \\(E\\)

Da questa costruzione si evince che \\(M\\) accetta solo le stringhe enumerate da \\(E\\) e quindi nel linguaggio \\(L\\), \\(M\\) riconosce \\(L\\).

Ora si dimostra l'altra direzione. Se \\(M\\) riconosce il linguaggio \\(L\\) definiamo un enumeratore \\(E\\):

-   ignora l'input
-   ripeti per \\(i=0,1,\cdots\\)
    -   esegui per \\(i\\) passi \\(M\\) su \\(s\_1,s\_2,s\_3,\cdots\\)
    -   se \\(M\\) accetta, stampa la \\(s\_j\\) accettata

Questa macchina di turing \\(E\\) simula \\(M\\) su tutte le stringhe \\(s\_j\\) che appartengono a \\(\Sigma^\*\\) per \\(i\\) passi di simulazione, non terminando mai.
In questa simulazione sostanzialmente si simula in parallelo la macchina \\(M\\) su tutte le stringhe possibili in input (per un numero di passi di computazione sempre maggiore), stampando tutte e sole le \\(s\_j\\) accettate da \\(M\\).
Viceversa se una stringa appartiene ad \\(L\\) questa viene accettata in un numero finito di passi da \\(M\\), e quindi dato abbastanza tempo \\(E\\) la stamperá. Quindi \\(E\\) enumera il linguaggio \\(L\\).


### Decidibilitá {#decidibilitá}

Per un `DFA` possiamo definire una `TM M` che lo simula e verifica l'accettazione o meno dell'Input
[Decidable - Turing-recognizable](/ox-hugo/decidable-recognizable.jpg)

-   `NFA` convertibili
-   `RegEx` convertibili


#### Definizioni {#definizioni}

Sia \\(L\\) un linguaggio definito sull'alfabeto \\(\Sigma\\), e quindi sottoinsieme di \\(\Sigma^\*\\)
Allora \\(\forall w \in \Sigma^\*\\):

-   Decidibile, esiste una \\(M\\) che decide \\(L\\)
    -   \\(w\in L\\): \\(M\\) accetta \\(w\\)
    -   \\(w\notin L\\): \\(M\\) non accetta \\(w\\)
-   Positivamente Decidibile (_riconoscibile_)
    -   \\(w \in L\\): \\(M\\) accetta \\(w\\)
    -   \\(w \notin L\\): \\(M\\) non accetta \\(w\\) o non termina
-   Negativamente Decidibile
    -   \\(w \in L\\): \\(M\\) accetta \\(w\\) o non termina
    -   \\(w \notin L\\): \\(M\\) non accetta \\(w\\)

Allora definiamo \\(\overline{L} = \\{w\in \Sigma^\* \mid w \notin M\\}\\) **linguaggio complemento** di \\(L\\)
Per i linguaggi complemento si scambiano decidibilitá positiva e decidibilitá negativa:

-   \\(L\\) decidibile \\(\iff\\) \\(\overline{L}\\) decidibile
-   \\(L\\) positivamente decidibile \\(\iff\\) \\(\overline{L}\\) negativamente decidibile
-   \\(L\\) negativamente decidibile \\(\iff\\) \\(\overline{L}\\) positivamente decidibile

Esistono indebolimenti del decisore, ovvero decisori _parziali_


#### Teorema di Post {#teorema-di-post}

`4.22`
Linguaggio \\(L\\) decidibile \\(\iff\\) é <span class="underline">positivamente</span> e <span class="underline">negativamente</span> decidibile

-   \\(M\\) termina sempre \\(\forall w \in \Sigma^{\*}\\)
-   \\(M\\) é un decisore che simula \\(M\_{1}\\) e \\(M\_{2}\\) in parallelo
    -   il primo che termina decide

Riformulando

-   un linguaggio é decidibile esattamente quando esso e il suo complemento sono <span class="underline">positivamente decidibili</span>

\\(\textsc{\textbf{proof}}\\)   Si dimostra prima una direzione e poi l'altra della bi-implicazione

1.  \\(\Rightarrow\\)
    -   Se \\(A\\) é decidibile allora segue direttamente che \\(A\\) e \\(\overline{A}\\) sono positivamente decidibili
        -   per definizione di decidibilitá e complemento di un linguaggio

2.  \\(\Leftarrow\\)
    -   Se \\(A\\) e \\(\overline{A}\\) sono positivamente decidibili, definiamo \\(M\_1\\) e \\(M\_2\\), decisori positivi di uno e dell'altro
    -   Si definisce \\(M\\), decisore di \\(A\\)
        -   \\(M =\\) Su input \\(w\\):
            1.  Esegui \\(M\_1\\) e \\(M\_2\\) sull'input \\(w\\) in parallelo
            2.  Se \\(M\_1\\) accetta, _accept_; se \\(M\_2\\) accetta, _rifiuta_
    -   Ogni stringa \\(w\\) appartiene a \\(A\\) o \\(\overline{A}\\)
        -   Segue che per qualsiasi input una tra \\(M\_1\\) e \\(M\_2\\) deve accettare
    -   \\(M\\) termina quando una tra \\(M\_1\\) e \\(M\_2\\) accetta
        -   Segue che \\(M\\) termina sempre, quindi é un decisore
    -   Inoltre \\(M\\) accetta tutte le \\(w \in A\\) e rifiuta tutte le \\(w \notin A\\), quindi \\(M\\) é un decisore per \\(A\\)
        -   \\(A\\) quindi é decidibile in quanto ne esiste un decisore \\(M\\)                                            \\(\blacksquare\\)


#### Mapping Reducible Language {#mapping-reducible-language}

Il Linguaggio \\(A\\) é _mapping reducible_ al linguaggio \\(B\\):

\\(A \le\_{m}B\\)

se esiste una _funzione computazionale_ \\(f\\) tale che:

\\(w \in L(A) \iff f(w) \in L(B)\\)

{{< figure src="/ox-hugo/mapping-reducibility.jpg" >}}

Seguono i corollari:

-   Se \\(A \le\_{m}B\\) e \\(B\\) é decidibile \\(\implies A\\) é decidibile
    -   si dimostra costruendo la funzione e poi eseguendo \\(B\\) sull'input trasformato
    -   stessa dimostrazione per la decidibilitá positiva
-   Se \\(A \le\_{m}B\\) e \\(A\\) non é positivamente decidibile \\(\implies B\\) non é positivamente decidibile
    -   \\(\textsc{\textbf{proof}}\\)   Supponendo \\(A = \overline{A\_{TM}}\\)
        1.  \\(A \le\_m B\\)
        2.  \\(\overline{A} \le\_m \overline{B}\\)
        3.  \\(A\_{TM} \le\_m \overline{B}\\)
            -   ma se \\(\overline{B}\\) fosse negativamente decidibile (quindi \\(B\\) positivamente decidibile) allora per la proprietá di cui sopra \\(A\_{TM}\\) sarebbe negativamente decidibile
            -   Ma \\(A\_{TM}\\) non puó esserlo, altrimenti sarebbe decidibile per il Teorema di Post: contraddizione.     \\(\blacksquare\\)


#### Macchina di Turing Universale {#macchina-di-turing-universale}

\\[U = \text{"Su input }\langle M,w \rangle\text{, dove } M \text{ é una TM e } w \text{ é una stringa"} \\]

1.  Simula \\(M\\) su \\(w\\)
2.  Se \\(M\\) accetta, _accetta_; se \\(M\\) rifiuta, _rifiuta_

Se \\(M\\) cicla, \\(U\\) cicla di conseguenza

La macchina universale é definita a partire da \\(M\\) codificando in un alfabeto binario tutti i simboli di \\(M\\). La macchina \\(U\\) é definita utilizzando un alfabeto \\(\Sigma=\\{0,1\\}\\), quindi un qualsiasi stato o simbolo \\(s\\) di \\(M\\) sará convertibile in una stringa binaria \\(s^\*\in \Sigma^\*\\)
Nelle tape di \\(U\\) tutti i simboli sono delimitati da #.

Queste codifiche sono utilizzate nelle 5 tape di \\(U\\), definite in questo modo:

1.  la funzione di transizione \\(\sigma\\) di \\(M\\), questa tape é read-only e qui sono listate tutte le transizioni di \\(M\\) nella forma \\(q^\*, a^\*,q'^\*,a'^\*,m^\*\\) dove \\(a\\) sono simboli di \\(M\\) e \\(m\\) sono \\(L\\) o \\(R\\)
2.  lo stato corrente di \\(M\\), \\(q^\*\\)
3.  lo stato accettante di \\(M\\), \\(q\_{accept}^\*\\)
4.  lo stato di rifiuto di \\(M\\), \\(q\_{reject}^\*\\)
5.  la tape di simulazione di \\(M\\)

La macchina universale procede leggendo lo stato corrente di \\(M\\) e il simbolo \\(a^\*\\) che si trova sotto la testina di lettura di nella tape 5. Quindi scorre le quintuple nella prima tape, se non trova una corrispondenza rifiuta. Se trova una corrispondenza allora sovrascrive la tape 2 con il nuovo stato indicato dalla funzione di transizione e sovrascrive \\(a^\*\\) nella tape 5 con la nuova \\(a'^\*\\) indicata dalla transizione e aggiungendo un divisore #. fatto questo simula il movimento a destra o a sinistra della testina di \\(M\\) spostandosi nella direzione indicata fino ad un #.


#### Problemi Decibidili {#problemi-decibidili}

\\(E\_{\textsc{dfa}} = \\{\langle A \rangle\ \mid A\mbox{ is a \textsc{dfa} and } L(A)=\emptyset}\\)

-   decidibile studiando i percorsi nel grafo delle transizioni

\\(EQ\_{\textsc{dfa}} = \\{\langle A \rangle\ \mid A\mbox{ is a \textsc{dfa} and } L(A)=\emptyset}\\)

-   automa che descrive la differenza simmetrica dei linguaggi
-   si riduce a \\(E\_{\textsc{dfa}}\\)

\\(A\_{\textsc{CFG}}=\\{\langle G,w \rangle \mid G\mbox{ is a \textsc{CFG} that generates string }w\\}\\)

-   tempo di accettazione \\(2^n\\)
-   non c'é problema di fermata

\\(E\_{\textsc{CFG}}=\\{\langle G \rangle \mid G\mbox{ is a \textsc{CFG} and }L(G) = \emptyset\\}\\)


#### Problemi Indecidibili {#problemi-indecidibili}

Per molti problemi si utilizza la tecnica della riduzione

-   se un problema che sappiamo non decidibile si puó ridurre al problema che stiamo studiando allora anche questo non sará decibidile

<!--list-separator-->

-  Eguaglianza Chompsky

    \\(EQ\_{\textsc{CFG}}=\\{\langle G,H \rangle \mid G\mbox{ and }H\mbox{ are \textsc{CFG}s and }L(G) = L(H)\\}\\)

<!--list-separator-->

-  Accettazione

    `4.11`
    Problema <span class="underline">positivamente decidibile</span>

    \\(\textsc{\textbf{proof}}\\)   Si procede per _diagonalizzazione_ utilizzando due `TM` di supporto \\(H\\) e \\(D\\)

    \\(A\_{\textsc{TM}}=\\{\langle M,w \rangle \mid M\mbox{ is a \textsc{TM} and }M\mbox{ accepts }w\\}\\)

    -   simulabile con una macchina \\(U\\) di Turing universale
        -   macchina capace di simulare qualsiasi macchina utilizzando 5 tape
    -   si osserva l'esecuzione che non termina

    Si prova utilizzando la tecnica della _diagonalizzazione_ scoperta dal matematico [Georg Cantor]({{< relref "20211014120018-georg_cantor.md" >}}) nel 1873

    -   iniezione - suriezione (biezione)
        -   corrispondenza 1 a 1
    -   prova che non esiste una enumerazione per un dato insieme di numeri
        -   per i Reali si cambia nella ennesima enumerazione la ennesima cifra dopo la virgola
            -   si trova cosí un numero che differisce per una cifra da tutti i numeri enumerati
    -   esistono infinite terne

    \\(\textsc{\textbf{proof}}\\)      Si definiscono delle `MT` di supporto:

    \\[H(\langle M,w \rangle) = \begin{cases}
    \textit{accept} \quad &\text{if }M\text{ accepts }w \\\\
    \textit{reject} \quad &\text{if }M\text{ does not accept }w
    \end{cases}\\]

    -   supponiamo che `H` esista, e accetti se `M` accetta `w` e rifiuti altrimenti

    \\[D(\langle M \rangle) = \begin{cases}
    \texttit{accept} \quad &\text{if }M\text{ does not accept } \langle M \rangle \\\\
    \texttit{reject} \quad &\text{if }M\text{ accepts } \langle M \rangle
    \end{cases}\\]

    -   `D` prende in input una macchina `M` e con un decisore `H` che decide `M` con input la propria descrizione \\(\langle M \rangle\\), accetta se `H` rifiuta e viceversa, continua con altre macchine
        -   diagonalizza infinite macchine `M`

    Allora si procede diagonalizzando con \\(D\\) applicato a \\(\langle D\rangle\\)
    \\[D(\langle D \rangle)\begin{cases}
    \textit{accept} \quad &\text{if }D\text{ does not accept }\langle D \rangle \\\\
    \textit{reject} \quad &\text{if }D\text{ accepts }\langle D \rangle
    \end{cases}\\]

    -   dovrebbe rifiutare se \\(D\\) accetta
    -   dovrebbe accettare altrimenti
        -   non puó terminare perché per terminare avrebbe bisogno di dare la risposta opposta di se stesso

    <span class="underline">Abbiamo raggiunto una contraddizione</span>                                                             \\(\blacksquare\\)

<!--list-separator-->

-  Immortalitá

    `4.23`
    \\(\overline A\_{\textsc{tm}}\\) <span class="underline">positivamente decidibile</span> \\(\implies  A\_{\textsc{tm}}\\) <span class="underline">negativamente decidibile</span> per `T.Post`

    -   Falso per `4.11`

<!--list-separator-->

-  Fermata

    `5.1`
    Il problema della decisione per \\(L\_{1}\\) si riduce al problema della decisione per \\(L\_{2}\\) se sappiamo trasformare un decisore per \\(L\_{2}\\) in un decisore per \\(L\_{1}\\)

    \\(\textsc{halt}\_{\textsc{tm}}=\\{\langle M,w\rangle \mid M \mbox{ is a \textsc{tm} and }M \mbox{ halts on input } w\\}\\)

    -   \\(A\_{\textsc{tm}} <\_m \textsc{Halt}\_{TM}\\)

    \\(\textsc{\textbf{proof}}\\)     Per contraddizione. Supponiamo esista una `TM` \\(R\\) che decida la fermata, definiamo una `TM` \\(S\\) che decide l'accettazione. Ma l'accettazione non é decidibile.
    Definiamo \\(S\\) su input \\(w\\):

    -   Se \\(R\\) accetta \\(\langle M,w \rangle\\) procedi, altrimenti rifiuta
    -   Simula \\(M\\) su \\(w\\), se accetta fa altrettanto, altrimenti rifiuta

    \\(A\_{\text{TM}} \le\_m \text{HALT}\_{\text{TM}}\\) in quanto se \\(R\\) accetta significa che \\(M\\) termina, accettando o rifiutando. Se diverge \\(w\\) non appartiene al linguaggio riconosciuto da \\(M\\) e \\(S\\) puó rifiutare.
    Per ció \\(S\\) accetta tutte e sole le stringhe in \\(L\\), ovvero riconosciute da \\(M\\).

    Ma questa é una contraddizione  in quanto si dimostra che \\(A\_{\text{TM}}\\) non é decidibile.    \\(\blacksquare\\)

<!--list-separator-->

-  Decibidilitá dei Linguaggi di Chompsky

    _Simboli, Produzioni, Terminali_
    Un linguaggio definibile da una grammatica in forma normale di Chompsky é detto `context-free`
    Si dimostra che il numero di passi per derivare una stringa di lunghezza \\(n\\) é \\(2n-1\\)

    Questo implica che il problema é decidibile, anche se in tempo esponenziale

    -   si scrivono sulla tape 2 tutte le deduzioni di lunghezza \\(2n-1\\)
    -   si controlla la correttezza una ad una, se ne si trova una corretta e che corrisponde accettiamo, altrimenti continuiamo, se alche l'ultima non va bene rifiutiamo

    Per ridurre la complessitá si utilizza la **programmazione dinamica**

    -   ci si appunta i risultati intermedi

<!--list-separator-->

-  Emptyness

    `5.2`
    Si dimostra per assurdo, se esistesse si potrebbe risolvere l'accettazione

    -   si riduce a \\(A\_{\textsc{tm}}\\)
        -   \\(A\_{\textsc{tm}} <\_m E\_{\textsc{tm}}\\)

    \\(\textsc{\textbf{proof}}\\)   Per contraddizione. Supponiamo esista una \\(R\\) tale che decida la emptyness, dato una stringa di input \\(w\\) si modifica \\(M\\) per accettare solo questa stringa.
    Definiamo \\(M\\), su input \\(x\\):

    -   se \\(x \neq w\\) rifiuta
    -   altrimenti accetta

    Questa macchina decide il linguaggio che contiene la sola stringa \\(w\\).

    Allora \\(S\\), su input \\(\langle M, w \rangle\\):

    -   costruisce la \\(M\\) modificata come specificato
    -   esegue \\(R\\) su \\(M\\), se \\(R\\) accetta allora rifiuta, e viceversa

    In questo modo abbiamo ridotto l'accettazione alla emptyness:
    \\(R\\) rifiuta se e solo se \\(M\\) accetta \\(w\\), e quindi il linguaggio \\(L\\) riconosciuto da \\(M\\) non é vuoto. Viceversa se \\(M\\) rifiuta \\(w\\) allora \\(R\\) accetterá in quanto \\(L\\) riconosciuta da \\(M\\) é il linguaggio vuoto. Quindi \\(S\\) decide l'accettazione. Contraddizione in quanto l'accettazione é non decidibile.              \\(\blacksquare\\)

<!--list-separator-->

-  Equality

    `5.4`
    Intesa tra due `MT`

    -   se sapessi deciderla potrei decidere anche l'`Emptyness`
        -   In quanto \\(E\_{\text{TM}}\\) é considerabile un caso particolare di \\(EQ\_{\text{TM}}\\)
        -   tra una macchiana e la macchina che rifiuta sempre

    Anche per i reali:

    -   calcoli diversi portano anche arrotondamenti diversi, per questo reali rigorosamente uguali possono risultare diversi
    -   \\(A\_{\textsc{tm}}<\_m EQ\_{\textsc{Real}}\\)
        -   e di conseguenza anche il &lt; e il &gt;

    \\(EQ\_{TM} = \\{\langle M\_{1}, M\_{2} \rangle \mid L(M\_{1}) = L(M\_{2})\\}\\)
    \\(\qed\\)
    \\(\textsc{\textbf{proof}}\\)    Si dimostra per riduzioni:

    1.  \\(A\_{TM} \le\_{m} \overline{EQ}\_{TM}\\)
        -   questo indica che \\(EQ\_{TM}\\) non puó essere negativamente decidibile
        -   spostiamo al decidibilitá a \\(A\_{TM}\\)
    2.  \\(\overline A\_{TM} \le\_{m} EQ\_{TM}\\)
        -   questo indica che \\(EQ\_{TM}\\) non puó essere positivamente decidibile

    Ora basta raggiungere queste conclusioni per chiudere la dimostrazione.

    1.  Definisco una macchina \\(F\\) che implementa la funzione \\(f\\) che riduce \\(A\\) a \\(\overline{EQ}\\)
        -   \\(\langle M, w \rangle \rightarrow^{F} \langle M\_{1}, M\_{2} \rangle\\)
        -   se \\(L(M\_{1}) \neq L(M\_{2})\\) allora \\(M\\) accetta \\(w\\)
            -   \\(M\_{1}\\) rifiuta sempre
                -   \\(q\_{0} = q\_{\text{reject}}\\)
            -   \\(M\_{2}\\)
                -   prende \\(x\\) e lo ignora
                -   esegue \\(M\\) su \\(w\\) e accetta se \\(M\\) accetta
                    -   \\(\begin{cases} M \mbox{ accetta}: & L(M\_{2})=\Sigma^{\*}\\\M \mbox{ non accetta}: & L(M\_{2}) = \emptyset  \end{cases}\\)
            -   \\(L(M\_{1}) \neq L(M\_{2}) \iff M \mbox{ accetta }w\\)
    2.  Definisco una Macchina \\(G\\) che implementa la funzione \\(g\\) che riduce \\(\overline A\\) a \\(EQ\\)
        -   \\(\langle M, w \rangle \rightarrow^{G} \langle M\_{1}, M\_{2} \rangle\\)
        -   se \\(L(M\_{1}) \neq L(M\_{2})\\) allora \\(M\\) non accetta \\(w\\)
            -   \\(M\_{1}\\) accetta sempre
                -   \\(q\_{0} = q\_{\text{accept}}\\)
            -   \\(M\_{2}\\)
                -   prende \\(x\\) e lo ignora
                -   esegue \\(M\\) su \\(w\\) e accetta se \\(M\\) accetta
                    -   \\(\begin{cases} M \mbox{ accetta}: & L(M\_{2})=\Sigma^{\*}\\\M \mbox{ non accetta}: & L(M\_{2}) = \emptyset  \end{cases}\\)
            -   \\(L(M\_{1}) \neq L(M\_{2}) \iff M \mbox{ non accetta }w \qquad\qquad \blacksquare\\)

<!--list-separator-->

-  Corrispondenza di Post

    `PCP - 4.22`

    \\(A\_{TM} \le\_{m} \text{PCP}\\)

    Questo problema (domino) contiene la Macchina di Turing

    -   in quanto corrisponde alla visualizzazione della [Configurazione di una TM](#configurazione-di-una-tm)
        -   visualizzando la storia del calcolo della macchina

    Si definisce un _Modified Post Correspondance Problem_:

    \\(A\_{TM} \le\_{m} \text{MPCP} \le\_{m} \text{PCP}\\)

    Si decide che il primo elemento dell'insieme deve essere utilizzato all'inizio

    -   sopra abbiamo \\(n-1\\) passi di calcolo
    -   sotto abbiamo \\(n\\) passi di calcolo

    Questi _domini_ rappresentano le funzioni di transizione attraverso le configurazioni della `TM`

    -   \\([\frac{\\#qa}{\\#rb}]\\)
        -   \\(\delta(q,a) = (r,b,L)\\)
    -   compresi i pezzi dei singoli simboli, che si mantengono da un istante all'altro se non toccati dalla trasformazione di stato
        -   \\([\frac{1}{1}]\\)
        -   \\([\frac{0}{0}]\\)
        -   \\([\frac{\sqcup}{\sqcup}]\\)
        -   \\([\frac{\\#}{\sqcup\\#}]\\)
            -   utilizzato quando lo stato deve spostarsi a destra oltre l'ultimo simbolo

    Si devono definire dei domino per l'accettazione, che faccia _match_:
    \\([\frac{q\_{accept}\\#\\#}{\qquad \\;\\;\\;\\: \\#}]\\)
    Per arrivare a questo _accept_:
    \\(\forall a\in \Gamma\\)

    -   \\([\frac{a\\: q\_{accept}}{\quad q\_{accept}}]\\)
    -   \\([\frac{q\_{accept} \\: a}{q\_{accept}\quad}]\\)

<!--list-separator-->

-  Tassellazione - Wang Tiles

    [Wikipedia](https://en.wikipedia.org/wiki/Wang_tile)
    Solo negativamente decidibile

    -   le tassellazioni aperiodiche sono utilizzate per la sintesi procedurale di texture, heightfields

    Si dimostra che \\(\textsc{Wang}\\) non é positivamente decidibile in quanto

    -   \\(\overline{\textsc{Halt}} \le\_m \textsc{Wang}\\)
    -   procedendo in maniera non deterministica, il caso di _non-rifiuto_ indica che un albero della computazione ha per caso scelto la configurazione corretta per risolvere il problema della tassellazione
    -   la computazione non deterministica si ferma solo in caso di rifiuto di tutti i rami non deterministici, quindi se la computazione non si ferma si dovrebbe accettare

<!--list-separator-->

-  Esistenza di un DFA equivalente

    `5.3`
    \\(A\_{\textsc{tm}} <\_m\textsc{Regular}\_{\textsc{tm}}\\)


#### Configurazione di una TM {#configurazione-di-una-tm}

{{< figure src="/ox-hugo/tm-configuration.jpg" caption="<span class=\"figure-number\">Figure 1: </span>configurazione di \\(1011 q\_{7} 01111\\)" >}}


#### Recap {#recap}

{{< figure src="~/org/media/img/decidability.jpg" >}}

-   Negativamente Decidibili
    -   \\(E\_{\textsc{tm}}\\)
    -   \\(\overline A\_{\textsc{tm}}\\)
    -   \\(\textsc{All}\_{\textsc{cfg}}\\)
    -   \\(\textsc{Wang}\\)
-   Decidibili
    -   \\(E\_{\textsc{cfg}}\\)
    -   \\(A\_{\textsc{cfg}}\\)
    -   \\(\textsc{Eq}\_{\textsc{dfa}}\\)
-   Positivamente Decidibili
    -   \\(\overline E\_{\textsc{tm}}\\)
    -   \\(A\_{\textsc{tm}}\\)
    -   \\(\textsc{Halt}\_{\textsc{tm}}\\)
    -   \\(\textsc{pcp}\\)
        -   [Corrispondenza di Post](#corrispondenza-di-post)
-   Né negativamente né positivamente decidibili
    -   \\(\textsc{Regular}\_{\textsc{tm}}\\)
    -   \\(\textsc{Eq}\_{\textsc{tm}}\\)
    -   \\(\textsc{Context-Free}\_{\textsc{tm}}\\)
    -   \\(\textsc{All}\_{\textsc{tm}}\\)
        -   se un programma accetta sempre


### Complessitá Temporale {#complessitá-temporale}

Trattata nel corso di Algoritmi: [Complessitá di un algoritmo]({{< relref "20210414192358-problems_algorithms.md#complessitá-di-un-algoritmo" >}})
Per lo studio della complessitá consideriamo la <span class="underline">Macchina di Turing</span> (1 registro)

-   questo in quanto la complessitá varia anche in base all'architettura

Il tempo di calcolo della macchina \\(M\\) é definito come

\\(f : \mathbb{N} \to \mathbb{N}\\) dove \\(f(n)\\) é il numero massimo di passi compiuti dalla macchina \\(M\\)

Si utilizza la _notazione asintotica_ o **big-O Notation**

-   [O-grande]({{< relref "20210414192358-problems_algorithms.md#o-grande" >}})

\\[\textsc{Time}= \\{L \mid L \text{ risolvibile da =TM= deterministica in }O(f(n)) \text{ polinomiale}\\}\\]
\\[\textsc{NTime}= \\{L \mid L \text{ risolvibile da =TM= non deterministica in }O(f(n))\text{ polinomiale} \\}\\]

Generalmente:

-   \\(\text{P} =\\) classe dei linguaggi la cui appartenenza puó essere decisa velocemente
-   \\(\text{NP} =\\) classe dei linguaggi la cui appartenenza puó essere verificata velocemente

Non si é riuscita a provare l'esistenza di un singolo linguaggio \\(\text{NP}\\) che non sia in \\(\text{P}\\)

Piú grande problema aperto: \\(\text{P}=\text{NP}\\)
![](/ox-hugo/P-NP.jpg)


#### P {#p}

Teorema `7.8`
Sia \\(t(n)\\) una funzione t.c. \\(t(n) \ge n \implies\\) qualsiasi macchina _multitape_ \\(M\\) con  tempo \\(t(n)\\) ha un equivalente \\(O(t^2(n))\\) in una macchina \\(M'\\) _singletape_

-   chiaro riprendendo la simulazione di _multitape_ in _singletape_
-   un passo della simulazione _singletape_ impiega al massimo \\(O(t(n))\\) passi

La classe di tempo **Polinomiale** é definito come

\\[\text{P} = \bigcup\_k \textsc{time}(n^k)\\]


#### Non Determinismo {#non-determinismo}

Teorema `7.11`
Sia \\(t(n)\\) una funzione dove \\(t(n)>n\\).
Allora ogni `TM` _singletape_ <span class="underline">non deterministica</span> con complessitá temporale \\(t(n)\\) ha una equivalente `TM` <span class="underline">determinitistica</span> \\(2^{O(t(n))}\\), nel caso di una macchina multiregistro
Per una `TM` deterministica a registro singolo si avrá sempre complessitá \\(2^{O(t(n))}^2} = 2^{O(t(n))}\\)

L'esplorazione dell'albero non deterministico é svolto utilizzando _l'ordine lessicografico_

-   in profonditá
-   questo é posto nell'_address tape_ della macchina **deterministica** corrispondente
-   a livello \\(n\\) l'albero ha massimo \\(k^{n}\\) nodi con \\(k\\) numero di possibili figli
-   il numero di passi necessari all'esplorazione dell'albero é \\(2^{O(m)}\\)
    -   \\(m\\) profonditá dell'albero

<!--list-separator-->

-  Raggiungibilitá

    \\(\textsc{Path} = \\{ \langle G,s,t  \rangle \mid G \text{ é  diretto con un cammino da }s \text{ a } t \\}\\)
    La soluzione banale non deterministica ha \\(2^{O(t(n))}\\) <span class="underline">esponenziale</span>

    Con un algoritmo marcando i nodi man mano che vengono scoperti si raggiunge complessitá <span class="underline">polinomiale</span>

    -   rappresentando il grafo con liste di adiacenza la si puó stimare \\(O(n)\\) nel numero di archi

<!--list-separator-->

-  Algoritmo di Euclide

    \\(\textsc{RelPrime}\\), il `MCD` tra due numeri Relativamente Primi é 1
    \\(\textsc{mcd}(x,y) = \textsc{mcd}(x \mod(y), y)\\)
    quindi procediamo:
    \\((x,y) \to (x \mod{y}, y) \to (y, x\mod{y})\to \cdots \to (x,0)\\)
    \\(\textsc{mcd}(x,0) = x\\)

    I passi sono eseguiti \\(min(2 \log\_{2} x, 2\log\_{2} y)\\) ovvero proporzionali al numero di cifre nella rappresentazione binaria: \\(O(n)\\) quindi <span class="underline">polinomiale</span>

<!--list-separator-->

-  Grammatiche di Chompsky

    Per migliorare la complessitá si cerca di derivare tutte le sottostringhe di lunghezza crescente della stringa di input

    -   si memorizzano le soluzioni delle sottostringhe
        -   per ogni sottostringa la si divide in sottostringhe e si guarda la soluzione delle sottostringhe
        -   in una rappresentazione matriciale la soluzione si trova nella riga precedente
    -   ogni controllo richiede \\(O(1)\\) in quanto le sottostringhe sono sempre riconducibile ai siboli terminali

    Con questo algoritmo si raggiunge \\(O(n^3)\\)


#### NP {#np}

Un linguaggio é `NP` \\(\iff\\) é deciso da un algoritmo <span class="underline">non deterministico polinomiale</span>
Un \\(M: O(n^k)\\) `NTM` equivale a \\(M': 2^{O(n^k)}\\) `TM`

-   da tempo polinomiale a tempo esponenziale

\\[\text{NP} = \bigcup\_k \textsc{ntime}(n^k)\\]

Un linguaggio é `NP` se dispone di un _verificatore_ in tempo polinomiale, detto allora _polinomialmente verificabile_

**Def** `7.18`
Un **verificatore** é una macchina di turing \\(V\\) tale che per un linguaggio \\(A\\):

-   \\(A = \\{w \mid V \text{ accepts } \langle w,c \rangle \text{ for some string }c\\}\\)
    -   \\(w\\) riguarda i dati del problema
    -   \\(c\\) riguarda le istruzioni della `TM`, un candidato di soluzione o almeno ci é legato in qualche maniera
        -   potrebbe essere anche il cammino della macchina non deterministica
        -   la _address tape_ nella simulazione deterministica di una macchina non deterministica
-   si misura il tempo di un verificatore solo in funzione della lunghezza di \\(w\\)
    -   un verificatore polinomiale esegue in tempo polinomiale secondo la lunghezza di \\(w\\)

**Prova** `7.20`
Il determinismo con certificato \\(c\\) utilizzando \\(V\\) é convertito in non determinismo trovando il \\(c\\) in maniera non deterministica di lunghezza massima \\(n^k\\) (dove questo é il polinomio di complessitá)

Si dimostra quindi che le due definizioni sono equivalenti in quanto é sempre possibile convertire un \\(V\\) polinomiale in una \\(M\\) polinomiale non deterministica e viceversa.

<!--list-separator-->

-  NP-completo

    \\(\textsc{\textbf{definition}}\\)  Un linguaggio \\(B\\) é \\(\textsc{NP}\text{-completo}\\) se soddisfa le seguenti condizioni:

    1.  \\(B \in \textsc{NP}\\)
    2.  \\(\forall A\in \textsc{NP}, A  <\_P B\\)
        -   \\(A\\) si riduce in tempo polinomiale a \\(B\\)

    Ci sono quindi due possibilitá che si escludono l'un l'altra:

    -   \\(\text{P} = \text{NP}\\)
    -   Tutti i problemi \\(\text{NP-completi}\\) non sono polinomiali

    La classe \\(\text{NP-completo}\\) descrive i problemi piú difficili in \\(\text{NP}\\)

<!--list-separator-->

-  Teorema di Cook-Levin

    Problemi in \\(\textsc{NP}\\) la cui complessitá é legata a quella dell'intera classe sono detti \\(\textsc{NP}\text{-completi}\\)
    Il problema della soddisfatibilitá (_satisfiability problem_) fa parte di questa classe

    -   Una formula booleana é soddisfacibile se qualche assegnamento di 0 e di 1 fa si che la formula risulti 1
    -   \\(\textsc{SAT}=\\{ \langle \phi \mid \phi \rangle\\) é una formula booleana soddisfacibile \\(\\}\\)

    `7.27`
    \\(\textsc{\textbf{theorem}}\\)  \\(\textsc{SAT}\in \textsc{P} \iff \textsc{P}=\textsc{NP}\\)

    Questo teorema é implicato da `7.37`:
    \\(\textsc{\textbf{theorem}}\\)  \\(\textsc{SAT}\\) é \\(\textsc{NP}\text{-completo}\\)
    \\(\textsc{\textbf{corollary}}\\)   \\(\text{3SAT}\\) é \\(\text{NP-completo}\\)

    -   \\(\text{CNF-SAT} \le\_P \text{3-SAT}\le\_P \text{CLIQUE}\\)

    **NB** - Per provare la \\(\text{NP-completessa}\\) si procede da \\(\text{SAT}\\) al problema in particolare

<!--list-separator-->

-  Hamilton's Path

    Percorso che percorre tutti il grafo a partire da \\(p\\) arrivando in \\(t\\) senza ripetizioni.
    Si percorre il grafo non deterministicamente

    -   si scartano tutti i rami in cui il primo nodo non é \\(p\\) o \\(t\\) non é l'ultimo
    -   si scartano i rami in cui ci sono ripetizioni

    Non conosciuto algoritmo in \\(\text{P}\\)

    \\(\text{3SAT}  \le\_P \textsc{HamPath}\\)

<!--list-separator-->

-  Compositeness

    \\(\textsc{Composites} = \\{x \mid x = pq \text{ for integers }p,q > 1\\}\\)
    Un numero composto é un numero non primo.
    Esiste un algoritmo polinomiale per verificare se un numero é composto o meno ma non per trovare la sua scomposizione (o almeno non lo si é trovato)
    Quindi: \\(\textsc{Composites} \in \text{NP} \land \textsc{Composites} \in \text{P}\\)

<!--list-separator-->

-  Clique

    `7.32`
    Grafo <span class="underline">non orientato</span>, fornito un \\(k\\)

    -   si richiede un <span class="underline">sottografo</span> in cui 2 qualunque nodi distinti sono connessi di un arco

    Non si sa se esistono algoritmi polinomiali \\(\text{P}\\)

    \\(\textsc{Clique} = \\{\langle G,k \rangle \mid G \text{ is an undirected graph with a k-clique}\\}}\\)

    É \\(\text{NP-completo}\\)

    \\(\textsc{\textbf{proof}}\\)   Data \\(\phi\\) una formula con \\(k\\) clausole del tipo

    -   \\(\phi = (a\_1 \lor b\_1 \lor c\_1) \land \cdots \land (a\_k \lor b\_k \lor c\_k)\\)

    Si definisce la riduzione \\(f\\) per cui \\(\textsc{Clique} <\_P \text{3SAT}\\)

    -   \\(f\\) genera la stringa \\(\langle G,k \rangle\\), dove \\(G\\) é un grafo non orientato
    -   i nodi di \\(G\\) sono raggruppati in \\(k\\) triplette \\(t\_1,\ldots ,t\_k\\)
    -   gli archi di \\(G\\) connettono tutti i nodi tranne:
        1.  nodi della stessa tripletta
        2.  due nodi contraddittori, come \\(x\_1\\) e \\(\overline{x\_1}\\)

    Si dimostra che \\(\phi \in \text{3SAT} \iff G\in k\textsc{-Clique}\\)
    Quindi \\(\text{3SAT} <\_P \textsc{Clique}\\)                                         \\(\blacksquare\\)

<!--list-separator-->

-  Subset-Sum

    `7.56`
    \\(\textsc{Subset-Sum} = \\{\langle S,t  \rangle \mid S = \\{s\_1,\ldots ,s\_n\\}\\) dove esistono \\(\\{y\_1,\ldots,y\_m\\}\subseteq S\\) tali che \\(\sum y\_i  = t\\}\\)

    Si dimostra facilmente che questo é \\(\textsc{np}\\) definendone un verificatore polinomiale oppure una `TM` non deterministica polinomiale che lo definisca.

    \\(\textsc{Subset-Sum}\\) é \\(\text{NP-completo}\\)

    La prova procede per riduzione polinomiale da \\(\text{3SAT}\\) a \\(\textsc{Subset-Sum}\\), convertendo elementi e strutture del problema che rappresentano variabili e clausole booleane.


### Complessitá Spaziale {#complessitá-spaziale}

`8.1`
\\(\textsc{\textbf{definition}}\\)  Data la `TM` \\(M\\) che termina sempre. Si dice _complessitá spaziale_ di \\(M\\) la funzione
\\(f: N\to N\\), dove \\(f(n)\\) é il massimo numero di celle di nastro che la \\(M\\) passa su un qualsiasi input di lunghezza \\(n\\)


#### Classi {#classi}

`8.2`
\\(\textsc{\textbf{definition}}\\)  Data \\(f: N\to R^+\\). Le _classi di complessitá spaziale_ \\(\textsc{space}(f(n))\\) e \\(\textsc{nspace}(f(n))\\), sono definiti come:

-   \\(\textsc{space}(f(n)) = \\{L\mid L\\) é decidibile da una TM deterministica in spazio \\(O(f(n))\\}\\)
-   \\(\textsc{nspace}(f(n)) = \\{L\mid L\\) é decidibile da una TM non deterministica in spazio \\(O(f(n))\\}\\)

\\(\textsc{\textbf{definition}}\\)  \\(\textsc{pspace}\\) é la classe di linguaggi che sono decidibili in spazio polinomiale da una `TM` deterministica

-   \\[\textsc{pspace}=\bigcup\_k\textsc{space}(n^k)\\]

Da `8.5` segue che \\(\textsc{pspace} = \textsc{npspace}\\)

In sommario:

-   \\(\textsc{p} \subseteq\textsc{np} \subseteq\textsc{pspace} =\textsc{npspace} \subseteq \textsc{exptime}\\)

Questo perché:

-   \\(\textsc{np} \subseteq \textsc{npspace}\\) in quanto una macchina in \\(f(n)\\) passi puó esplorare al massimo \\(f(n)\\) celle di memoria
-   \\(\textsc{pspace}\subseteq\textsc{exptime}\\), una machina in \\(\textsc{pspace}\\) puó eseguire passi senza ripetersi al massimo
    -   \\[f(n)\cdot 2^{O(f(n))} = \bigcup\_k \textsc{time}(2^{n^k)\\], dopo di che é in loop

![](~/org/media/img/complexity-classes.jpg)
Qualsiasi di queste inclusioni potrebbero essere eguaglianze, ma non sono state trovate prove a riguardo.

Inoltre si definiscono le classi sottolineari:
\\[\textsc{L} = \bigcup\_k \textsc{space}(\log n) \\]
\\[\textsc{NL} = \bigcup\_k \textsc{nspace}(\log n) \\]

E si dimostra:
\\(\textsc{l} \subseteq\textsc{nl} \subseteq \textsc{p} \subseteq\textsc{np} \subseteq\textsc{pspace} =\textsc{npspace} \subseteq \textsc{exptime}\\)


#### Teorema di Savitch {#teorema-di-savitch}

`8.5`
Per qualsiasi funzione \\(f: N \to R^+\\), dove \\(f(n) \ge n\\),

-   \\(\textsc{nspace}(f(n))\subseteq \textsc{space}(f^2(n))\\)

Il passaggio da non determinismo a determinismo per il tempo é piú impegnativo che per lo spazio, lo spazio é piú potente in quanto puó essere riutilizzato, al contrario del tempo.

-   l'equivalente deterministico di una macchina non deterministica polinomiale ha:
    -   Tempo \\(2^{O(n^k)}\\)
    -   Spazio \\(O(n^2)\\)

Da questo teorema segue che \\(\textsc{PSPACE} =  \textsc{NPSPACE}\\) in quanto il quadrato di un polinomiale é ancora polinomiale.


#### GG {#gg}

Gioco Generalizzato della Geografia

-   il gioco consiste nel spostarsi in un grafo i cui nodi sono nomi di cittá
-   gli archi vanno da un cittá il cui nome finisce con una certa lettere a un nodo/cittá che inizia per data lettera
-   ci sono due giocatori che partono da una data cittá
-   a turno scelgono un arco da percorrere, perde chi non puó scegliere un arco entrante in un nodo giá visitato

Si dimostra che \\(\textsc{gg}\\) é \\(\textsc{pspace}\\) definendo una funzione ricorsiva detta di Von Neumann \\(\text{VonN}(a,X,g)\\) una volta fissato il grafo \\(G\\)

-   vero se esiste una strategia vincente a partire da \\(a\\) per il giocatore \\(g\\), che porta quindi ad una configurazione in cui non esiste una mossa \\(b\\) per il giocatore \\(\lnot g\\) che non violi le regole

Altro risultato della teoria é che \\(\textsc{gg}\\) é \\(\textsc{pspace}\text{-completo}\\), quindi se si scoprisse un algoritmo in tempo polinomiale che risolva \\(\textsc{gg}\\) questo dimostrerebbe che:

-   \\(\textsc{P = NP = PSPACE = NPSPACE}\\).

In quanto per il teorema di `Savitch` \\(\textsc{NPSPACE = PSPACE}\\).

Questa ipotesi é ritenuta improbabile, anche se non si puó escludere.