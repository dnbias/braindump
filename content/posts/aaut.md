+++
title = "Apprendimento Automatico"
author = ["Daniel Biasiotto"]
date = 2022-09-21T20:39:00+02:00
tags = ["university", "master", "ai"]
draft = false
+++

-   Prof. Roberto Esposito, Prof.ssa Rosa Mao
-   Peter Flach, _Machine Learning_, Cambridge University Press
-   Mitchell, _Machine Learning_


## Ingredients of ML {#ingredients-of-ml}

-   componenti necessari per la materia di studio
-   Tasks
    -   classificazione
    -   regressione
    -   stima probabilistica
    -   clustering
        -   capire la struttura dei dati
        -   puo' anche essere un primo passo verso la classificazione
-   Modelli
    -   lineare
    -   alberi di decisione
    -   **naive bayes**
    -   `KNN`
-   Features
    -   numeriche
    -   categoriche
    -   costruzione
    -   selezione

Per predire la classificazione si cerca una \\(f(x)\\) che date le features in input restituisca in output la classificazione che ci si aspetta dal learning set.

In un modello lineare abbiamo una _retta_ che <span class="underline">divide in un piano</span> le entita' che appartengono a una categoria da quelli che non le appartengono

> Machine learning is the systematic study of algorithms and systems that improve their knowledge or performance with experience.

I task sono risolti dai modelli, i problemi di apprendimento sono risolti da algoritmi che _producono_ modelli.


## Tasks {#tasks}

-   predittivo, l'obiettivo e' predirre una classificazione
-   descrittivo, cerco informazioni in piu' sulla struttura del dataset
-   classificazione binaria o multi-classe
-   regressione, versione non discreta della classificazione
-   clustering, target nascosto

Il `ML` puo' essere supervisionato o meno, quindi con etichette conosciute nel _learning set_


### Predictive ML {#predictive-ml}

-   input: dataset con le etichette assegnate
-   cerchiamo un algoritmo di apprendimento che possa indurre un modello che riesca a fare predizioni su proprieta' in particolare degli esempi

Dipendentemente dalle etichette a da che proprieta' cerchiamo di approfondire e' possibile distinguere in:

-   ranking
-   scoring
-   probability estimation
-   regression


### Classification {#classification}

Un classificatore e' un mapping:
\\[\cap c: X \to C\\]
dove \\(C = \\{ C\_{1} , \cdots , C\_{k} \\}\\)

\\(\cap c\\) e' una approssimazione della reale (e sconosciuta) funzione \\(c\\).

-   e' possibile che un'istanza \\(x\\) sia contaminata da rumore


### Descriptive {#descriptive}

In questo tipo di apprendimento il task e il problema di apprendimento coincidono

-   si cerca di definire i dati per poterne avere una panoramica ad alto livello


### Unsupervised {#unsupervised}

Non si forniscono etichette associate ai dati, il task consiste anche di individuare etichette quando necessario.

-   predictive clustering
-   descriptive clustering
    -   non vogliamo definire classi specifiche per i dati


### Clustering {#clustering}

Si cercano regolarita' nei dati attraverso raggruppamenti di dati

-   predittivo prende in input tutti i dati possibili, problema piu' difficile
-   descrittivo prende in input solamente il dataset su cui e' stato addestrato, non va a generalizzare oltre


### Subgroup Discovery {#subgroup-discovery}

Dato un dataset si cerca una funzione che lo mappi a `true` o `false`.

-   si cerca un funzione tale per cui la distribuzione di `true` sia marcatamente differente dalla popolazione originale

Generalmente gli algoritmi sono guidati da misure di valutazione per cui

-   preferiscono sotto gruppi piu' grandi
-   solitamente sono simmetrici, restituiscono in genere lo stesso valore per il sottogruppo e il suo complemento, puo' essere un difetto


### Association Rules {#association-rules}

