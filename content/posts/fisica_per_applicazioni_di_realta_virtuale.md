+++
title = "Fisica per Applicazioni di Realtà Virtuale"
author = ["Daniel Biasiotto"]
date = 2023-12-05T05:51:00+01:00
tags = ["master", "university"]
draft = false
+++

-   Professore: Matteo Brogi


## Introduzione {#introduzione}

Fisica:

-   studio dei fenomeni naturali
-   attraverso la misura delle grandezze fisiche
    -   con evidenza sperimentale, determina se il _modello_ è inadeguato o meno

In antichità fisica e filosofia confluivano in un unica disciplina, con la prima rivoluzione scientifica del XVI-XVII secolo le due discipline vengono distinte.
Si definisce il metodo scientifico con la fisica classica.

-   descrive bene la realtà  alle scale abituali

La necessità di descrivere fenomeni macro e microscopici porta alla seconda rivoluzione scientifica del XIX-XX secolo.

-   contrasta con l'intuizione ma permette il progresso tecnologico
-   li metodo rimane lo stesso ma:
    -   la misura può essere distruttiva
    -   certi sistemi vanno descritti stocasticamente


### Cifre Significative e Decimali {#cifre-significative-e-decimali}

-   significative, numero di cifre che compongono il numero
    -   gli zeri all'inizio non si contano
-   decimali, numero di cifre dopo la virgola
-   le cifre tranne l'ultima sono _certe_, l'ultima è _incerta_

Da qua si fonda la **teoria degli errori**.


## Cinematica {#cinematica}

Studio di punti materiali, senza dimensione, senza studio della causa del moto.

-   velocità media
-   velocità istantanea, derivata prima dello spostamento
-   accelerazione media
-   accelerazione istantanea, derivata prima della velocità, derivata seconda dello spostamento


### Moto Rettilineo Uniforme {#moto-rettilineo-uniforme}

-   velocità costante

\\[x = x\_0 + vt\\]


### Moto Rettilineo Uniformemente Accelerato {#moto-rettilineo-uniformemente-accelerato}

-   accelerazione costante

\\[x = x\_0 + vt\\]
\\[v = v\_0 + at\\]
\\[v=\frac{v\_0+v}{2}\\]
\\[x=x\_0 + v\_0t+\frac{1}{2}at^2\\]
\\[v^2 =v\_0^2+2a\Delta x\\]


### Cinematica Bidimensionale {#cinematica-bidimensionale}

-   non basta la descrizione scalare
-   moto in \\[R^2\\]
-   spostamento come differenza vettoriale
-   versori cartesiani in ogni punto della traiettoria
    -   /hat{u}_T, tangente
    -   /hat{u}_N/], perpendicolare

Sia accelerazione che velocità sono scomponibile in queste componenti in ogni istante.
L'accelerazione tangenziale varia il modulo della velocità e quella normale varia la sua direzione.


### Moto parabolico {#moto-parabolico}

Moto composto di un moto uniforme e uno uniformemente accelerato.
\\[y = (\tan \theta\_0) x - (\frac{g}{2v\_{0}^2 \cos^2 \theta\_0}) x^2\\]


### Moto Circolare Uniforme {#moto-circolare-uniforme}

In realtà accelerata, la velocità cambia di direzione per tutto il moto.
\\[a\_R = a = \frac{dv}{dt}\frac{v}{r}\frac{dl}{dt}=\frac{v^{2}}{r}\\]


### Moto Relativo {#moto-relativo}

\\[\vec{v\_{A}} = \vec{v\_{R}} + \vec{v\_{T}}\\]
Finché i moti relativi sono uniformi ogni sistema di riferimento vale l'altro.
Si definiscono rispetto i due sistemi:

-   velocità assoluta
-   ... relativa
-   ... assoluta


## Dinamica {#dinamica}

Studio del moto considerando le cause.
I punti rimangono materiali.


### Forza {#forza}

Causa delle modifiche delle caratteristiche cinematiche di un corpo.

