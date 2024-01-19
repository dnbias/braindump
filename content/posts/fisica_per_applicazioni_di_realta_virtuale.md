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

Una forza applicata ad un corpo crea una deformazione.

-   elasticità e sforzo
-   deformazione risultato di uno sforzo
-   la deformazione dipende dalla natura del materiale, dalla dimensione della sezione e dalla direzione della forza
-   quando si parla di deformazione si tratta _sempre_ di coppie di forze
    -   per esempio una massa appesa e la reazione vincolare
-   vale la legge di Hooke nella **regione elastica**, fino ad un massimo allungamento chiamato limite di proporzionalità
    -   \\(F =- K\Delta L\\)
-   regione plastica (oltre il limite elastico) quella in cui c'è ulteriore deformazione ma non più  reversibile, la deformazione non è più proporzionale alla forza applicata
-   il punto di rottura è anche il massimo allungamento

\\[\Delta L = \frac{1}{E} \frac{F}{A}L\_0\\]

-   la costante di proporzionalità \\(\frac{1}{E}\\) è detta **modulo di elasticità** o **di Young**

Lo sforzo può essere di _tensione_ o di _compressione_.

-   la forza è sempre applicata perpendicolarmente alla sezione
-   le forze applicate parallelamente (lungo le facce) producono uno _sforzo di taglio_
    -   si definisce un **modulo di taglio** \\(G\\) con una formula analoga alla precedente
    -   \\(\Delta L\\) in questo caso è perpendicolare a \\(L\\)
-   nel caso di forze applicate su tutto il volume e dirette verso il centro si ha un **modulo di compressione** \\(B\\)
    -   pressione e sforzo sono logicamente equivalenti, aumento di pressione \\(\Delta P\\) porta una compressione \\(\Delta V\\)

\\[\frac{\Delta V}{V\_0} = - \frac{1}{B} \Delta P\\]
\\[B = - \frac{\Delta P}{\Delta V / V\_0}\\]

Sforzi di frattura, gli sforzi di tensione o taglio sono più pericolosi.


## Onde Meccaniche {#onde-meccaniche}

> Propagazione in un mezzo di una perturbazione dell'equilibrio che genera una successione di infiniti moti armonici.

-   non si ha trasporto di materia
    -   solo di energia
-   la circonferenza aumenta sempre a partire dalla perturbazione e quindi l'energia diminuisce con la propagazione

**Impulso d'onda**, una singola perturbazione che si propaga nel mezzo.


### Onda Periodica {#onda-periodica}

**Onda periodica**, la causa della perturbazione è una causa periodica, persistente

-   nella maggior parte dei casi è anch'essa un moto armonico
-   l'oscillazione si propaga con una velocità che dipende dal mezzo
-   la frequenza dell'onda non cambia durante la propagazione

Queste onde sono per definizione infinite, quindi possiede energia infinita. È una semplicazione utile a descrivere fenomeni locali. È un'onda _teorica_.

Grandezze di un'onda periodica:

-   ampiezza \\(A\\), massima distanza di un punto dalla situazione di equilibrio
-   lunghezza d'onda \\(\lambda\\), distanza tra due punti con la stessa fase (stesse variabili cinematiche per il moto armonico)
-   frequenza \\(f\\), numero di cicli al secondo, periodo \\(T\\)
-   velocità dell'onda \\(v\\), non ha nulla a che fare con la velocità del moto armonico \\(\frac{\delta y}{\delta t}\\)