Si cerca un insieme di regole di associazione che quando vale un antecedente predefinito valgano a loro volta.
Il problema e' difficile perche' ci sono \\(2^{n}\\) sottoinsiemi di cui valutare la frequenza.
Una volta individuati i sottoinsiemi frequenti si creano le regule di associazione e le si valuta.


#### Binary Classification {#binary-classification}

-   **feature tree**, diverso dal **decision tree** in quanto nelle foglie ci sono esempi e non regole
-   costruendo con gli esempi il feature tree e gli insiemi nelle foglie posso procedere assegnando una classificazione a ciascuna foglia
    -   solitamente si procede ad assegnare come etichetta quella maggiormente rappresentata osservando le etichette degli esempi del _training set_

Apprendere un classificatore significa costruire la funzione \\(\cap c\\) in modo che approssimi al meglio \\(c\\) su tutto il set \\(X\\) e non solo quello \\(x\\) del training set.

-   un esempio e' una coppia di un'istanza \\(x\\) e della sua reale classe \\(c(x)\\)
-   fatto questo si puo' valutare l'accuratezza, calcolata sul training set
    -   questa misura puo' essere fuorviante
    -   generalmente l'accuracy decresce al di fuori del training set
    -   per questo il dataset viene diviso in training set e test set per evitare bias
        -   il bias sul test set e' l'opposto, abbiamo un bias in difetto
        -   quando il test set viene riutilizzato per un nuovo addestramento il modello migliorera' e quindi le stime precedenti saranno in difetto

<!--list-separator-->

-  Contingency Table

    Tavola in cui vengono riportati

    -   true positives
    -   false negatives
    -   false positives
    -   true negatives

    Contiene anche informazioni sui positivi e negativi del set.

    Con questa tabella possono essere calcolate varie misure di **performance**:

    -   `TP`
    -   `TN`
    -   `FP`
    -   `FN`
    -   Proporzione di positivi
    -   Proporzione di negativi
    -   _class ratio_
    -   _accuracy_
    -   _error rate_
    -   _true positive rate_, _sensitivity_, _recall_
        -   \\(TP/Pos\\)
    -   _true negative rate_, _specificity_
        -   \\(TN/Neg\\)
    -   _precision_, _confidence_
        -   \\(TP/(TP+FP)\\)

    Classificatore troppo specifico significa _recall_ bassa, troppo generale significa _precision_ bassa.

<!--list-separator-->

-  Coverage Plot

    Sulle assi `TP` e `FP`

    -   i classificatori che si posizionano sulla diagonale mediana sono i peggiori
    -   in alto a sinistra `ROC` heaven
    -   in basso a destra `ROC` hell

    L'accuratezza e' la stessa per classificatori che giacciono su una stessa linea con pendenza 1
    Punti sulla una linea parallela alla diagonale principale (pendenza \\(Pos/Neg\\)) hanno la stessa _average recall_

    -   \\(\frac{(TP/Pos)+(TN/Neg)}{2}\\)

<!--list-separator-->

-  Roc Plot

    Gli assi vengono normalizzati, percentuale di `TP` e `FP`

    -   tpr - true positive rate
    -   fpr - false positive rate

    Lo spazio di rappresentazione viene schiacciato in un quadrato, percio' le pendenze delle rette cambiano di conseguenza.
    Per l'accuracy la pendenza delle rette diventa \\(Neg/Pos\\)
    Per la avr recall la pendenza diventa 1

    Gli errori sulle classi possono avere pesi diversi, questo puo' essere manipolando cambiando il ratio tra `FP` e `FN`.

<!--list-separator-->