-   forza di contatto
    -   risolta dalla meccanica quantistica come approssimazione a scala macroscopica di dinamiche di campo microscopiche
-   forza di campo


### Primo Principio {#primo-principio}

**Legge di Inerzia**

> In assenza di forze esterne, un oggetto in quiete rimane in quiete e un corpo in moto mantiene la sua velocità immutata.

-   i sistemi inerziali sono quelli in cui vale questo principio.
    -   e' necessaria una causa evidente, una forza, per causare la modifica dello stato di moto di un corpo
-   i sistemi non inerziali sono sistemi in cui e' necessario introdurre forze apparenti


### Secondo Principio {#secondo-principio}

**Legge di Newton**

> L'accelerazione di un corpo e' direttamente proporzionale alla forza risultante che agisce su di esso, ed inversamente proporzionale alla sua massa.

\\[\sum \vec{F} = m \vec{a}\\]

La **massa** (in questo contesto inerziale o _passiva_) e' una grandezza scalare, una costante di proporzionalità che lega forza ed accelerazione.
Traduce l'azione dinamica di una forza nel suo effetto cinematico.


### Terzo Principio {#terzo-principio}

**Principio di azione e reazione**

> Nell'interazione tra due corpi la forza esercitata dal corpo a sul corpo b e' uguale ed opposta a quella esercitata dal corpo b sul corpo a.

\\[\vec{F}\_{ab} = - \vec{F\_{ba}}\\]


### Forza Elastica {#forza-elastica}

**Forza di richiamo proporzionale all'elongazione**

-   base del funzionamento del **dinamometro**

Legge di **Hooke**:
\\[\vec{F}\_{el}= - K \vec{x}\\]


### Forze di Vincolo {#forze-di-vincolo}

Un vincolo è un corpo che impedisce il moto perpendicolare a esso, finché si mantiene la sua integrità strutturale.


### Forza di Attrito {#forza-di-attrito}

-   si oppone al moto
-   ha modulo proporzionale alla forza premente perpendicolare al vincolo (la forza vincolare)
-   ha direzione parallela al vincolo

Può essere _statico_ o _dinamico_. Il primo si oppone alla creazione del moto, la seconda  all continuazione del moto.

\\[F\_{fr} \le \mu\_s F\_N\\]

-   bisettrice del primo quadrante tra attrito statico e forza applicata parallela al vincolo, fino al punto di stacco

\\[F\_{fr} = \mu\_k F\_N\\]

-   forza costante che dipende solo dalla reazione vincolare
-   la forza è tangente alla traiettoria