\\[v = \frac{\lambda}{T} = \lambda f\\]
Per un'onda trasversale in una corda con densità \\(\mu\\):
\\[v = \sqrt{\frac{F\_T}{\mu}} = \sqrt{\frac{F\_T}{M/L}}\\]
In generale
\\[v = \sqrt{\frac{\text{fattore di elasticità}}{\text{fattore d'inerzia}}}\\]

**NB**: il valore medio di ogni punto è lo stesso del punto in equilibrio, _non c'è trasporto di materia_.


### Onda Trasversale e Longitudinale {#onda-trasversale-e-longitudinale}

Quando le due velocità (onda e moto armonico) sono perpendicolari si ha un'onda trasversale, quando parallele si ha un'onda longitudinale.

Un'onda longitudinale implica un cambiamento periodico di densità del mezzo, quindi si può concepire come _un'onda di densità_.
Onda longitudinale in barra rigida:
\\[ v = \sqrt{\frac{E}{\rho}}\\]
Onda longitudinale in liquido o gas:
\\[ v = \sqrt{\frac{B}{\rho}}\\]

**NB**: un'onda _trasversale_ non si può propagare in un fluido, in quando un moto trasversale di una molecola non ha effetto sui suoi vicini.


#### Terremoti {#terremoti}

-   onde **S**, shear
    -   trasversali
-   onde **P**, pression
    -   longitudinali


### Energia e Intensità {#energia-e-intensità}

L'energia trasportata dalle onde è proporzionale al quadrato dell'ampiezza: conseguenza del fatto che per ogni moto armonico si ha:
\\[E = \frac{1}{2}KA^2\\]
L'intensità \\(I\\) è definita come l'energia per unità di tempo (potenza) che attraversa l'unità di superficie perpendicolare alla direzione del flusso dell'energia.
In caso di onda propagata in tutte le direzioni in un mezzo isotropo questa è un'onda sferica:
\\[I = \frac{P}{4\pi r^2}\\]

L'ampiezza ha proporzionalità inverso rispetto la distanza:
\\[A \propto \frac{1}{r}\\]


### Riflessione {#riflessione}

-   nel momento in cui c'è un cambio mezzo
    -   una parte di onda viene trasmessa e parte viene riflessa
    -   se la secondo mezzo è **trasparente** permette la trasmissione
        -   comunque una parte sarà riflessa
-   la riflessione in mezzo più lento avviene in opposizione di fase
    -   densità maggiore
-   la riflessione in mezzo più veloce il ribaltamento non c'è opposizione di fase
    -   densità minore


#### Topologia delle Onde {#topologia-delle-onde}

-   l'onda è sferica
    -   l'onda piana è una semplificazione data da un'onda sferica a distanza infinita
        -   i raggi sono tra loro praticamente paralleli
-   **fronte d'onda**
    -   insieme dei punti dotati di fase uguale
-   **raggio**
    -   linea perpendicolare al fronte d'onda, parallela alla direzione di propogazione dell'onda


#### Riflessione onde piane {#riflessione-onde-piane}

-   onda bi o tri-dimensionale _piana_
-   l'angolo di riflessione è uguale a quello di incidenza

> L'angolo che il fronte d'onda piano incidente forma con la superficie riflettente è uguale a quello formato dal fronte d'onda riflesso.

<!--quoteend-->

> Sia l'angolo di incidenza che l'angolo di riflessione sono misurati rispetto alla normale alla superficie riflettente.

<!--quoteend-->

> Una misura alternativa di questi due angoli è fornita dagli angoli che il fronte d'onda forma con la tangente alla superficie riflettente.

\\[\theta\_i = \theta\_r\\]


### Principio di Sovrapposizione {#principio-di-sovrapposizione}

> Se sono presenti due o più cause che perturbano il mezzo la perturbazione totale è data dalla somma algebrica delle perturbazioni che sarebbero introdotte dalle singole cause.

\\[ y\_{tot} = y\_1 + y\_2\\]


### Interferenza {#interferenza}

-   conseguenza del principio di sovrapposizione
    -   caso particolare
-   le onde devono essere **coerenti**
    -   quindi \\(f\\) costante e \\(f\\) uguali tra loro
-   interferenza **costruttiva** tra onde in fase
    -   \\(\Delta \theta = 0^o / nT\\)
-   interferenza **distruttiva** tra onde in opposizione di fase
    -   \\(\Delta \theta = 180^o / (2n+1)T/2\\)


#### Onde Stazionarie {#onde-stazionarie}

-   caso particolare di interferenza
-   non sono onde
-   sono il prodotto di interferenza, una **regressiva** e una **progressiva**, che coesistono in un mezzo **limitato**
    -   progressiva va verso il limite
    -   regressiva è stata riflessa dal limite
    -   l'interferenza è costruttiva solo per determinate frequenze
-   la limitatezza del mezzo
    -   causa la riflessione all'estremo o agli estremi in cui il mezzo è limitato
    -   fa si che l'onda non solo non trasporti massa ma non trasporti neanche energia
        -   il moto armonico mantiene la sua ampiezza d'onda

Son vincolate dalle condizioni al contorno. Lo spostamento agli estremi deve essere nullo.

-   agli estremi devono esserci nodi dell'onda
-   le frequenze ospitabili sono le **armoniche**
    -   **fondamentale** è l'onda stazionaria di minima frequenza \\(f\_1\\) e massima \\(\lambda\_1\\)
    -   **superiori** hanno frequenze multiple e \\(\lambda\\) sottomultiple

\\[\lambda\_n = \frac{2L}{n} = \fracx{\lambda\_1}{n}\\]
\\[f\_n = \frac{nv}{2L} = nf\_1\\]


### Principio di Huygens {#principio-di-huygens}

Principio da cui derivare tutte le altre proprietà della teoria delle onde.

> Ciascun punto del fronte d'onda può esser considerato come songente di onde secondarie emi-sferiche, che si dipartono dal punto nella stessa direzione del fronte d'onda e con la stessa velocità. Il nuovo fronte d'onda è costituito dall'inviluppo di tutte le onde secondarie, cioè dalla superficie tangente ad esse.

Dal punto di vista fisico si ha una interferenza di onde coerenti in fase.
Il nuovo fronte d'onda si crea dalla interferenza costruttiva di queste onde secondarie.

Questo principio spiega il fenomero di **diffrazione** attorno alle estremità di un'ostacolo, attraverso una fenditura più langa del valore della lunghezza d'onda, e attraverso una fenditura dello stesso ondine di grandezza di \\(\lambda\\).

-   se \\(\lambda\\) è maggiore della fenditura allora l'onda non può passare, non ci sta neanche un punto di Huygens


## Acustica {#acustica}

La parte delle onde meccaniche che si occupa della propagazione del suono.
Il suono è:

-   onda longitudinale
-   di compressione
-   di rarefazione
-   nella materia

\\[v = \sqrt{\frac{B}{\rho}}\\]
Definiamo pressione \\(P\\) misurata in Pascal \\(\text{Pa}\\)
\\[P = \frac{F\_N}{A}\\]

Possibile descrivere l'onda sia in relazione allo spostamento sia alla pressione.
L'onda di spostamento è sfasata di un quarto di lunghezza d'orda rispetto all'onda di pressione.

-   massimo/minimo di pressione \\(\to\\) spostamento nullo
-   variazione di pressione nulla \\(\to\\) massimo spostamento


### Caratteristiche del suono {#caratteristiche-del-suono}

-   tono: suono acuto o grave, la grandezza fisica corrispondente è la **frequenza**
-   intervallu di udibilità: \\(20 \text{Hz} \div 20 \text{KHz}\\), in contrazione con l'età
-   ultrasuoni: frequenza maggiore di \\(20 \text{KHz}\\)
-   infrasuoni: frequenza minore di \\(20 \text{Hz}\\)
-   sensazione sonora: percezione umana legata all'intensità del suono
-   velocità del suono nell'aria: \\(342\text{ m/s}\\)
-   livello di intensità misurato in bel o decibel

\\[\beta (dB) = 10 \log \frac{I}{I\_0}\\]


### Orecchio Umano {#orecchio-umano}

-   orecchio esterno
    -   condotto fino a timpano, membrana che vibra in corrispondenza alle onde acustiche di pressione
-   orecchio medio
    -   tre ossicini, martello, incudine, staffa
    -   trasferiscono vibrazioni dall órecchio interno attraverso la finestra ovale
    -   il rapporto tra la superfice del timpano, molto maggiore di quella della finestra ovale e il sistema di leve porta un'amplificazione dell'ampiezza di pressione di un fattore circa 40
-   orecchio interno
    -   canali semicircolari bilanciano il suono
    -   coclea piani di liquido trasforma in impulso elettrico l'impulso acustico
    -   sistema nervoso trasferisce l'impulso elettrico al cervello
-   il danno uditivo avviena nella finestra rotonda, che non riesce più a smorzare bene l'impulso che arriva attraverso il liquido della coclea e porta a riflessione acustica e quindi interferenze

**Sensibilità acustica** misurata in _phon_, suoni di frequenza diversa portano a sensazioni acustiche diverse a parità di intensità.


### Strumenti Musicali {#strumenti-musicali}

Passando da un mezzo all'altro il suono cambia velocità e ampiezza d'onda ma non frequenza.
Salire di un ottava significa raddoppiare frequenza e viceversa.

In strumenti a corda:

-   lunghezza della corda fissata
-   la forza con cui si colpisce la corda rappresenta la forza che definisce la velocità di propagazione
    -   aumentando la tensione lineare aumenta la velocità
    -   tirare o allentare significa aumentare e diminuire la frequenza
-   il tasto diminuisce \\(L\\)
    -   quindi cambia la frequenza aumenta man mano
-   un accordo è l'unione di note con la stessa **armonica fondamentale** creando l'armonia (_interferenza costruttiva_)
-   la lunghezza d'onda fondamentale è \\(\lambda = 2L\\)

Strumenti a tubo aperto

-   continua a valere \\(L = \frac{1}{2}\lambda\\)
-   allungare il tubo significa abbassare la frequenza

Strumenti a tubo chiuso

-   \\(L = \frac{1}{4}\lambda\\)
-   può ospitare solo armoniche dispari
-   ha ricchezza cromatica minore

Il suono è diverso per voci, strumenti diversi in quanto cambiano i contributi delle armoniche superiori. è definito dallo spettro del suono.
L'armonica fondamentale, o quella dominante in ampiezza, fornisce il tono della nota. Lo spettro delle armoniche superiori, in ampiezza e frequenza, fornisce il timbro.


### Interferenza {#interferenza}

L'interferenza in caso di monofrequenza e in fase è

-   costruttiva quando la differenza di percorso corrisponde a un multiplo intero della lunghezza dell'onda
-   completamente distruttiva se la differenza è un multiplo intero della semilunghezza d'onda


### Battimenti {#battimenti}

Si verifica in caso di frequenze leggermente dissimili:

-   provoca composizione di fenomeni periodici di frequenza media rispetto alle costituenti
-   una variazione di ampiezza con frequenza definita detta frequenza di battimento
-   non è interferenza perchè le frequenze sono diverse

\\[f\_b = | f\_1 - f\_2|\\]

Questo fenomeno è alla base dell'accordatore.


### Moto delle sorgenti {#moto-delle-sorgenti}

-   sorgente ferma
    -   emissione sferica
    -   fronti d'onda equidistanti in tutte le direzioni
-   velocità subsonica
    -   fronti d'onda si accumulano
    -   diminuendo la lunghezza d'onda di fronte alla sorgente
    -   **effetto Doppler**

Sorgente in moto e osservatore fermo:
\\[ \lambda\_1 = \frac{v-v\_s}{f\_0} \to f\_1 = \frac{v}{v-v\_s}f\_0\\]
Sorgente ferma e osservatore in moto:
\\[ f\_2 = \frac{v+v\_0}{v}f\_0\\]
**NB** \\(f\_1 \neq f\_2\\)

-   velocità uguale a quella del suono
    -   i fronti d'onda si accumulano esattamente di fronte alla sorgente
    -   il superamento della velocità del suono deve superare la barriera costituita dal fronte d'onda anteriore, si _infrange il muro del suono_
    -   bang ultrasonico è un'onda d'urto che è costituita dall'interferenza costruttiva di tutti i fronti d'onda che si accumulano
    -   un oggetto a forma composta produce più onde d'urto

\\[n\_{\text{mach}}  = \frac{v\_\text{sorgente}}{v\_\text{suono}}\\]

\\[\sin \theta  = \frac{v\_\text{suono}}{v\_\text{sorgente}}\\]


### Sonar {#sonar}

_Sound, Navigation and Ranging_

-   applicazione della tecnica eco pulsata
-   l'intervallo di tempo tra trasmissione e ricezione nota la velocità del suono nel mezzo permette di determinare la posizione di un'oggetto
-   maggiore frequenza più il suono viene attenuato
    -   l'energia si dissipa per atrito nell'acqua
-   la lunghezza d'onda deve essere più piccola dell'oggetto da individuare
    -   altrimenti non rimbalza
-   le frequenze utilizzate sono ultrasoniche per questi motivi
-   la temperatura dell'acqua ha un grosso impatto sulla velocità di propagazione
    -   ci sono diversi termoclimi a profondità diverse


### Ecografia {#ecografia}

-   applicazione della tecnica eco pulsata
-   studia le pareti di separazione tra i tessuti
-   le frequenze utilizzate sono \\(1 - 10\text{ MHz}\\)
-   ogni volta che cambia il mezzo c'è una parte riflessa
-   passaggio maggiore di densità significa una maggiore riflessione
-   ampiezza e tempo del rimbalso informano sul tessuto di rimbalso e la posizione
-   **eco-doppler** utilizzato per valutare il flusso sanguigno nelle vene o il battito cardiaco fetale
    -   se il tessuto che causa il rimbalso ha usa velocità crea un effetto doppler


## Ottica {#ottica}


### Ottica Geometrica {#ottica-geometrica}

Semplifica la descrizione della luce:

-   luce percorre solo linee rette
    -   raggi rettilinei
-   un oggetto in principio diffonde i raggi in tutte le direzioni
    -   tranne casi particolari come specchi
-   la visione può avvenire attraverso i raggi diretti provenienti direttamente dalla sorgente
    -   o raggi diffusi
    -   parte può essere assorbita


#### Riflessione {#riflessione}

<!--list-separator-->

-  Riflessione Speculare

    > Il raggio incidente su una superficie perfettamente piana viene riflesso formando un'angolo uguale a quello formato dal raggio incidente con la normale alla superficie.

    \\[\theta\_i = \theta\_r\\]

<!--list-separator-->

-  Riflessione Diffusiva

    > Il raggio incidente su una superficie scabra la normale cambia punto a punto e quindi i raggi vengono riflessi in ogni direzione.

    -   quindi un ossevatore può vedere la luce tutto attorno all'oggetto

<!--list-separator-->

-  Formazione di Immagini

    -   **punto oggetto**
        -   sorgente di un flusso divergente
        -   può essere una sorgente o un flusso che emerge da un punto
    -   **strumenti ottici**
        -   manipolano flussi di raggi
    -   **punto immagine**
        -   punto da cui emerge un flusso di raggi divergente
        -   _immagine virtuale_ se il flusso di raggi sembra incontrarsi in quel punto
        -   _immagine reale_ se il flusso di raggi si incontra effettivamente in quel punto

    **NB**: concetto dell'invertibilità dei cammini reali, i percorsi che i raggi fanno all'andata sono gli stessi che i raggi fanno al ritorno.

<!--list-separator-->

-  Equazione dello specchio

    **Legge di Gauss** o Equazione dei punto coniugati[^fn:1]:
    \\[\frac{1}{f} = \frac{1}{d\_i} + \frac{1}{d\_o}\\]

    -   vale in un **sistema stigmatico**
        -   ottica di Gauss e ottica parassiale
            -   deve esistere un fuoco
            -   consideriamo \\(\text{AB}\\) un segmento perchè molto vicini

    **Ingrandimento trasversale** \\(m\\):
    \\[m = \frac{h\_i}{h\_o} = - \frac{d\_i}{d\_o}\\]

    -   \\(|m|>1\\) ingrandimento
    -   \\(|m|<1\\) rimpicciolimento
    -   \\(m<0\\) capovolgimento

<!--list-separator-->

-  Specchi piani

    -   riflettono senza modificare l'immagine virtuale

<!--list-separator-->

-  Specchi sferici

    Considerando raggi paralleli (sorgente all'infinito) questi vengono riflessi, secondo la legge di riflessione punto per punto, ma non convergono tutti nello stesso punto. Il fenomeno è noto come **aberrazione sferica**. Per questo specchi sferici forniscono immagini meno nitide rispetto agli specchi piani.

    -   con uno specchio piccolo rispetto al raggio di curvatura l'aberrazione è trascurabile
    -   _approssimazione a piccoli angoli_
        -   due condizioni: **ottica di Gauss** e **ottica parassiale**
    -   **Caustica di confusione**
        -   se è abbastanza piccola la si può ignorare, come nei casi suddetti

    Un sistema la cui caustica di confusione è ignorabile si definisce **stigmatico**, ovvero crea immagini puntiformi con una buona approssimazione.

    -   **convesso**, la riflessione avviene sulla superficie esterna della sfera e il centro di curvatura è dalla parte opposta rispetto l'osservatore
        -   introducono **divergenza**
        -   immagini rimpicciolite
        -   campo visivo allargato
        -   esempi: specchietti retrovistori, specchi stradali
        -   punto focale interno allo specchio
            -   negativo
        -   raggio di curvatura negativo
        -   le immagini sono _solo virtuali_
            -   i flussi divergenti divengono più divergenti
            -   le immagini sono sempre diritte, virtuali, rimpicciolite

    <!--listend-->

    -   **concavi**, la riflessione avviene sulla superficie interna della sfera e il centro di curvatura è dalla stessa parte dell'osservatore
        -   introducono **convergenza**
        -   immagini ingrandite
        -   campo visivo ridotto
        -   esempio: specchio per truccarsi
        -   asse principale: normale alla superficie nel suo centro \\(A\\), passante per il centro di curvatura \\(C\\)
        -   **fuoco** o **punto focale**: \\(F\\) in cui convergono i raggi paralleli all'asse principale
            -   definito anche come punto immagine dell'infinito
        -   distanza o **lunghezza focale**: distanza tra punto focale e centro dello specchio \\(\text{FA}\\)
            -   \\(f = \frac{r}{2}\\)
        -   per oggetti più lontani del fuoco tutti i punti vengono riflessi e si forma un immagine **reale** e invertita
        -   per oggetti più vicini del fuoco lo specchio non vince la divergenza dei raggi e quindi questi rimangono divergenti e si crea un immagine virtuale
            -   i raggi si incontrano _virtualmente_ dietro allo specchio
            -   un osservatore vede un immagine _virtuale_ ma indistinguibile da un oggetto


#### Rifrazione {#rifrazione}

La velocità della luce dipende dal mezzo in cui si propaga.
\\[ c = 2.99792458 \text{ m/s} = 3 \cdot 10^8 \text{ m/s}\\]
\\[v \simeq c\\]

Indice di rifrazione:
\\[n = \frac{c}{v}\\]

-   \\(c\\) dipende dalla lunghezza d'onda \\(\lambda\\)

<!--list-separator-->

-  Legge di Smell

    > La parte del raggio di luce che viene trasmessa nel passaggio attraverso due mezzi con indice di rifrazione diverso viene deviato, la parte restante viene riflessa.

    \\[n\_1 \sin \theta\_1 = n\_2 \sin \theta\_2\\]

    -   quando si entra in un mezzo più lento ci si avvicina alla normale
    -   per l'invertibilità del cammino ottico entrando in un mezzo più veloci ci si allontana dalla normale

    Si ha riflessione totale passando a mezzi ad indice di rifrazione minore per angoli maggiori dell'angolo limite \\(\theta\_c\\).

    -   questo perchè il raggio rifratto si allontana dalla normale, oltre un angolo di rifrazione di \\(90^{\circ}\\) (sulla superficie del mezzo) tutta la luce viene riflessa

    \\[\sin \theta\_c = \frac{n\_2}{n\_1} \sin 90^{\circ} = \frac{n\_2}{n\_1}\\]

    -   applicazioni:
        -   binocolo
        -   fibra ottica (**guida di luce**)
        -   endoscopio

<!--list-separator-->

-  Lenti


### Ottica Ondulatoria {#ottica-ondulatoria}


## Meccanica dei Fluidi {#meccanica-dei-fluidi}

[^fn:1]: in quanto ad ogni singolo punto oggetto corrisponde un singolo punto immagine