-  Scoring Classifier

    Una mappa:
    \\[s : X \to R^{k}\\]

    Gli score sono misure di confidenza del classificatore, le etichette nel dataset rimangono le classi.

    Il **margine** e' una misura di confidenza, considerando \\(c(x)\\) +1 per esempi positivi, -1 per esempi negativi:

    -   \\(z(x) = c(x) \cap s (x)\\)

    E' desiderabile premiare grossi margini positivi e penalizzare grossi margini negativi.
    Questo lo si ottiene con una **loss function**:
    \\[L : R \to [0, \infty )\\]

    -   mappa ogni margine dell'esempio \\(z(x)\\) con a un valore di **loss**

    In molti casi l'apprendimento e' posto come un problema di ottimizzazione di <span class="underline">minimizzazione della funzione di loss</span>.
    Ce ne sono di diverse:

    -   0-1 Loss
    -   Hinge Loss
    -   Logistic Loss
    -   Exponential Loss
    -   Squared Loss

    Il **ranking** e' indotto naturalmente dalla funzione di scoring

    -   il **ranking error rate** viene definito tra tutte e coppie positivo-negativo
        -   si controlla se si sta dando un ranking errato (positivo con ranking minore del negativo) con 1 punto di penalita', mezzo punto in caso di ranking uguale
        -   matematicamente si sta calcolando l'area al di sotto della curva `roc`
        -   un **ranking error** di 1 significa che si e' sbagliato tutto

<!--list-separator-->

-  Class Probability Estimation

    Classificatore di scoring che mappa:
    \\[p: X \to [0,1]^{k}\\]

    Assegnamo classe positiva se la probabilita' calcolata e' maggiore di 0.5 e viceversa per i negativi.
    L'**errore quadratico**:
    \\[SE(x) = \frac{1}{2} || p(x) - I(x) ||\_{2}^{2}\\]
    Questo errore si puo' calcolare su tutti gli esempi con la media aritmetica

    E' spesso una buona idea eseguire uno _smoothing_ delle frequenze relative, il modo piu' comune per farlo e' la **Laplace correction**
    \\[p\_{i} = \frac{n\_{i} + 1}{|S| + k}\\]


#### Beyond Binary {#beyond-binary}

Per costruire un classificatore multiclasse si possono integrare piu' classificatori binari:

-   one-vs-rest unordered
-   one-vs-rest sequenziale
-   one-vs-one simmetrico
-   one-vs-one asimmetrico
    -   i classificatori votano (+1 o -1) la classe che assegnano

**NB** **one-vs-rest** ha il problema che sbilanciano il dataset anche se inizialmente questo era bilanciato prendendo in considerazione tutte la classi. Gli schemi **one-vs-one** hanno il problema di avere dataset molto piccoli in caso i dati siano pochi di partenza.

Ci sono 4 configurazioni delle matrici di assegnazione della classe e 4 configurazioni per i classificatori.

-   le matrici indicano sulle colonne le configurazioni utili per l'apprendimento, ogni colonna indica un classificatore, sulle righe le configurazioni utili per la classificazione
    -   colonne - classificatori
    -   righe - classi

I punti piu' vicini al confine tra una classe e l'altra sono i piu' difficili da classificare e quelli per cui e' piu' probabile che i classificatori siano in conflitto.

-   in casi del genere e' possibile per i classificatori anche astenersi

Per giungere alla classificazione si passa per il **output-code decoding**:

-   si costruisce un vettore \\(w\\) contenente l'output di tutti i classificatori costruiti
-   la classe di output e' quella la cui riga e' la piu _vicina_ a \\(w\\)
    -   \\(d(w,c)=\sum\_{i}(1-c\_{i}w\_{i})/2\\)
    -   se discordi si assegna una penalita' di 1

Se si notano conflitti tra due classi si puo' fare una soluzione ibrida aggiungendo classificatori one-vs-one tra queste classi per risolvere i possibili conflitti.

-   e' anche possibile aggiungere una misura di confidenza con dei pesi ', nel caso in cui il classificatore sia uno **scoring classifier**


#### Regressors {#regressors}

La classificazione si sposta in \\(R\\).
Si definiscono funzioni di approssimazione, chiamate regressori, che mappano
\\[f : X  \to R\\]
Problema di regressione e' l'apprendimento di un regressore a partire da coppie \\((x,f(x))\\)

-   l'overfitting nel caso della regressione puo' produrre errori molto grandi agli estremi della funzione se si cerca di passare precisamente per i punti.
-   l'alternativa e' creare una funzione costante a tratti