Il comportamento dei corpi sul piano inclinato semplificato (in assenza di attrito viscoso per via dell'aria) è indipendente dalla massa. Quest'ultima viene infatti semplificata.


### Moto circolare con Attrito {#moto-circolare-con-attrito}

Forza di attrito statica sugli pneumatici sommata corrisponde alla forza centripeta del moto circolare.
Il sistema è accelerato e quindi non inerziale:

-   possono esistere cause di modifiche del moto a causa di forze _non apparenti_
    -   **forza centrifuga**
-   dal punto di vista del sistema inerziale da terra la forza centrifuga non esiste, è la tendenza secondo il principio di inerzia di seguire la tangente alla velocità

**Velocità limite**

-   mettendo a sistema la massima forza frenante dato l'attrito e la legge dinamica del moto circolare
-   relazione quadratica tra velocità massima e raggio di curva


### Gravitazione {#gravitazione}

Chiara indicazione di interazioni a distanza.

-   forza centripeta responsabile del moto dei satelliti


#### Legge di Newton della gravitazione universale {#legge-di-newton-della-gravitazione-universale}

\\[\vec{F}=-G\frac{M\_{1}M\_2}{R^2}\vec{u}\_{r}\\]

-   la massa indicata qui è la massa attiva del corpo, diversa in principio dalla massa inerziale
    -   numericamente uguali per la costante di accoppiamento \\[G=6.67\cdot10^{-11} NM^{2} /Kg^{2}\\]
        -   misurata sperimentalmente con la bilancia di **Cavendish**, torsione lineare rispetto alla forza applicata
-   l'attrazione non è mai nulla, serve una distanza infinita affinché lo sia


#### Leggi di Keplero {#leggi-di-keplero}

1.  tutti i pianeti si muovono  su ordite ellittiche piane, il Sole occupa uno dei fuochi dell'orbita
2.  velocità aereolare è costante
    1.  quindi l'oggetto vicino al fuoco ha velocità maggiore mentre quando si allontana rallenta
3.  il quadrato del periodo orbitale del pianete è proporzionale al cubo del semiasse maggiore dell'orbita ellittica
    1.  \\[T^2 \propto R^3\\]


### Principio di Equivalenza {#principio-di-equivalenza}

Sistema Inerziale: i principi di riferimento inerziali l'un l'altro non sono differenziabili l'un l'altro osservando gli effetti delle forze nei sistemi.

**I fenomeni dinamici e i fenomeni gravitazionali non possono essere differenziati dall'interno di un sistema non inerziale.**

-   non è possibile discriminare la causa di non inerzialità di un sistema


## Lavoro e Energia {#lavoro-e-energia}

A partire dal Lavoro si definisce l'Energia


### Lavoro {#lavoro}

_Prodotto scalare tra la forza applicata e lo spostamento effettuato._
_Prodotto del modulo dello spostamento per la componente della forza parallela allo spostamento stesso._

In caso di forza variabile è definito con l'integrale e l'area sottesa da \\[F\\] sulla distanza \\[d\\].

-   \\[W = \int\_{d\_A}^{d\_B}\vec{F}(x) \cdot d\vec{x}\\]


### Energia {#energia}

_La capacità di compiere lavoro._


#### Teorema delle Forze Vive {#teorema-delle-forze-vive}

Definita tramite leggi di Newton e moto rettilineo:
\\[d = \frac{1}{2} mv\_2^2 - \frac{1}{2}  mv\_1^2\\]
\\[K = \frac{1}{2} mv^2\\]
\\[W = \Delta K = K\_{fin} - K\_{iniz}\\]

_Il lavoro totale applicato sul corpo è uguale alla variazione di energia cinetica._

**NB**: non ci sono ipotesi restrittive sulle forze in gioco, il teorema vale generalmente per ogni forza.


#### Forze conservative e non conservative {#forze-conservative-e-non-conservative}

-   conservative: il lavoro non dipende dal percorso, ma solo dal punto di partenza e di arrivo
-   non conservative: il lavoro dipende dal cammino percorso, e non solo dai punti di partenza e  arrivo (i.e.  forze dissipative)


#### Energia Potenziale Gravitazionale {#energia-potenziale-gravitazionale}

_Potenziale capacità di compiere lavoro che un corpo ha in virtù della sua posizione._

\\[U(y) = mgy + U\_0\\]
Se la forza è conservativa: \\[W = -\Delta U = U\_i - U\_f\\]


#### Energia Potenziale Elastica {#energia-potenziale-elastica}

\\[U(x) = \frac{1}{2}Kx^2 + U\_0\\]


#### Conservazione dell'energia totale meccanica {#conservazione-dell-energia-totale-meccanica}

Quindi nel caso di forze conservative:
\\[ W = \Delta K = -\Delta U\\]
\\[ \Delta K + \Delta U = 0\\]

Questo perché le energie potenziali sono definito solo per le forze conservative.


### Potenza {#potenza}

La derivata del lavoro.
_Misura quanto rapidamente venga compiuto un lavoro._
\\[P = \frac{dW}{dt} = \vec{F}\vec{v}\\]
\\[\overline{P} = \frac{W}{\Delta t}\\]


### Legame tra forza ed energia {#legame-tra-forza-ed-energia}

\\[F\_x = - \frac{dU}{dx}\\]
\\[\vec{F}(x,y,z) = - \vec{\nabla U} = - \frac{\delta U}{\delta x} \vec{i}- \frac{\delta U}{\delta y} \vec{j}- \frac{\delta U}{\delta z} \vec{k}\\]

-   l'integrale diventa gradiente sulle tre dimensioni
-   superficie  equipotenziale: luogo dei punti aventi la  stessa energia potenziale
-   forza \\(F\\) sempre perpendicolare alle superfici equipotenziali

La forza è la derivata dell'energia potenziale, quindi un punto di equilibrio in cui la risultante delle forze è nulla indica un punto di **massimo** o **minimo** dell'energia.

-   equilibrio instabile: massimo dell'energia potenziale, forza repulsiva
-   equilibrio stabile: minimo dell'energia potenziale, forza di richiamo
-   equilibrio indifferente: energia potenziale costante, forza nulla


### Oscillatore Armonico {#oscillatore-armonico}


#### Moto armonico semplice {#moto-armonico-semplice}

oscilla senza dipendere dalla ampiezza


#### Moto armonico forzato {#moto-armonico-forzato}

Non dipende dalla forza costante applicata per produrre l'allungamento iniziale.
L'unico effetto del moto armonico forzato è quello di spostare il punto di equilibrio iniziale.
\\[\sum F = 0 = mg - Kx\_0\\]

Nuova posizione di equilibrio data da un allungamento pari a:
\\[ x\_0 =\frac{mg}{K}\\]
Da qui se si genera un moto armonico valgono le stesse leggi del **moto armonico semplice**.


#### Il Pendolo {#il-pendolo}

Moto armonico piano.
Una massa appesa a un vincolo.
\\[\theta = \theta\_{max} \cos (\omega t)\\]
\\[ \omega = \sqrt{\frac{g}{T}}\\]
\\[ T = \frac{2\pi}{\omega} = 2\pi \sqrt{\frac{L}{g}}\\]

-   non dipenda da massa e posizione del pendolo

Il Pendolo di Foucault dimostra la rotazione terrestre in quanto non ci sono forze altrimenti in gioco per modificare il piano.


### Quantità di moto {#quantità-di-moto}

\\[\vec{p} = m \vec{v} [kg m s^{-1}]\\]
Compare nella vera formulazione della legge di Newton, in caso di massa non costante:
\\[\sum \vec{F} = \frac{d\vec{p}}{dt}\\]

Da questa formulazione si ottiene la legge di conservazione della quantità di moto:
\\[\sum \vec{F} = \vec{0} \implies \vec{p}= const\\]


### Impulso {#impulso}

Strumento per lavorare senza conoscere esattamente le forze:

-   una forza che agisce in un tempo breve rispetto al tempo caratteristico del sistema
-   ad esempio negli eventi cosmologici i tempi caratteristici sono molto grandi

\\[\vec{I}=\int^{t\_f}\_{t\_i} \vec{F}dt [N s]\\]
Teorema dell'impulso:
\\[ \vec{I} = \Delta \vec{p} \\]
Forza media (dal teorema della media in analisi)
\\[\vec{I} = < \vec{F}> \Delta t\\]

-   modo di misurare la forza media semplicemente misurando la quantità di moto iniziale e finale


## Dinamica dei Sistemi {#dinamica-dei-sistemi}

Si cominciano a considerare i corpi aventi una dimensione e quindi anche una rotazione.


### Moto Traslazione {#moto-traslazione}


#### Centro di Massa {#centro-di-massa}

Abbiamo un sistema di corpi puntiformi e definiamo il `CM` come media delle posizioni di questi punti pesata dalle loro masse.
\\[\vec{x}\_{CM} = \frac{\sum\_{i} m\_i \vec{x\_{i}}{M}}\\]

È il punto che permette di fattorizzare il moto rotatorio e traslazionale del sistema a una rotazione del `CM` e una traslazione del `CM`.
Come se il moto agisse su un singolo punto con la stessa massa e stesse forze esterne.

Il `CM` descrive completamente il moto traslazionale. Il moto è direttamente correlato alla forza risultante sul sistema. Solamente alla risultante alle forze esterne in quanto le forze interne si annullano a coppie.

\\[M\vec{v}\_{CM} = \sum\_i m\_i \vec{v\_{i}}\\]

-   quindi la quantità di moto totale del sistema


#### Seconda legge di Newton per sistemi materiali {#seconda-legge-di-newton-per-sistemi-materiali}

Per la terza legge della dinamica le forze interne è per definizione nulla.

-   si annullano a coppie
-   non sono in grado di modificare la traslazione, al massimo la rotazione


#### Baricentro {#baricentro}

Punto di azione della risultante della forza di gravità applicata.
Il baricentro e il centro di massa corrispondono solo se il campo gravitazionale è uniforme.


#### Corpo Umano {#corpo-umano}

-   normalizzato, tutte le misure sono relative a 100
-   si moltiplicano tutte le grandezze in tabella per l'altezza in metri


#### Massa Variabile {#massa-variabile}

\\[\vec{R}\_{EXT} = M \frac{d\vec{v}}{dt}} + ( \vec{v} - \vec{u} ) \frac{dM}{dt}\\]