In entrambi i casi il numero di parametri del regressore cresce linearmente con il numero di punti.

-   questo e' un problema perche' il modello diventa sempre piu' complesso
-   con la complessita' aumenta la tendenza all'overfitting

Se i parametri sono troppo pochi pero' si tende all'underfitting ovviamente.

**Bias-Variance dilemma**

-   modelli low-complexity soffrono molto meno da varianza per cambiamenti random del training data, ma possono introdurre bias sistematico che anche una mole maggiore di dati non puo' risolvere
-   modelli high-complexity eliminano i bias ma soffrono molto errori non-sistematici causati dalla varianza


## Models {#models}

1.  geometrico, si ragiona sullo spazio del problema per risolverlo
2.  probabilistico, si cerca la probabilita' di appartenenza a una classe
    -   **Naive Bayes**, modello piu' semplice possibile: assume che le features siano indipendenti
3.  logico, i modelli sono definiti da espressioni logiche

L'obiettivo dell'apprendimento e' definire dei pesi che rendono corretta la predizione.

Se la probabilita' a priori di Y e' nota:
TODO
\\[Y\_{}\_{\text{MAP}} &= \text{arg max } P(Y|X) \\\ \text{arg max } P(Y|X)\\]

Altrimenti:


### Linear Models {#linear-models}


### Ensamble Learning {#ensamble-learning}


## Features {#features}

Strumenti con cui descriviamo gli oggetti del dominio

-   anche la granularita' con cui vengono aggregate le feature puo' cambiare la chiarezza del trend e puo' aiutare l'algoritmo di apprendimento.
-   le features possono essere mappate a nuovi spazi, semplificando lo spazio cui e' possibile applicare un modello lineare per classificarlo piu' semplicemente


## Find-S {#find-s}

1.  iniatialize \\(h\\) to most specific hypothesis \\(\in H\\)
2.  _for each_ `positive` instance \\(x\\) in training
    -   _for each_ constraint \\(a\_{i} \in h\\)
        -   if \\(a\_{i}\\) satisfied by \\(x\\), `noop`
        -   else, replace \\(a\_{i}\\) in \\(h\\) with the next most general costraint that is satisfied by \\(x\\)
3.  output hypothesis \\(h\\)

Proprieta':

-   Descrive lo spazio delle ipotesi come congiunzioni di attributi
-   restituisce l'ipotesi piu' specifica consistente con gli esempi positivi nel `TS`
-   l'output sara' consistente anche con gli esempi negativi se il concetto target e' contenuto in \\(H\\)
-   l'algoritmo non comunica se si e' arrivati al concetto obiettivo, non e' in grado di individuare se quella trovata e' l'unica possibile
-   non guardando gli esempi negativi e' possibile che non si accorga che il dataset sia inconsistente
-   l'ipotesi piu' specifica e' preferibile?
    -   maggiori vincoli vogliono dire piu' informazioni sull'ipotesi
    -   l'ipotesi piu' generale ha maggiore capacita' rappresentativa


## Version Space {#version-space}

L'output di `Find-S` e' una delle ipotesi valide consistenti con i dati

-   l'insieme di queste ipotesi e' il `Version Space`
-   l'insieme puo' essere molto grande, serve un algoritmo che non ne enumeri gli elementi
    -   rappresentazione compatta

> The **Version Space** $VS<sub>H,D</sub> with respect to hypothesis space \\(H\\) and training set \\(D\\) is the subset of hypothesis from \\(H\\) consistent with al training examples:
> \\[VS\_{H,D} = \\{h \in H | \text{Consistent}(h,D)\\}\\]

Un dataset piu' grande permette di individuare un `Version Space` piu' piccolo, eventualmente di individuare l'ipotesi corretta.

Agli estremi del `VS` si individuano due sottoinsiemi, \\(G\\) - _general boundary_ - le ipotesi piu' generali, \\(S\\) - _specific boundary_ - le ipotesi piu' specifiche. Quindi:
\\[VS\_{H,D} = \\{h \in H | (\exists s \in S)(\exists g \in G)(g \ge h \ge s)\\}\\]

-   \\(\ge\\) means `is more general or equal than`
-   questa rappresentazione e' molto piu' compatta
-   gli esempi positivi muovono \\(S\\) in basso
-   gli esempi negativi muovono \\(G\\) in alto
-   assieme queste operazioni restringono \\(VS\\)


### List-Then Eliminate {#list-then-eliminate}

1.  `VersionSpace` \\(\gets\\) lists of every hypothesis in \\(H\\)
2.  _for each_ training example
    -   remove hypothesis that are inconsistent with training example
3.  output `VersionSpace`


### Candidate Elimination {#candidate-elimination}

1.  \\(G \gets\\) maximally general hypothesis in \\(H\\)
2.  \\(S \gets\\) maximally specific hypothesis in \\(H\\)
3.  _for each_ training example \\(d = \langle x, c(x) \rangle\\)
    -   \\(d\\) positive
        -   remove from \\(G\\) hypothesis inconsistent with \\(d\\)
        -   _for each_ hipothesis \\(s \in S\\) inconsistent with \\(d\\)
            -   remove \\(s\\) from \\(S\\)
            -   add to \\(S\\) all minimal generalizations \\(h\\) of \\(s\\) such that \\(h\\) consistent with \\(d\\) and some member \\(G\\) is more general than \\(h\\)
            -   remove from \\(S\\) hypothesis more general than another member in \\(S\\), maintain _minimality_
    -   \\(d\\) negative
        -   remove from \\(S\\) hypothesis inconsistent with \\(d\\)
        -   _for each_ hypothesis \\(g \in G\\) inconsistent with \\(d\\)
            -   remove \\(g\\) from \\(G\\)
            -   add to \\(G\\) all minimal specialisations \\(h\\) of \\(g\\) such that \\(h\\) consistent with \\(d\\) and some member \\(S\\) is more specific than \\(h\\)
            -   remove from \\(G\\) hypothesis less general than another member in \\(G\\)

L'apprendimento termina individuando la singola ipotesi che descrive correttamente il concetto ricercato oppure a causa di inconsistente nel dataset lo rimuovera', convergenza all'insieme vuoto.
**L'ordine di presentazione degli esempi non e' importante per la convergenza.**


### Restringere lo spazio delle ipotesi {#restringere-lo-spazio-delle-ipotesi}

-   si cerca di chiedere esempi all'oracolo che siano il piu' informativi possibile
    -   generalmente si cerca di massimizzare il **valore atteso**
    -   si cerca di eliminare sempre meta' delle ipotesi possibili


### Biased Learner {#biased-learner}

Per la classificazione (_previsione_) di nuovi dati si va per voto

-   se tutte le ipotesi nello spazio sono tutte soddisfatte si assegna all'esempio l'etichetta positiva
    -   viceversa per il negativo
-   se le ipotesi non sono concordi nella classificazione e' da decidere come comportarsi con quell'esempio, in quanto c'e' un dubbio

Ma il nostro spazio delle ipotesi non puo' rappresentare _concept_ anche di poco piu' complessi

-   disgiunzioni ad esempio

Lo spazio delle ipotesi e' **biased**, in quanto costruito con linguaggio congiuntivo.


### Unbiased Learner {#unbiased-learner}

Si espande lo `HS` al **power set** delle features.

-   permette di esprimere un numero molto piu' grande di ipotesi
-   esprime _target concept_ in logica piu' complessa

Il problema e' che le ipotesi specifiche **S** e quelle generali **G** sono troppo specifiche o troppo generali, andando a modellare solo gli esempi nel `TS`

-   per imparare il _target concept_ sarebbe necessario presentare ogni istanza nell'insieme modellato come training example

Il **bias** quindi non e' un limite, permette di fare l'**inductive leap**. Permettendo la generalizzazione dei concetti imparati dal `TS`.