Nel caso del razzo, considerando la definizione di velocità relativa per il gas espulso dal razzo:
\\[M \frac{d\vec{v}}{dt} = \vec{R}\_{EXT} + \vec{v\_{rel}} \frac{dM}{dt}\\]

-   il secondo membro a destra è la forza di **spinta**, costante
-   \\[\vec{v}-\vec{u} = - \vec{v\_{rel}}\\]
    -   questa velocità dal sistema del razzo è costante

Se il moto è rettilineo:
\\[M \frac{dv}{dt} = - v\_{rel} \frac{dM}{dt}\\]
Partendo da questa equazione, integrando e risolvendo l'equazione differenziale si ottiene la relazione tra Massa iniziale, finale e velocità iniziale e finale.
\\[\frac{M\_{f}}{M\_0} = e^{\frac{-v\_{f}}{v\_{rel}}}\\]

Il moto non è uniformemente accelerato in quanto al massa diminuisce sempre di più mentre la forza di spinta è costante.


### Moto Rotatorio {#moto-rotatorio}

La velocità angolare è indipendente dalla distanza dal centro, da questa si definisce l'accelerazione angolare.
Questa accelerazione tangenziale si aggiunge all'accelerazione radiale centripeta.

\\[a\_{tan} = r  \dotted{\theta}\\]