### Inductive Bias {#inductive-bias}

Il sistema di apprendimento automatico si puo' costruire come sistema induttivo **equivalente** a un sistema puramento deduttivo come un _Theorem Prover_.
Per cui il concetto rappresentato viene come conseguenza logica dalle ipotesi specifiche del _learner_.


## Tree Models {#tree-models}


### Decision Trees {#decision-trees}

Parte basata su Flach
I **feature tree** sono costruiti con degli **split nodes**

-   dove vengono eseguiti i test sulle _features_
    -   a cascata
    -   puo' essere utilizzata la **internal disjunction** per identificare i valori attribuiti a un dato _path_
-   seguendo il percorso sull'albero si riproduce uno stesso schema in linguaggio congiuntivo
-   sulle foglie si riportano i dati - numero positivi e numero negativi - che concludono a quel nodo test il path

Dato l'albero del **path** si puo' costruire un **coverage tree** riportando i risultati ottenuti dai dati.
Un albero con troppe foglie e' un albero troppo specializzato sul `TS` i.e. _overfitting_.

Per costruire nuovi alberi

-   si possono manipolare i parametri di apprendimento
-   si puo' fare pruning su alberi gia' ottenuti, accorpando diversi split-nodes in un'unica foglia

Il modello ad albero esprime una **disgiunzione** tra le foglie classificate positive

-   `DNF`[^fn:1] tra le espressioni modellate dalle foglie dell'albero
    -   e quindi ai _path_ corrispondenti

Per questi motivi i decision trees sono strettamente piu' espressivi rispetto ai concept congiuntivi.

Il **bias** e' una restrizione del linguaggio di ipotesi per scoraggiare l'overfitting/l'apprendimento di un modello troppo complesso

-   puo' essere implementato introducendo una penalita' per ogni ipotesi nella funzione obiettivo
-   nell'ottimizzazione della funzione obiettivo l'apprendimento sara' spinto ad apprendere modelli piu' semplici
    -   **Rasoio di Occam**

Concettualmente in uno split tree si partiziona il `TS` in segmenti di istanze - raccolti nelle foglie. Ogni foglia raccoglie una **estensione**, dove una **intensione** e' l'ipotesi che nell'albero porta a quel sottoinsieme di istanze.


#### Learning {#learning}

Ricerca **top-down** sui concept ricercati.

-   l'**omogeneita'** deve essere calibrata per non ricadere nell'overfitting
-   l'algoritmo e' greedy[^fn:2], ricorsivo (_divide and conquer_)

<div class="code">

GrowTree(D,F){
    if Homogeneous(D) return Label(D);
    S = BestSplit(D,F);
    _/ split D according to literals in S
    D_is = SplitIntoSubsets(D,S);
    for each D_i in D_is {
        /_ divide and conquer
        if D_i != nil T_i = GrowTree(D_i,F);
        else T_i = Leaf(Label(D_i));
    }
    return Tree(S,T_is); // root labeled w. S
}

</div>

-   `Homogeneous(D)`
-   `Label(D)`
-   `BestSplit(D,F)`

sono primitive del _tree learner_ e la loro implementazione dipende dal _task_ che va affrontato.

-   per clustering posso considerare la varianza del gruppo
-   per classificazione si considera la singola classe piu' rappresentata ad esempio

La misura della bonta' di uno split e' la **purity**
\\[p = \frac{n^{+}}{n^{+} + n^{-} }\\]
L'inpurezza puo' essere usata come indicatore sul quando smettere di fare split sul segmento - decidendolo omogeneo.

-   **minority class**: \\[\min \\{p, 1-p\\}\\] oppure \\[1 - \max \\{p\_{i}\\}\\]
-   **gini index**: \\[2p(1-p)\\] oppure \\[\sum\_{i} p\_{i}(1-p\_{i})\\]
-   **entropy**
    -   \\[-p \cdot \log\_{2}(p) - (1-p) \cdot \log\_{2} (1-p)\\]
    -   \\[- \sum\_{i} p\_{i} \cdot \log\_{2} (p\_{i})\\]
    -   l'entropia e' una misura della confusione
    -   e' misurata in **bits**, quantifica il numero di bit necessarie a rappresentare l'informazione

L'impurita' di una singola foglia:
\\[Imp(\\{D\_{1}, \cdots, D\_{l}\\}) = \sum\_{j=1}^{l} \frac{|D\_{j}|}{|D|} Imp(D\_{j})\\]


#### BestSplit {#bestsplit}

> Splits dataset \\(D\\) in subsets \\(D\_{i}\\) according to literals in \\(S\\).

Si considerano per ogni feature i sottoinsiemi possibili, ne si calcola l'impurezza per ogni sottoinsieme dei valori.

Utiliziamo la `empirical probability`:
\\[Imp(\\{D\_{1}, \cdots, D\_{l}\\}) = \sum\_{j=1}^{l} \frac{|D\_{j}|}{|D|} Imp(D\_{j})\\]

-   valore atteso a valle dello _split_, una media pesata seconda la probabilita' della configurazione
-   si utilizza come \\(Imp\\) l'entropia \\(H\\) o qualche altro indicatore

L'algoritmo valuta esaustivamente tutte le possibilita' e minimizza l'incertezza attesa.

```text
BestSplit-Class(D,F)
Input: data D; set of features F
Output: feature f to split on
I_min \gets 1;
for each f \in F do
    split D into subsets D_1,...,D_l according to values v_j of f;
    if Imp({D_1,...,D_l}) < l_min then
        I_min \gets Imp();
        f_best \gets f;
    end
end
return f_best
```
<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 1:</span>
  greedily find the best split for a decision tree
</div>


### Ranking Trees {#ranking-trees}

_and probability estimation trees_

Il ranking se non é gia specificato puó essere creato tra le foglie come quello specificato da ciascuna **probabilità empirica**

-   questa é una funzione monotona essendo coefficiente angolare del `ROC` plot del modello
-   la curva del `ROC` é **convessa**, una volta ordinati i segmenti secondo la _empirical probability_

Con \\(n\\) foglie e un problema di etichettatura binario (+ e -) si hanno \\(2^n\\) possibili etichettature delle foglie. Ci sono \\(n!\\) ordinamenti (o _path_).

I costi sono utili per correggere l´apprendimento e vengono associati a `FN` e `FP`.

-   _misclassifying costs_

Definiamo il _cost ratio_ atteso:
\\[c = \frac{c\_{FN} }{c\_{FP}}\\]
ovvero il costo di **misclassificazione di un positivo** in proporzione al costo di **misclassificare un negativo**.

Al crescere di \\(c\\) diventa conveniente predire +

-   ci si sbilancia completamente verso la classe positiva

Viceversa per la classe negativa al diminuire di \\(c\\).

Si possono equiparare costi e frequenze: le frequenze nelle foglie andranno moltiplicate per i relativi costi.
\\[\frac{n\_{i}^{-}} \cdot\frac{}{}\\]

Attraverso la _class distribution_ é possibile trasformare un **feature tree** in

-   **ranking tree**, ordinando le foglie secondo le _empirical probabilities_
-   **probability estimator**, che predica la _empirical probability_ in ciascuna foglia applicando **Laplace** o **m-estimate smoothing**
    -   aggiungendo degli _pseudo-conteggi_ per rafforzare la stima
-   **classifier**, scegliendo le condizioni operazionali come conseguenza di _class ratio_ \\(clr = \frac{Pos}{Neg}\\) e _cost ratio_ \\(c = \frac{c\_{FN}}{c\_{FP}}\\)
    -   si trova una soglia per la _empirical probability_ che discrimini positivi e negativi
        -   **operating point / decision threshold**
    -   \\[\frac{clr}{c}\\], coefficiente angolare nello spazio `ROC` di una **isometrica di average recall**
        -   l'intersezione tra l'isometrica e la curva nel `ROC` plot individua l'operating point
        -   le foglie prima del `OP` predirranno positivo, le altre negativo
            -   una volta scelte si fa _pruning_ efficientando l'albero
            -   il _pruning_ diminuisce l'area sottostante la curva (minore precisione), quindi sarebbe peggiore ai fini di ranking, rimane migliore per la classificazione