C'è una mappatura logica tra **leggi cinematiche** del moto traslatorio e quello rotatorio.
Le variabili si mappano una nell'altra lasciando le formule le stesse.

Dove \\(\theta\\) è l'angolo percorso in radianti:
\\[ w = w\_0 + \alpha t\\]
\\[ \theta = w\_0 t + \frac{1}{2}\alpha t^2\\]
\\[ w^2 = w\_0^2 + 2 \alpha \theta\\]
\\[\overline{w} = \frac{w+w\_{0}}{2}\\]
Con &alpha; costante.


#### Attrito {#attrito}

-   mancanza di attrito
    -   l'oggetto non può rotolare,  può solo scivolare
    -   l'attrito statico è la causa del rotolamento iniziale
-   moto di puro rotolamento
    -   punto di contatto \\(P\\) istante per istante è differente, in quiete rispetto al piano considerando infinitesimi di tempo
    -   solo l'attrito statico è rilevante al moto
    -   attrito statico e \\(P\\) in quiete significa lavoro delle forze di attrito nullo
    -   l'energia non viene dissipata
-   moto con rotolamento e strisciamento
    -   se c'è strisciamento del punto di contatto entra in gioco l'attrito dinamico
    -   in relazione allo strisciamento viene dissipata energia per lavoro contro le forze di attrito


### Momento Torcente {#momento-torcente}

\\[ \vec{\tau} = \vec{r} \land \vec{F}\\]

-   prodotto vettoriale di distanza per forza
    -   **NB** il prodotto vettoriale è antisimmetrico

\\[\tau = r\_\perp F = r F \sin \theta\\]

-   esempio di bilanciamento delle forze in un volano su un asse
    -   evita traslazione del sistema e rotazione dell'asse


### Legge di Newton per le rotazioni {#legge-di-newton-per-le-rotazioni}

Perché si possano applicare queste equazioni va specificato l'asse di rotazione.

\\[\sum \vec{\tau} = I \vec{\alpha}\\]

-   \\(I\\) è la costante di accoppiamento tra moto e accelerazione
    -   inerzia che il corpo oppone alla modifica del suo stato rotazionale sotto l'azione di un momento torcente

Momento d'inerzia:
\\[I = \sum\_i m\_i d\_i^2\\]
\\[I = \int\_M d\_i^2 dm = \int\_V d\_i^2 \rho dV\\]

Momenti d'inerzia di solidi particolari:

-   anello
-   cilindro pieno e non
-   sfera uniforme
-   sbarra


### Energia Cinetica Rotazionale {#energia-cinetica-rotazionale}

\\[ K\_{ROT} = \frac{1}{2} Iw^2\\]
\\[ K = K\_{TR} + K\_{ROT}\\]

-   \\(TR\\) rispetto al centro di massa
-   \\(ROT\\) rispetto ad un asse passante per il centro di massa


### Lavoro e Potenza del Momento Torcente {#lavoro-e-potenza-del-momento-torcente}

\\[W = F \Delta l = Fr \Delta \theta = \tau \Delta \theta\\]

-   nel caso semplificato in cui abbiamo forze costanti e non conti vettoriali

\\[P = \tau \omega\\]


### Momento Angolare {#momento-angolare}

Momento della quantità di moto.
\\[ L = I \vec{\omega}\\]

**Seconda legge di Newton generalizzata per le rotazioni**:

-   tiene conto che il momento di inerzia possa variare nel sistema
-   molto più facile cambiare il momento di inerzia che la massa nel corrispettivo traslazionale

\\[\sum \vec{\tau} = \frac{d\vec{L}}{dt}\\]

_Il momento angolare totale di un corpo che ruota rimane costante se il momento torcente risultante che agisce su di esso è nullo._
\\[I\omega = I\_0 \omega\_0 = const\\]
Se conservo il momento angolare non conservo l'energia cinetica rotazionale.

-   in quanto \\(\omega\\) compare al quadrato mentre \\(I\\) no
-   l'energia aumenta in quanto c'è un lavoro trainante che modifica il momento di inerzia
    -   le forze che modificano l'assetto rotazionale sono **forze interne** e quindi non modificano il moto traslazionale in atto


### Statica {#statica}

Lo studio dell'equilibrio:

-   assenza di cause di moto, sia traslazionale che rotazionale

2 condizioni:
\\[ \vec{R} = \sum \vec{F} = \vec{0}\\]
\\[ \vec{T} = \sum \tau = \vec{0}\\]

Fondamentale negli esercizi scegliere l'asse di rotazione per cui imporre la statica in modo da annullare il braccio e quindi i contributi della maggior parte delle incognite.


#### Applicazioni al corpo umano {#applicazioni-al-corpo-umano}

-   inserzioni sfavorevoli della muscolatura
-   peggio ancora sulla struttura spinale


#### Equilibrio Stabile {#equilibrio-stabile}

Se il corpo si sposta dalla posizione di equilibrio, la forza agente sul sistema è una forza di richiamo rispetto alla posizione di equilibrio, e quindi il sistema tende a ritornare spontaneamente nella posizione di equilibrio.
**Corrisponde ad un minimo dell'energia  potenziale del sistema.**


#### Equilibrio Instabile {#equilibrio-instabile}

Se li corpo si sposta dalla posizione di equilibrio, il sistema tende ad allontanarsi dalla posizione di equilibrio.
**Corrisponde ad un massimo dell'energia potenziale del sistema.**


#### Equilibrio Indifferente {#equilibrio-indifferente}

Il corpo rimane nella nuova posizione.
**Corrisponde ad un'energia potenziale del sistema costante.**


### Elasticità {#elasticità}


## Onde Meccaniche {#onde-meccaniche}


## Acustica {#acustica}


## Ottica {#ottica}


## Meccanica dei Fluidi {#meccanica-dei-fluidi}