#### Underfitting e Overfitting {#underfitting-e-overfitting}

Per valutare il modello si comparano accuratezza sul `Training Set` e sul `Test Set`, dove la prima é una stima ottimistica.
![](/ox-hugo/overfitting-and-underfitting.png)

Il `best fit` si individua alla complessità a cui le prestazioni sui due set divergono.

-   si aggiungono _penalty_ ad ogni nodo foglia aggiunto spingendo l'apprendimento verso una minore complessità
-   non si vuole arrivare all'estremo in cui non ci sono arrori sul `Training Set`

Nel _pruning_ si utilizza un'altra partizione del dataset chiamata `Pruning Set` per validare il modello.

Un'alternativa alla tecnica del **reduced error pruning** é la stima direttamente sul `Training Set` dell'errore di generalizzazione.

-   si aggiunge una penalitá \\(k\\)
-   errore sul training: errore di risostituzione \\[\sum^{N}\_{i=1} e\_{i}\\]
-   errore sul testing: errori di generalizzazione \\[\sum^{N}\_{i=1} e\_{i}' \\]


#### Sensibilitá delle misure di impurezza {#sensibilitá-delle-misure-di-impurezza}

\\(H\\) e \\(\text{Gini}\\) sono sensibili alla \\(clr\\), la misura \\(\sqrt{\text{Gini}}\\) é piú resistente/stabile alla \\(clr\\).

-   le prime sono sensibile a fluttuazioni nella distribuzione delle classi
-   la **artificial inflation** puó sostituire una valutazione del modello che sia sensibile ai costi
    -   si sovracampiona di un fattore \\(c\\) la classe positiva/negativa in base a che \\(clr\\) si desidera
    -   l'_oversampling_ aumenta i tempi di training


### Learning as Variance Reduction {#learning-as-variance-reduction}


## Cross-Validation {#cross-validation}

Si divide il `dataset` in tutte le maniere possibili per individuare `LS` e `TS` e migliorare il modello.
Si cerca di predire la **probabilitá di corretta previsione** (`PCP`) \\(\alpha\\).

-   rapporto tra esempi su cui il modello ha una corretta previsione sul totale degli esempi
    -   questa é una _stima_ della `PCP` reale - ignota - sulla popolazione
    -   simile all'_empirical probability_

La distribuzione di probabilitá é una binomiale il cui picco sará il numero atteso piú probabile di successi.
La **varianza** della curva é legata all'errore atteso
\\[\alpha(1-\alpha)n\\]

La `CV` cerca di suddividere il dataset utilizzando tutti gli esempi sia per `LS` sia per `TS`

-   \\(n\text{-fold}\\) Cross Validation
-   si apprendono \\(n\\) modelli quante sono le **partizioni** del `dataset` e vengono testati altrettante volte, ciclando la partizione utilizzata per il _training_

Per ogni modello si stima \\(\alpha\\) e se ne fa la media.

\\[\text{Var}(Y) = \frac{1}{|Y|}\sum\_{y \in Y} (y - \overline y)^{2}\\]
La varianza puó essere utilizzata per valutare l'incertazza della stima della variabile tanget in un task di **regressione**.

L'algoritmo `GrowTree` andrebbe cambiato per task di regressione reimplementando le funzioni

-   `BestSplit` utilizzando \\(\text{Var}\\) al posto di \\(\text{Imp}\\)
-   `Label` che restituisca il valore medio del target nella foglia
-   `Homogenous` che restituisca `true` se la varianza del target é minore di un dato _threshold_

[^fn:1]: Disjunctive Normal Form
[^fn:2]: non riconsidera le sue decisioni una volta prese
