+++
title = "Etica, Società e Privacy"
author = ["Daniel Biasiotto"]
date = 2023-11-09T09:41:00+01:00
tags = ["university", "compsci", "master"]
draft = false
+++

-   Professori:
    -   Guido Boella
    -   Mirko Polato
    -   Ruggero Pensa
    -   Elena Battaglia


## Privacy {#privacy}

-   Related: [Knowledge Discovery &amp; Data Mining]({{< relref "knowledge_discovery_data_mining.md" >}})


### Principi {#principi}

-   Direttiva europea 95
-   `GDPR` 2016, entrava in vigore nel 2018 in tutti i paesi UE
    -   introduce il concetto di _pseudonimizzazione_
-   Privacy by Design and by Default


### Big Data Era {#big-data-era}

-   il concetto è legato con l'idea di possesso, autonomia e integrità delle nostre vite
-   le nostre informazioni pubbliche sono utilizzate da terzi per prendere decisioni anche importanti per la nostra vita

> The right to be left alone

-   dati di credito
-   dati telefonici
-   dati medici, dati sulle assicurazioni
-   dati mail
-   social media
-   dispositivi `IoT`
-   videocamere di sicurezza
-   dati `DNA`

_[Law of Unintended Consequences]({{< relref "law_of_unintended_consequences.md" >}})_

-   `SSN` è era stato pensato per sicurezza sociale
    -   ora è utilizzato per identificare gli studenti
-   gli smartphone erano nati con scopi di comunicazione
    -   ora sono utilizzati come metodi di pagamento
-   `DNA` utilizzato per motivi evolutivi
    -   potrebbe essere un'identificativo

_[Big Data]({{< relref "big_data.md" >}})_

-   i dati sono molti, cosi tanti che non si sa come gestirli ma neanche come proteggerli
-   molti dati sporchi e difficilmente analizzabili
-   i dati vengono collezionati in maniera indiscriminata, spesso più di quelli necessari
-   dati non ben caratterizzati
-   queste quantità di dati permettono l'identificazione di **pattern** che altrimenti non sarebbe possibile riconoscere
    -   caso `FDA`, Bing e colesterolo

_[Dataification]({{< relref "dataification.md" >}})_

-   le organizzazioni sono dipendenti dai dati
-   business si basano interamente sui dati
-   molti business accumulano dati con l'idea di utilizzarli in futuro, contrariamente ai principi del `GDPR`

Questi sviluppo sono possibili solamente, almeno per quanto ne sappiamo attualmente, solo con una perdita del controllo dei singoli verso i propri dati


### Anonymization and Deanonymization {#anonymization-and-deanonymization}

Nel 2006 **Netflix** aveva diffuso un dataset dei suoi utenti e i rating sul sito. I dati erano da utilizzare in una sfida per migliorare l'algoritmo di raccomandazione.

-   l'incrocio dei dati con `IMDd` facilmente deanonimizzava il dataset
-   non basta la rimozione dell'identificativo per anonimizzare i dati

Nello stesso anno `AOL` rilascia un dataset che viene deanonimizzato dal New York Time


### Data Breach {#data-breach}

-   studio sul costo dei _data breach_
    -   383 compagnie
    -   12 paesi
    -   $4 milioni in media
    -   aumento del costo negli anni di più del 29%
    -   i dati di più valore sono quelli medici seguita da educazione e finanziari


### Sistemi Informativi {#sistemi-informativi}

-   sistema formale, sociotecnico, organizzazionale
-   _collect, protect, store and distribute information used by the organization_
-   questi sistemi comprendono si computer ma anche persone
-   un **sistema informatico** è composta anche da macchine e persone che cooperano
    -   può mettere in atto tutti i compiti citati
    -   automatizza il processamento delle informazioni e i processi aziendali

Lo scambio tratta dati di tutti i tipi

-   anche privati e personali
-   di impiegati/clienti/fornitori


#### Azioni di base {#azioni-di-base}

Le misure di privacy in un'azienda vengono messe in atto:

-   con l'educazione di manager e impiegati
-   rafforzando la cybersecurity
-   protezione di rete
-   restrizione dell'accesso ad aree sensibili
-   l'uso di `VPN` nel lavoro remoto
-   aggiornamento software


#### Compliance w/ GDPR {#compliance-w-gdpr}

-   prendere in considerazione tutti gli intermediari che vengono ad avere accesso ai dati
-   _trasparenza_, l'utente deve sapere chi ha accesso ai dati e dove vengono mantenuti
-   tutti gli attori rispondono tutti al `GDPR`?
-   dopo che l'utente ha ottenuto il risultato ricercato, i dati vengono cancellati?

4 proprietà che vanno implementate in un sistema informativo per rispettare il `GDPR`:

1.  attribute-based authorization
2.  anonymizing / pseudonymizing data
3.  traceability, registro di chi ha creato, modificato o cancellato, quando e perché
4.  data deletion


### Attribute-based Authorization {#attribute-based-authorization}

-   **access control**
    -   restrizione dell'accesso in un sistema multi utente
    -   un sistema complesso necessiterà di una implementazione complessa
-   **role based access control**
    -   `RBAC`
    -   formalizzato da `NIST` nel 1992
    -   indicativamente fino a 500 utenti
    -   utilizzare ruoli e non `ID` per gestire il controllo alle risorse
    -   limiti:
        -   configurazione statica, predefinita
        -   non riescono a provvedere un meccanismo flessibile per cui anche utenti/clienti possano esprimere dei requisiti di accesso
        -   non modella il motivo per cui è dato l'accesso ai dati
        -   non modella il _contesto_ all'accesso delle risorse
            -   giusto utente/momento/luogo di accesso ai dati
-   **attribute based access control**
    -   `ABAC`
    -   aggiunge contesto all'autorizzazione
    -   ruolo dell'utente
    -   chi e cosa riguarda l'utente
    -   a cosa l'utente deve accedere
    -   quando l'utente deve accedere
    -   come l'utente deve accedere
    -   estende i ruoli con contesto e politiche di accesso ai dati
    -   può permettere l'accesso in alcuni casi a utenti esterni, cosa impossibile con `RBAC`

`ABAC` utilizza linguaggio naturale per definire le politiche:

> _Doctors_ can <span class="underline">view</span> _medical records_ of _any patient_ in _their department_ and <span class="underline">update</span> _any patient record_ that is _directly assigned to them_, during _working hours_ and from _an approved device_.

Le **policy** si strutturano in

-   soggetto
-   azione: `read/write` o altre più specifiche
-   risorsa: metadati, tag, parte di un fascicolo
-   ambiente: identifica il contesto, ora, posizione,  protocollo, client, cifratura

Tre aspetti che vengono presi in considerazione:

1.  **user**
2.  **environment**
3.  **information asset**

L'**authorization engine** prende questi e in base alle **policy** rilascia il permesso o meno all'accesso.
Questo engine è composto di

-   `PEP`, accesso per le richieste
-   `PDP`, decision, valuta le policy che si applicano e ritorna la decisione a `PEP`
-   `PAP`, administration, memorizza le policy
-   `PIP`, information, memorizza gli attributi

Il linguaggio che implementa `ABAC` è `XACML` come linguaggio di interscambio


### Pseudononimizzazione {#pseudononimizzazione}

Rende i dati anonimi se fatto in maniera corretta, quindi dati non regolati dal [GDPR]({{< relref "gdpr.md" >}}).

-   _personal identifiable information_
    -   gli attributi di questo tipo possono ricondurre all'identità dell'utente
    -   vanno **pseudonimizzati**
        -   rendono i dati meno identificativi
        -   devono poter essere ripristinati, fatta solo accedendo informazioni aggiuntive
            -   tramite chiave memorizzata separatamente
    -   dati **anonimizzati** <span class="underline">non possono</span> essere ripristinati allo stato precedente

-   è necessario associare a queste tecniche anche _auditing_ per gestire i rischi di attacco alla base dati
    -   tracciare le attività sul `DB`


#### Column Encryption {#column-encryption}

> Keep sensitive data columns encrypted on the server side.

-   caratteristica di molti db commerciali
-   permette cifratura di dati a lato client e mai rivelare chiavi al DB engine
-   si crea una separazione tra chi **possiede** i dati e chi li **gestisce**.
-   setup di cifratura di colonna:
    -   algoritmo di encryption, chiave crittografica
    -   column encryption keys
    -   column master keys
        -   cifrano una o più column encryption keys
-   `DBMS` mantiene queste configurazioni in metadata, ovviamente le chiavi mai in plaintext
-   `DBMS` mantiene solo valori criptati delle chiavi di colonna e informazioni sulla posizione delle master keys in _key store_ esterni e fidati

Tipo di cifratura:

-   **Deterministic encryption**
    -   stessa cifratura per stessi valori
    -   permette join di equality, point lookups, grouping, indexing senza decifrare
    -   permette di capire informazioni sui valori cifrati via _pattern analysis_
-   **Randomized encryption**
    -   cifra utilizzando _salt_ per variare la cifratura
    -   non permette le operazioni citate poco sopra


#### Dynamic Data Masking {#dynamic-data-masking}

> Limit sensitive data exposure by dynamically masking it to non-privileged users when data is returned from the server to the client.

-   built-in `MSSQL`
-   facilmente implementabile in qualsiasi `DBMS` utilizzando le _stored procedures_
-   i dati non sono modificati
-   viene applicato il _masking_ nel momento delle query

<!--listend-->

```text
Credit Cards: xxxx-xxxx-xxxx-x823
Email: brXX.XXXX@XXX.com
CF#: CXXFXXXXHLXXXF
```

```sql
ALTER TABLE Employee
ALTER COLUMN SALARY decimal(12,2) MASKED WITH
(FUNCTION = 'default()');
```

-   owners vedono dati in chiaro
-   privilegi: MASK/UNMASK a utenti e gruppi
    -   permessi a livello di `DB`
    -   attenzione che tutti i dati in quel database verrebbero mostrati
-   questa tecnica può essere bypassata tramite bruteforce
    -   senza limiti alle query è possibile fare ricerche dicotomiche con range piccoli per trovare valori esatti negli attributi nonostante siano mascherati


### Auditing {#auditing}

> Process of examining and validating documents, data, processes, procedures, systems.

-   obbiettivo di definire regole di business/di accesso/di sistema
-   audit log: documento che contiene tutte le attività che sono sotto scrutigno
-   auditor, autorizzato all'audit
-   audit procedure, istruzioni per il processo di audit
-   audit report, documento che riporta le conclusioni
-   audit trail, cronologia dei cambiamenti di documenti, dati, attività di sistema e eventi operativi
-   può essere interno o esterno
    -   può essere biased
    -   l'interno può fornire input a quello esterno o ai legali
-   una volta che il sistema è in produzione l'auditing fornisce input sul raggiungimento degli obiettivi in accordo con le policy di business


#### Data Auditing {#data-auditing}

Cronologia delle modifiche dei dati, mantenuta su un file di log o una tabella del `DB`.
Affiancata alla _database auditing_, riguardante le attività del database stesso.

Gli obiettivi sono molteplici:

-   data integrity
-   application users and roles
-   data confidentiality
-   access control
-   data changes
-   data structure changes
-   database or application availability
-   change control
-   auditing reports

Nei database può essere già implementato built-in o implementabile esternamente.

-   registra entità gestite da audit di cui mantenere la cronologia di attività
    -   transazioni `DML`
    -   logon, logout
    -   status dell'auditing
-   ci sono meccanismi di archivio e _purge_ dei dati di audit dopo un periodo di tempo anche lungo
-   _historical auditing_, modello per quando è necessario cronologia di una intera riga della tabella

In `MSSQL`:

```sql
CREATE SERVER AUDIT AuditDataAccess
              TO FILE (FILEPATH = 'C:\SQLAudit\')
              WHERE object_name = 'Empolyees';

ALTER SERVER AUDIT AuditDataAccess WITH (STATE = ON);
```

In Oracle:

```sql
CREATE AUDIT POLICY AuditDataAccess ACTIONS
    DELETE on Employees,
    INSERT on Employees,
    UPDATE on Employees,
    SELECT on Employees,
    CONTAINER = CURRENT;

AUDIT POLICY AuditDataAccess;
```


### Statistical Disclosure Control {#statistical-disclosure-control}

-   data collection
    -   Internet permette raccolta di dati in grandi quantità e di informazioni sensibili
    -   le informazioni utenti sono raccolte di continuo tramite device, web, social media
        -   possibile l'utilizzo anche nobile di questi dati
    -   spesso dati statistici sono open per uso da parte comunità
        -   linked open data
        -   dataset per **riproducibilità**
        -   data challenges
        -   policy e regulation
-   dati disponibili pubblicamente vanno protetti per evitare attacchi verso gli utenti alla fonte
    -   questi dati sono stati raccolti magari inizialmente senza pensare alla pubblicazione
    -   vanno trattati prima della pubblicazione
-   dati anonimizzati in qualche modo possono avere un _disclosure risk_ in quanto possibile l'incrocio di diversi dataset è possibile riportare dati anonimizzati agli identificativi

Data:

-   _macrodata_
    -   statistical databases
    -   tabelle conteggio/frequenze
        -   frequenza sugli attributi
        -   rischio in caso di frequenze molto basse
    -   dati di magnitudine
        -   valore aggregato su tutti gli attributi in analisi nella tabella
-   _microdata_
    -   specific stored data
    -   maggior rischio di privacy breach
    -   riguardano individui specifici in ogni record

> Information disclosure relates to improper attribution of information to a respondent, whether an individual or an organization.

-   per quanto riguarda la legge si proteggono i diritti della persona fisica e quindi i **dati personali**
-   le organizzazioni possono definire informazioni **confidenziali** ma questo non riguarda la legge quanto piuttosto una policy interna
-   c'è disclosure se:
    -   si identifica l'individuo a partire dai dati pubblicati, **identity disclosure**
        -   data subject identificato, non è strettamente una violazione della confidenzialità ma può essere un problema di privacy
        -   i macrodati non sono un problema in questo senso a meno che non porti a attribute disclosure
        -   i microdati sono un problema in quanto dettagliati
    -   si svelano informazioni sull'individuo a partire dai dati pubblicati, **attribute disclosure**
        -   si rivela o attribuisce una informazione al data subject
        -   avviene anche se è possibile stimare con alta confidenza delle informazioni
    -   i dati pubblicati permettono di determinare valori di caratteristiche dell'individuo più accuratamente che in precedenza, **inferential disclosure**
        -   informazioni possono essere inferiti con alta confidenza tramite analisi statistica
        -   i dati possono svelare forti correlazioni tra attributi del data subject
        -   complicato tenerne conto

Due approcci:

-   **restricted data**
-   **restricted access**

> Statistical Disclosure Control is a collection of methods that are used as part of anonymization processes to control/limit the risk of re-identification and attribute disclosure through manipulations of the data.

-   non specificatamente pensato per la privacy ma piuttosto per la confidenzialità
    -   il rischio è più alto quando si tratta di persone
-   c'è un **trade-off** tra utilità e rischio
    -   nessun dato significa rischio di disclosure nullo ma utilità nulla
    -   dati originali alto rischio di disclosure e alta utilità
    -   si cerca una soglia tra utilità e rischio di disclosure

Procedura `SDC`:

1.  data
2.  `SDC` method e scelta di parametro euristico
3.  misura di rischio di disclosure
4.  misura di utilità

poi analisi e tuning.


#### SDC per macrodata {#sdc-per-macrodata}

-   non perturbativi
    -   cell suppression
        -   primary suppression
            -   frequenze molto basse vanno soppresse
            -   rimuovere valore di celle rischiose
        -   secondary suppression (complementary)
            -   possibile sopprimere celle non a rischio per raggiungere una appropriata protezione per le celle a rischio
-   perturbativi
    -   random rounding
    -   controlled rounding
        -   si mantiene il più possibile il marginale nelle singole righe
    -   controlled tabular adjustment
        -   celle sensibili sostituite dal valore sicuro più prossimo
            -   aggiustamenti vanno fatti alle altre celle per mantenere l'additività dei marginali


#### SDC per query output {#sdc-per-query-output}

-   query perturbation
    -   su input, records
    -   su output risultati della query
-   query restriction
    -   blocco di specifiche query, magari troppo stringenti
    -   necessario il mantenimento delle query precedenti


#### SDC per microdata {#sdc-per-microdata}

-   data masking, genera una versione modificata del dataset
    -   perturbative masking
        -   aggiunta di rumore
            -   a dati numerici
            -   possono mantenere medie e correlazioni
        -   microaggregation
            -   si partizionano le tuple simili considerando piccoli gruppi
            -   si pubblica la media
        -   data swapping
            -   valori ordinati
            -   swap tra ranghi vicini di dati
        -   post randomization
            -   su attributi categorici
            -   si cambiano attributi secondo una matrice stocastica
    -   non-perturbative masking
        -   sampling
        -   generalization
            -   categorie meno specifiche
            -   intervalli numerici
        -   top/bottom coding
            -   threshold top/bottom secondo cui aggregare in singoli valori
        -   local suppression
            -   attributi individuali soppressi
            -   aumentare le combinazioni di record che si accordano su certi attributi
-   data synthesis, genera dati sintetici
    -   preserva alcune proprietà specifiche del dataset
    -   fully synthetic
    -   partially synthetic, solo su variabili sensibili
    -   pericoli di overfitting se i record sintetici sono troppo simili agli originali
    -   i dataset sintetici dipendono dal modello utilizzato
    -   i dataset sintetici devono mantenere valore di analisi statistica


#### Utility Measurement {#utility-measurement}

Difficile in quanto non è chiaro cosa gli utenti finali del dataset vorranno fare con i dati.
Si calcola l'**information loss**, per catturare in termini di teoria dell'informazione il cambiamento in informazione causata dal SDC.
Analisi **ex-post**:

-   cell suppression
    -   numero delle soppressioni
-   rounding e modifiche tabulari
    -   somma delle differenze tra reale e aggiustato
        -   possibile dare pesi specifici
-   query perturbation
    -   differenza tra risposta reale e perturbata
-   query restriction
    -   numero query rifiutate
-   misure di loss specifiche in base all'uso dei dati
    -   statistiche di base, medie, varianze, correlazioni
    -   score, propensity scores
    -   distanze tra originale e disclosure controlled utilizzando misure proprie della teoria dell'informazione
        -   Jensen-Shannon divergence
        -   Kullback-Leibler divergence

Non possibile calcolare probabilità di identificazione **ex-ante**. Per questo è necessario un modello di privacy.


#### Privacy Model {#privacy-model}

<!--list-separator-->

-  k-anonymity

<!--list-separator-->

-  l-diversity

<!--list-separator-->

-  t-closeness

<!--list-separator-->

-  &delta;-presence

<!--list-separator-->

-  differential privacy


### Anonymization Frameworks {#anonymization-frameworks}

-   la raccolta di dati ha raggiunto livelli prima impensabili
    -   utilizzo di web molto maggiore
    -   social media
    -   wearable
    -   domotica
-   i microdati vanno igienizzati
    -   rimozione di ogni _identificatore esplicito_
        -   non sufficiente in quanto ancora suscettibile a **linking attack**
            -   attacco incrociando i dati con database pubblici
            -   2001 Latanya Sweeney ri-identifica il fascicolo medico del governatore del Massachusetts
                -   una _join_ sulle tabelle e gli attributi in comune
    -   nel 1990 negli US l'87% della popolazione era identificata univocamente dalla combinazione di data di nascita, genere, zipcode

Gli attributi nei microdati:

-   identificatori espliciti
-   quasi identificatori
    -   permettono di ri-identificare individui
    -   Tore Sinusoidale, 1986: quasi-identifiers sono attributi che non sono identificatori unici di per se, ma possono essere combinati con altri quasi-identifiers per creare un identificatore esplicito
-   attributi sensibili
    -   possono non esistere e portano informazioni sensibili

L'obiettivo della preservazione della privacy è di **de-associare** gli individui dalle loro **informazioni sensibili**.

**Membership Disclosure**:

-   c'è una alta probabilità che un quasi-identifier sia unico per una popolazione
-   ma generalizzare e sopprimere quasi-identifier nel dataset non cambia la loro distribuzione nella popolazione
-   questo implica che la \\(k\\)-anonymity **non può nascondere** se un individuo è presente o meno nel dataset

Quindi il problema ora cambia: il rischio è la disclosure della presenza o meno di un individuo nel dataset anonimizzato.

-   esempi: dataset di contro-terrorismo, ricerca medica su una specifica malattia


#### k-anonymity {#k-anonymity}

-   il dataset rilasciato deve continuare a contenere l'informazione veritiera
    -   generalizzata ma comunque coerente
-   Samarati, Sweeney 1998
-   basato sulla definizione di quasi-identifier

-   def.
    -   \\[A = \\{a\_1, \dots , a\_n\\}\\] definito su \\(n\\) attributi e dataset \\(D\\)
    -   un **quasi-identifier** di \\(D\\) è un set di attributi \\(QI \subseteq A\\) di cui il rilascio va controllato
    -   \\(D\\) soddisfa la \\(k\\)-anonymity `iff` per ogni quasi-identifier ciascuna sequenza di valori degli attributi contenuti appare **almeno** \\(k\\) volte in \\(D\\)
    -   gli **attributi sensibili** non sono considerati da questo framework

Quindi

-   si nascondono gli individui tra altri \\(k-1\\) individui
-   un _linking attack_ non può identificare con una confidenza \\(> \frac{1}{k}\\)

Per ottenere una \\(k\\)-anonymity si agisce per **generalizzazioni** e **soppressione**

-   secondo la definizione di gerarchia
-   la soppressione può ridurre la quantità di generalizzazione necessaria per soddisfare il constraint di \\(k\\)-anonymity
-   si possono rimuove outlier se ritenuto necessario

Un **domain generalization hierarchy** (gerarchia di dominio) \\(DGH\_D\\) di un attributo \\(A\\) è un ordine parziale sull'insieme dei domini \\(Dom\_A = \\{D\_0,\dots ,  D\_n\\}\\) che soddisfa le condizioni:

1.  ogni dominio \\(D\_i\\) ha almeno un dominio generalizzato diretto
2.  tutti gli elementi massimali di \\(Dom\\) sono singleton
    -   per garantire che tutti i valori in ogni dominio possano essere generalizzati a un singolo valore

La relazione di generalizzazione di valore associa per ogni valore in un dominio \\(D\_i\\) un unico valore nel dominio \\(D\_j\\) che ne sia generalizzazione diretta.
\\(VGH\_D\\) è l'albero formato dalle relazioni di generalizzazione sui domini.
Data una tupla \\(DT = \lang D\_{A1}, \dots , D\_{A2} \rang\\) in modo che \\(D\_{Ai}\\) in \\(Dom\_{Ai}\\), la **domain generalization hierarchy** di \\(DT\\) è \\(DGH\_{DT} = DGH\_{D\_{A1}} \times \dots \times  DGH\_{D\_{An}}\\).
\\(DGH\_{DT}\\) definisce il reticolo (_lattice_) cui elemento minimo è \\(DT\\).

Si definiscono generalizzazioni di tabelle \\(T\_i \le T\_{j}\\)

-   il dominio di ogni attributo in \\(T\_j\\) è uguale o generalizzazione del dominio dello stesso in \\(T\_i\\)
-   ogni tupla in \\(T\_j\\) ha una corrispondenza dove per ogni attributo questo sia uguale o una generalizzazione

Si definisce il **vettore di distanza** di \\(T\_j\\) da \\(T\_i\\) come la lunghezza del cammino unico tra i domini degli attributi.

-   maggiore distanza dalla radice significa maggiore generalizzazione
-   quindi va massimizzata l'utilità con il minimo **distance vector** che soddisfi \\(k\\)-anonymity

Una \\(T\_j\\) è una generalizzazione \\(k\\)-minima (\\(k\\)-**minimal generalization**)

-   soddisfa \\(k\\)-anonymity
-   lo soppressione è minima
-   la differenza di numero di tuple tra \\(T\_i\\) e \\(T\_j\\) deve stare sotto il threshold
-   il vettore di distanza è minimo rispetto a ulteriori generalizzazioni

Il problema di trovare la minima tabella \\(k\\)-anonima con generalizzazione e soppressione è \\(\textsc{NP}\text{-hard}\\).

-   la maggioranza degli algoritmi proposti in letteratura hanno tempo di computazione esponenziale nel numero di attributi componenti il quasi-identifier.
-   quando il numero \\(|\textsc{QI}|\\) di attributi del quasi-identifier è piccolo rispetto il numero di tuple nella tabella privata questi algoritmi possono essere pratici

<!--list-separator-->

-  Samarati's Algorithm

    -   basato su **generalizzazione localmente minima**
    -   ogni generalizzazione k-minima è localmente minima rispetto al path (il contrario non è vero)
    -   risalendo la gerarchia il numero di tuple da rimuovere per garantire la k-anonimity diminuisce
    -   l'algoritmo svolge una ricerca binaria sul reticolo dei distance vectors
        1.  si valutano soluzioni ad altezza \\(\lfloor h/2 \rfloor\\)
        2.  se esiste soluzione si valuta ad altezza \\(\lfloor h/4 \rfloor\\); se non esiste si valuta ad altezza \\(\lfloor 3h/4 \rfloor\\)
        3.  si continua finché l'algoritmo non raggiunge l'altezza minima per cui si soddisfa \\(k\\)-anonymity
    -   per diminuire il costo computazionale si utilizza un **distance vector matrix** per evitare computazione esplicita per ogni tabella generalizzata

<!--list-separator-->

-  Incognito Algorithm

    -   approccio **bottom-up** nella visita di \\(\textsc{DGHs}\\)
    -   la \\(k\\)-anonymity rispetto un sottoinsieme proprio di quasi-identifier \\(\textsc{QI}\\) è una condizione **necessaria** e non sufficiente per la \\(k\\)-anonymity rispetto a \\(\textsc{QI}\\).
        -   se non è soddisfatta da un sottoinsieme stretto allora non sarà nemmeno soddisfatta da un sottoinsieme più grande
    -   iterazione dopo iterazione parte da attributi singoli testando k-anonymity per poi combinare quelli che la soddisfano
    -   iterazione \\(i\\): combina tutte le \\(i\\)-uple di attributi ottenute dalla combinazione di generalizzazioni che soddisfavano k-anonymity a \\(i-1\\), scarta le soluzioni non k-anonime
    -   l'iterazione \\(|\textsc{QI}|\\) ritorna il risultato finale

    Sfrutta le proprietà di generalizzazione e di sottoinsieme: _rollup_ e _apriori_.

<!--list-separator-->

-  Mondrian Algorithm

    {{< figure src="https://64.media.tumblr.com/914b055f301a5804f173e87f5cf9fa1f/54caa079496cfc2d-2e/s500x750/20ffb446155d64ac747ff936c53b8e51807a44d5.png" >}}

    -   ogni attributo in \\(\textsc{QI}\\) rappresenta una dimensione
    -   ogni tupla è un punto nello spazio definito
    -   tuple con lo stesso valore \\(\textsc{QI}\\) sono rappresentate associando il numero di occorrenze
    -   lo spazio multidimensionale viene partizionato con split sulle dimensioni in maniera che ogni area contenga _almeno_ \\(k\\) occorrenze di punti
    -   tutti i punti in una regione sono generalizzati a un unico valore
    -   le tuple corrispondenti vengono sostituite dalla generalizzazione computata
    -   misura di **utilità** dei raggruppamenti (**Discernability Metric**)
        -   penalizza ogni tupla con la grandezza del gruppo di appartenenza
        -   il raggruppamento ideale è quello in cui tutti i gruppi hanno grandezza \\(k\\)
        -   si cerca di costruire gruppi con grandezza circa uguale \\(k\\)
    -   si partiziona alternando man mano la dimensione con cui si sceglie la partizione
    -   la `DM` non misura quanto simili siano gli elementi del gruppo
        -   si aggiunge una nuova metrica: **normalized certainty penalty** `NCP`
            -   misura il perimetro del gruppo
            -   long boxes, bad generalization
            -   squares, good generalization

<!--list-separator-->

-  Topdown Algoritm

    -   inizia con il dataset completo
    -   split iterativamente a metà
    -   continua fino a gruppi con meno di \\(2k -1\\) tuple
    -   algoritmo di split:
        -   trova _seeds_, 2 punti massimamente lontani tramite euristiche
        -   questi semi crescono diventando i due gruppi di split
        -   esamina punti casualmente assegnandoli al gruppo cui `NCP` cresce **meno**

<!--list-separator-->

-  Generalization Strength

    -   single dimensional global recoding
        -   incognito, samarati
    -   multi dimensional global recoding
        -   mondrian
    -   multi dimensional local recoding
        -   topdown
        -   massima forza di generalizzazione


#### l-diversity {#l-diversity}

_Privacy Beyond k-Anonymity_

-   diversificare i gruppi di tuple k-anonime sulla base degli attributi sensibili
-   **homogeneity attack**
    -   vanno evitati gruppi così omogenei anche se k-anonimi
-   **background knowledge attack**
    -   si possono inferire facilmente attributi sensibili con conoscenza sull'individuo che permetta di escludere delle possibilità
-   **positive/negative disclosure**
    -   positiva se l'avversario può correttamente identificare valori sensibili con alta probabilità, negative se può eliminare dei possibili valori con alta probabilità

-   q\*-block
-   **lack of diversity**
-   assicurare la diversità all'interno di un q\*-block
    -   almeno \\(l \ge 2\\) valori sensibili in modo che gli \\(l\\) valori più frequenti abbiano all'incirca la stessa frequenza
    -   quindi il q\*-block è ben rappresentato da \\(l\\) valori sensibili
-   ad un attaccante servono \\(l-1\\) possibili pezzi di background knowledge per eliminare dei possibili valori sensibili e inferire una _positive disclosure_
-   una tabella è \\(l\\)-diversa se ogni q\*-block è \\(l\\)-diverso

Si definisce la **entropy** \\(l\\)-diversity:

\\[- \sum p(q\*,s) \log (p(q\*,s)) \ge \log(l)\\]

-   quindi l'entropia della probabilità \\(p(q\*,s)\\), che è la frazione di tuple nel q\*-block con attributo sensibile uguale a \\(s\\)
-   si dimostra il **teorema di monotonicità della \\(l\\)-diversity** rispetto alla sua entropia
    -   se una tabella la soddisfa allora qualsiasi sua generalizzazione la soddisfa a sua volta
    -   da questo _consegue_ che ogni algoritmo di \\(k\\)-anonymity può essere esteso per mantenere la proprietà di \\(l\\)-diversity

Questo approccio lascia spazio a alcuni attacchi:

-   **skewness attack**
    -   accade quando la distribuzione in un q-blocco è diversa da quella della popolazione originale
-   **similarity attack**
    -   accade quando un q-blocco ha valori sensibili diversi ma semanticamente simili per l'attributo sensibile


#### t-closeness {#t-closeness}

Una classe di equivalenza (q\*-block) ha come proprietà la \\(t\\)-closeness se la distanza tra la distribuzione di un attributo sensibile in questa classe e la sua distribuzione nella tabella non supera il threshold \\(t\\).

-   una tabella è \\(t\\)-close se tutte le classi di equivalenza hanno \\(t\\)-closeness
-   la _closeness_ tra due distribuzioni \\(P\\) e \\(Q\\) limita la quantità di informazioni utili rilasciata perché limita l'informazione sulla correlazione tra quasi-identifier e attributi sensibili
    -   se questa correlazione è troppo chiara allora si ha una _attribute disclosure_, quindi va limitata
    -   il parametro \\(t\\) permette il **trade-off** tra utilità e privacy
        -   basso: privacy - alto: utilità

Misure di distanza:

-   **Variational distance**

\\[D[P,Q] = \sum\_{i=1}^{m} \frac{1}{2} | p\_i - q\_i |\\]

-   **Kullback-Leibler distance**

\\[D[P,Q] = \sum\_{i=1}^{m} p\_{i} \log\frac{p\_{i}}{q\_{i}}\\]

Queste non tengono in considerazioni le differenze semantiche, per questo la \\(t\\)-closeness utilizza la **Earth Mover Distance** `EMD`.
\\[D[P,Q] = \sum\_{i=1}^{m} \bigg| \sum\_{j=1}^i r\_j\bigg|\\]
Per attributi categorici _flat_ (senza gerarchia):
\\[D[P,Q] = \sum\_{i=1}^{m} \frac{1}{2}|p\_{i}-q\_{i}|\\]

Per attributi categorici gerarchici:
\\[D[P,Q] = \sum\_{N} cost(N)\\]

-   \\(cost(N)\\) è il costo di muoversi tra i figli del nodo \\(N\\)

Il problema di questo approccio è che un avversario può comunque inferire con background knowledge di attributi sensibili dei quasi-identificativi che possono essere comunque un problema di privacy.

-   ogni attributo è potenzialmente un quasi-identifier


#### delta-presence {#delta-presence}

-   tabella privata \\(\textsc{PT}\\) e una sua generalizzazione \\(\textsc{GT}\\)
-   \\(\delta = (\delta\_{min}, \delta\_{max})\\)
    -   range di probabilità accettabili per \\(P(t\in \textsc{PT} | \textsc{GT})\\)
-   per questa proprietà vale la monotonicità
    -   quindi può essere sfruttata e integrata in algoritmi di  \\(k\\)-anonimity
-   selezione di una buona \\(\delta\\)
    -   dato un belief a priori \\(b\_r\\) e belief a posteriori \\(b\_o\\)
    -   costo atteso \\(c\\) basato su un misuso del dataset
    -   costo totale \\(d\\)
    -   su possono calcolare \\(\delta\\) massimo e minimo


### Differential Privacy {#differential-privacy}

-   database statistici
-   modelli machine learning e data analysis
-   cambio di paradigma di privacy
    -   come rilasciare dati senza utilizzare pulizia dei dati, termini di servizio di utilizzo dati, restrizioni di view
    -   **Fundamental Law of Information Recovery**: dare risposte troppe accurate a troppe query distrugge inevitabilmente la privacy
-   estrarre informazioni sulla popolazione senza apprendere nulla su individui
    -   la partecipazione o no di un dato individuo a uno studio statistico è irrilevante sugli outcome dello studio e l'impatto che questo può avere poi sull'individuo

La **Differential Privacy** è una definizione, non un algoritmo, introdotta da Cynthia Dwork nel 2006:

-   assicura che le stesse conclusioni saranno raggiunte indipendentemente dalla partecipazione o meno di un individuo al dataset
-   specificatamente, assicura che ogni sequenza di output (risposte a query) sono _praticamente_ egualmente probabili data la presenza o assenza di uno qualsiasi degli individui

2 modelli:

-   non-interactive, offline
    -   curatore produce un database sintetico o igienizzato che rispetta la `DP`
-   interactive, online
    -   il database è tenuto chiaro e viene modificata la risposte alle query
-   simplesso di probabilità \\(\Delta(B)\\)
-   **algoritmo randomizzato**: \\(\mathcal{M}\\) con dominio \\(A\\) e range discreto \\(B\\) associato con un mapping \\(\mathcal{M}: A\to \Delta(B)\\). Su input \\(a \in A\\), l'algoritmo \\(\mathcal{M}\\) da output \\(\mathcal{M}(a) = b\\) con probabilità \\((\mathcal{M}(a))\_b \forall b \in B\\).
-   database \\(D\\) collezione di record di un universo \\(\mathcal{D}\\)
-   distanza tra database \\(l\_{1}\\) numero di record di cui differiscono, norma della differenza
    -   \\(|| D\_1 - D\_2 ||\_1\\)

La `DP` promette di proteggere gli individui da rischio addizionale dato dalla loro partecipazione al dataset.
Anche  se gli individui potrebbero avere danni una volta che i risultati \\(\mathcal{M}(D)\\) di un meccanismo `DP` \\(\mathcal{M}\\) sono rilasciati, la `DP` assicura che la probabilità che questo danno avvenisse non è stata significatamente aumentata dalla loro partecipazione.

-   il _rischio_ sarebbe stato lo stesso indipendentemente dalla partecipazione

La `DP` non può assicurare che informazione segrete rimangano tali, se i risultati statistici mostrano forti correlazioni tra attributi privati e attributi pubblicamente osservabili questa non infrange la `DP` ma può essere un rischio per la privacy dell'individuo.

Spesso è necessario **combinare** diversi meccanismi di `DP`, si dimostra che la combinazione rimane `DP` ma i parametri \\(\epsilon\\) e \\(\delta\\) devono necessariamente degradare.

-   teoremi di composizione sequenziale e parallela


#### \\(\epsilon\\)-differential privacy {#epsilon-differential-privacy}

\\(\mathcal{M}\\) con dominio \\(\mathcal{D}\\) è \\(\epsilon\\)-differentially private se \\(\forall S \subseteq \text{Range}(\mathcal{M})\\) e \\(\forall D\_1, D\_2 \subseteq \mathcal{D}: || D\_1 - D\_2 ||\_1 \le 1\\) :
\\[\frac{\text{Pr} [\mathcal{M}(D\_1) \in S]}{\text{Pr} [\mathcal{M}(D\_2) \in S]} \le e^{\epsilon} \simeq 1 \pm \epsilon\\]

-   se le due probabilità sono il più possibile vicine tra loro, o meglio il rapporto è il più possibile vicino a 1, e più diventa difficile distinguere se la risposta è stata data dal primo o dal secondo dataset
    -   quindi l'algoritmo randomizzato da una risposta privata
    -   quindi per \\(\epsilon\\) piccole
    -   \\(\epsilon\\) è chiamato **privacy budget**
        -   indica il livello di budget che va rispettato dal meccanismo

la group differential privacy è definita ugualmente ma considerando gruppi di tuple e quindi distanze superiori a 1:
\\[\frac{\text{Pr} [\mathcal{M}(D\_1) \in S]}{\text{Pr} [\mathcal{M}(D\_2) \in S]} \le e^{k\epsilon}\\]


#### \\((\epsilon, \delta)\\)-differential privacy {#epsilon-delta--differential-privacy}

\\(\mathcal{M}\\) con dominio \\(\mathcal{D}\\) è \\((\epsilon,\delta)\\)-differentially private se \\(\forall S \subseteq \text{Range}(\mathcal{M})\\) e \\(\forall D\_1, D\_2 \subseteq \mathcal{D}: || D\_1 - D\_2 ||\_1 \le 1\\) :
\\[\text{Pr}[\mathcal{M}(D\_1) \in S] \le e^\epsilon \text{ Pr}[\mathcal{M}(D\_2) \in S] + \delta\\]

-   la differenza con la &epsilon; privacy è che assicura che per ogni lancio di \\(\mathcal{M}(D)\\) l'output che osservo è quasi ugualmente probabile osservarlo da ogni database nel vicinato simultaneamente
-   per ogni coppia di database vicini è molto improbabile che il valore osservato sia più o meno probabilmente generato dal primo o dal secondo database
-   \\(\delta\\) aggiunge un termine di tolleranza
-   è una versione rilassata della `DP`


#### Randomization Mechanism {#randomization-mechanism}

Partecipanti al survey:

1.  lancia moneta
2.  croce, di verità
3.  testa, lascia altra moneta e rispondi _Si_ per testa e _No_ per croce

Questa versione è \\(ln(3)\\)-differenzialmente privato.

Data una funzione \\(f: \mathcal{D} \to \mathbb{R}^k\\)

Si considera la **sensibilità della funzione** (global sensitivity) per avere un upper-bound sulla perturbazione applicabile al output per preservare la privacy:
\\[ \Delta f = \max\_{D\_1,D\_2 \in \mathcal{D}} || f(D\_1) - f(D\_2) ||\_1\\]
dove \\(||D\_1 - D\_2 ||\_1 = 1\\)

-   cattura l'impatto per cui il dato di un individuo può cambiare \\(f\\) nel caso peggiore


#### Laplace Mechanism {#laplace-mechanism}

Una definizione di rumore per questa applicazione è la funzione di **Laplace**.
\\[X \sim Lap(\mu, b)\\] se
\\[p(x) = \frac{e^{-\frac{|x-\mu|}{b}}}{2b}\\]

-   varianza: \\(\sigma^2 = 2b^{2}\\)

Definizione di meccanismo di Laplace:
\\[\mathcal{M}\_{\mathcal{L}} (D, f(\cdot) , \epsilon) = f (D) + Y\_1 , \dots, Y\_k\\]

-   le \\(Y\_i\\) sono random variables tratte da Laplace \\(\text{Lap}(\Delta f/\epsilon)\\)

Si dimostra teorema per cui questo meccanismo preserva la \\(\epsilon\\)-differential privacy

-   sensibilità bassa significa distorsione piccola
-   piccolo privacy budget significa maggiore distorsione
    -   i.e. voglio più privacy e quindi devo perturbare di più

<!--list-separator-->

-  Esempi

    **Counting Queries**

    -   base di molti task
    -   sensibilità è 1, chiaramente il cambiamento di un record modifica di 1 l'output
    -   noise: \\(\text{Lap}(1/\epsilon)\\)
    -   distorsione attesa di \\(1/\epsilon\\), indipendente dalla dimensione del database

    **Multiple Counting Queries**

    -   ogni individuo può cambiare conteggio nel caso pessimo con \\(m\\) nel gruppo
    -   distorsione attesa \\(m/\epsilon\\)

    **Histogram Queries**

    -   caso particolare di query strutturalmente disgiunte, non serve scalare la noise con numero di query
    -   l'universo \\(\mathcal{D}\\) è partizionato in celle, la query chiede un conteggio in ogni cella
    -   le celle sono disgiunte e quindi modifiche non interferiscono tra celle diverse
    -   si ricade nel caso di **Counting Query** e la sensibilità è 1

    **Mean Query**

    -   media su quantità uniformemente distribuita in intervallo \\([\alpha, \beta]\\)
    -   con \\(n\\) istanze la sensibilità è \\((\beta - \alpha) / n\\)
    -   noise: $\text{Lap}((&beta; - &alpha;)/n&epsilon;)


#### Exponential Mechanism {#exponential-mechanism}

-   caso in cui \\(f: \mathcal{D} \to \mathcal{R}\\) viene valutata da una utility function \\(u: \mathcal{D} \times \mathcal{R} \to \mathbb{R}\\)
    -   utility score alto più desiderabile
-   un meccanismo additivo (come quello di Laplace) può distruggere i risultati perché un piccolo noise può risultare in un grande cambiamento nella utility function
-   il limite del meccanismo di Laplace è che inoltre può essere applicato solo a query numeriche in \\(\mathbb{R}^k\\) e non un generico \\(\mathcal{R}\\).
    -   questo in caso non esista una funzione di utilità che trasporti i risultati ai reali

La soluzione è calcolare la sensibility sulla utility function
\\[\Delta u := \max\_{r \in \mathcal{R}} \max\_{D\_1, D\_2 \in \mathcal{D}} |u(D\_1,r) - u(D\_2,r)|\\]
con \\(|| D\_1 - D\_2||\_1 = 1\\)

E utilizzarla con un meccanismo differente ovvero il meccanismo esponenziale, applicabile anche a funzioni non solamente nei reali.

\\[\mathcal{M}\_E(D,u,\epsilon) = R\\]
con \\(R\\) random variable con valori in \\(\mathbb{R}\\) tali che:
\\[ P(R = r) = e^{\frac{\epsilon u(D,r)}{2\Delta u}}\\]

-   produce un output \\(r\in \mathcal{R}\\) con probabilità proporzionale a \\(u(D,r)\\), il risultato più probabile è quello per cui l'utilità è massimizzata
-   si prova che il meccanismo è molto accurato
    -   molto improbabile che \\(r\\) abbia utility score inferiore alla massima utilità

Si dimostra teorema per cui questo meccanismo preserva la \\(\epsilon\\)-differential privacy.


#### Empirical Risk Minimization {#empirical-risk-minimization}

`ERM` utilizza due componenti, una un regolarizzatore che misura la complessità del modello e un rischio dato da una loss function.
Il classificatore lineare è basato sulla funzione:
\\[f(D) = \text{argmin}\_w \frac{1}{2} \lambda ||w||^2 + \frac{1}{n} \sum\_{i=1}^n L(c\_j w^T d\_i)\\]
Teorema, con \\(||d\_i|| \le 1\\) e L che è 1-Lipschiz (limitata), allora, per ogni \\(D\_1,D\_2\\) con \\(||D\_1 - D\_2||\_1 \le 1\\):
\\[|| f(D\_1) - f(D\_2) ||\_2 \le \frac{2}{\lambda n}\\]


#### Differentially Private ERM {#differentially-private-erm}

Si aggiunge a `ERM` una perturbazione dell'output, sono possibili:

-   output perturbation
-   objective perturbation

In base alla funzione di loss utilizzata si possono creare versioni privatizzate di diversi task di machine learning:

-   L = Logistic Loss \\(\to\\) Private Logistic Regression
-   L = Huber Loss \\(\to\\) Private Support Vector Machine


### Privacy in Distributed Systems {#privacy-in-distributed-systems}

-   vari nodi raccolgono dati
    -   poi aggregati per _data analysis_
-   **Data Warehouse Approach**
    -   approccio storico
    -   la _warehouse_ centrale raccoglie i dati dai nodi distribuiti
    -   la data analysis e machine learning si interfacciava a questa warehouse
    -   non garantisce privacy, singolo punto di vulnerabilità e inoltre grande necessità di potenza di analisi centralizzata
    -   la _data fusion_ può avere un overhead importante
    -   l'approccio non è più efficace con la mole di dati odierna
-   **Local Data Analysis Approach**
    -   viene eseguita data analysis sui dati locali in nodi distribuiti
    -   questi vengono condivisi con un _Data Analysis Combiner_
    -   meglio per la privacy, vengono condivisi risultati intermedi dell'analisi e non i dati stessi
-   necessità di accedere a dati distribuiti ma in maniera privata
    -   governi e agenzie pubbliche
        -   necessità di aggregare dati per la comunità
        -   problema di privacy rispetto ai singoli individui
    -   collaboratori industriali e gruppi di commercio
        -   alcune pratiche sono segreti aziendali
        -   condividere i dati senza svelare tutto
            -   in questo caso si tratta di un problema di confidenzialità e non di privacy
    -   multinazionali
        -   raccolta di dati in diverse nazioni e necessità di analisi generale
        -   nel rispetto di leggi nazionali che proteggono dal esportazione transnazionale dei dati personali

Soluzioni possibili:

-   _data obfuscation_
    -   nessuno vede i dati reali
-   _summarization_
    -   solo i fatti necessari sono esposti
-   _data separation_
    -   i dati rimangono nei nodi fidati


#### Data Separation {#data-separation}

-   approccio
    -   dati mantenuti in possesso dei creatori/possessori
    -   rilascio limitato a terze parti fidate
    -   operazioni/analisi eseguite dalle terze parti
-   problemi
    -   volontà di eseguire l'analisi delle terze parti
    -   data disclosure dai risultati dell'analisi

Approcci diversi:

-   functional encryption
    -   generalizzazione di public-key encryption
    -   il possesso di una chiave segrete permette di capire una funzione di ciò che è criptato
-   fully homomorphic encryption
    -   forma di criptazione che permette di ottenere la versione criptata dei risultati tramite la computazione degli input criptati
-   federated learning

<!--list-separator-->

-  Secure Multiparty Computation

    -   `SMC`
    -   multiparty, inteso effettivamente come 2-party
        -   vanno tenute in considerazione le complicazioni
    -   **Yao's Milionaire's problem**
        -   computazione sicura tramite un circuito
        -   **securely compute gate**
        -   condivisione di dati rumorosi tra i party
        -   risolto poi tramite **oblivious transfer**
            -   **A** manda chiave pubblica \\(p\\) a **B**
            -   questo selezione 4 random values
                -   uno lo sceglie per criptarlo tramite \\(p\\)
            -   **A** non sa quale sia quello scelto, quindi decripta tramite chiave privata tutti i valori e rimanda a **B** il risultato dell'operazione tra i suoi dati e tutti e 4 i valori ricevuti
            -   **B** sa quale dei 4 è quello che aveva scelto e quindi lo cripta nuovamente con \\(p\\) e restituisce il risultato finale

    **Esempio di utilizzo**

    -   costruzione degli alberi decisionali
    -   partizionamento orizzontale 2-party
    -   schema `db` condiviso
    -   tuple private
    -   algoritmo `ID3`
        -   scelta di split con **entropy** minima o **information gain** massima
    -   protocollo detto _semi-onesto_, si mantengono le computazioni intermedie
    -   calcolo del conteggio della classe di maggioranza nei nodi foglia
        -   protocollo di **Yao**
            -   input numero di tuple di ciascuna classe nei due dataset \\(D\_1,D\_2\\)
            -   output indice \\(i\\) dove la somma numero di tuple dei due dataset della classe \\(i\\) è massima
    -   transazioni con lo stesso valore di classe, va restituito nodo foglia di classe \\(c\\)
        -   rappresentiamo le foglie con più di una classe con un simbolo diverso da \\(c\_i\\) fisso
        -   forzare i party a dare come input il simbolo fissato o \\(c\_i\\)
        -   controllare l'eguaglianza per decidere se la foglia ha classe \\(c\_i\\), qui si utilizza la `SMC`
    -   calcolo dell'entropia
        -   si utilizza **Yao** per una non ottima approssimazione di \\(\ln(x)\\)
            -   tramite serie di **Taylor** con \\(n\\) membri
        -   quindi che la soluzione sicura è una approssimazione

<!--list-separator-->

-  Federated Learning

    > Permette di addestrare algoritmi tra multiple nodi o server decentralizzati in possesso di data sample locali, senza scambiarli.

    -   collaborative learning with no data sharing
    -   `FL` è una modalità di machine learning dove multiple entità (client) collaborano alla soluzione del task
    -   un server centrale coordina, detta **aggregator**
    -   _raw data_ non lascia i client e rimangono locali
    -   `FL` orizzontale, ogni client ha un sottoinsieme degli esempi
    -   `FL` verticale, ogni client ha potenzialmente tutti gli esempi ma solo una parte delle feature

    **Assunzioni**:

    -   parametri del modello non contengono più informazioni che i dati di addestramento
    -   la dimensione del modello è generalmente più piccola della dimensione dei dati di addestramento

    **Goal**:

    -   _confidentiality_, i client non condividono i loro dati
    -   _usefulness_, i client giovano dalla federazione

    **Desired**:

    -   che il _federated model_ sia simile a quello centralizzato

    Protocollo generale:

    1.  aggregatore inizializza modello globale e lo condivide con i client
    2.  i client aggiornano il modello utilizzando i loro dati privati
    3.  l'aggregatore aggrega i modelli aggiornati
    4.  il processo si ripete fino a convergenza (l'apprendimento avviene a _round_)

    **Problemi**:

    -   _non-IID_, dati generati da utenti non omogenei
    -   _unbalanced_, alcuni utenti generano quantità di dati maggiori
    -   _massively distributed_, utenti device mobile offrono molti più dati della media
    -   _limited communication_, mobile network instabile

    <!--list-separator-->

    -  FedSGD

        -   ogni round uno step di discesa del gradiente
        -   `FL` con una **C-fraction** dei client, secondo diversi criteri
            -   solitamente molto piccolo rispetto la totalità
        -   ogni client \\(k\\) computa gradiente \\(g\_k\\) sui propri dati locali
            -   single batch

        Alternative:

        1.  ogni client invia \\(g\_k\\)
            -   aggregatore aggrega i gradienti e genera nuovo modello
            -   \\(w\_{t+1} \leftarrow w\_t - \eta \nabla f(w\_t) = w\_t - \eta \sum\_{k=1}^{K} \frac{n\_{k}}{n}g\_k\\)
        2.  ogni client computa \\(w\_{t+1}^k \leftarrow w\_t - \eta g\_k\\)
            -   aggregatore aggrega
            -   \\(w\_{t+1} \leftarrow \sum\_{k=1}^K \frac{n\_{k}}{n} w\_{t+1}^k\\)

        Altamente inefficiente, in quanto ogni round viene inviato e ricevuto un modello.

    <!--list-separator-->

    -  FedAvg

        -   in un round
        -   broadcast del modello globale corrente ai client
        -   ogni client \\(k\\) computa gradiente sui dati locali
        -   agisce come alternativa n.2 di `FedSGD`
        -   ogni client computa \\(E\\) epoche alla volta
            -   per \\(E=1\\) e batch size \\(=n\_k\\) `FedSGD` = `FedAvg`
        -   funziona discretamente bene
        -   **ma** non garantisce la convergenza lineare anche con funzioni di loss fortemente convesse e smooth
            -   questo in quanto i dati locali possono avere distribuzioni molto diverse e portare a divergenza dall'ottimo

    <!--list-separator-->

    -  Gossip Federated Learning

        -   una soluzione decentralizzata, solo client
        -   ogni nodo inizializza il modello
        -   a cadenza regolare si inviano modelli tra peer
        -   i modelli vengono integrati e condivisi tra peer a loro volta

    <!--list-separator-->

    -  Considerazioni sulla Privacy

        -   l'assunzione che il `FL` non dia leak di dati privati non è vera
        -   il modello provoca leak di informazioni sui training data
        -   si è dimostrato un teorema per cui l'input al network può essere ricostruito a partire dei soli gradienti della rete

        Quindi possono esistere attaccanti in contesto di `FL`:

        -   **semi-honest**, avversari sono passivi oppure onesti ma curiosi
            -   può imparare lo stato privato dei partecipanti senza deviare dal protocollo
        -   **malicious**, avversari che cercano di imparare gli stati privati dei partecipanti, deviando dal protocollo modificando, riproducendo, rimuovendo messaggi

        Attacchi:

        -   **membership inference**, inferire se dei dati appartengono al training dataset
        -   **model inversion**, imparare i dati utilizzati per il training

        C'è bisogno di metodi di protezione.

        -   **homomorphic encryption**
            -   client criptano i modelli
            -   aggregatore aggregano i modelli criptati e inviano i modelli criptati ai client
            -   necessità una grande potenza computazionale, in ambito smartphone non è ragionevole
        -   **differential privacy**
            -   local `DP`, il _noise_ viene aggiunto al modello da parte dei client prima di inviarlo al server
                -   protegge anche in caso di server maliziosi
                -   tutti gli aggiornamenti del modello sono noisy e modificano l'andamento del training e deteriorano la performance finale
            -   global `DP`, _noise_ aggiunto server-side
                -   il training è meno affetto dal cambiamento anche se non ideale
                -   il server può vedere gli update del modello in chiaro, e può quindi eseguire degli attacchi di inferenza
        -   **secure aggregation**
            -   classe di algoritmi di `SMC`
            -   non si rivelano le parti dell'aggregato tramite l'uso di maschere che si elidono a vicenda a seguito dell'aggregazione
            -   ogni coppia di utenti si accordano sulla perturbazione degli input
            -   garantisce privacy perfetta ma si assume la partecipazione da parte di tutti gli utenti e che la comunicazione sia perfetta


## Etica &amp; Società {#etica-and-società}


### Metafora {#metafora}

-   partendo da [Metaphors We Live By]({{< relref "20231123030545-metaphors_we_live_by.md" >}}) di [George Lakoff]({{< relref "20231123030705-george_lakoff.md" >}})
-   mapping matematico (o meglio **omomorfismo**) tra concetti complessi della vita e un dominio più semplice da rappresentare
-   il nostro cervello utilizza questo meccanismo perché non conosciamo le conseguenze delle nostre azioni, il problema è troppo complesso
    -   quindi semplifica

-   causalità e tempo sono esempi di domini che non conosciamo bene quanto crediamo e per i quali utilizziamo linguaggio metaforico per farne riferimento
    -   si riconducono a qualcosa di più conosciuto
    -   anche la tecnologia la concettualizziamo in questo modo


#### Conoscenza Esplicita e Tacita {#conoscenza-esplicita-e-tacita}

-   teorizzata dal filosofo e economista [Michael Polanyi]({{< relref "20231123031310-michael_polanyi.md" >}})[^fn:1]
-   la conoscenza di cui siamo coscienti non è tutta, il _gap_ è tacito in quanto non esprimibile dal linguaggio e non accessibile alla coscienza
    -   la c. tacita tratta la pratica, che non è trasmissibile o comunicabile
    -   altro esempio sono le regole del linguaggio
    -   altro esempio è la logica, il ragionare è una c. tacita di cui non siamo coscienti di come funzioni
    -   la percezione, utilizziamo linguaggio metaforico per descriverla
    -   la nostra dimensione emotiva[^fn:2]
        -   questa intelligenza non la conosciamo, a volte solamente a posteriori o tramite empatia capiamo i nostri stati emotivi


#### Realtà Sociale {#realtà-sociale}

-   da [The Construction of Social Reality]({{< relref "20231123032542-the_construction_of_social_reality.md" >}})
-   non è data ma creata da noi
    -   tutto è deciso da regole **costitutive** ideate dalla collettività
-   la **realtà costruita** costituisce la gran parte della nostra realtà vissuta
    -   la tecnologia sta sempre più cambiando le regole e la realtà in cui viviamo
        -   non cambia fatti naturali ma piuttosto nostre costruzioni sociali


#### Linguaggio {#linguaggio}

-   descrive il vero? no
-   può formulare domande, ordini, richieste
    -   tramite formule linguistiche definiamo e cambiamo le regole che regolano il mondo in cui agiamo
-   [How to Do Things with Words]({{< relref "20231129074610-how_to_do_things_with_words.md" >}})

<!--list-separator-->

-  Requerimiento

    -   i conquistadores prima di conquistare con il massacro le terre indigene dichiaravano un _requerimiento_ con cui intimavano a cedere il terreno agli indigeni, in spagnolo ovviamente
    -   una sorta di assoluzione dall'etica tramite sovrastrutture e costrutti sociali

<!--list-separator-->

-  Cartesio

    -   porta una materia complessa nel campo della matematica
    -   permette di trattarla con linguaggio formale
    -   il corpo era tabù religioso
        -   Cartesio rompe questo tabù logicamente
        -   se lo spazio è studiabile matematicamente, e il corpo è uno spazio, posso studiare il corpo
        -   non posso studiare un corpo morto in movimento ma posso studiarlo tramite simulazione meccanica
            -   questo si applica oggi alla scienza cognitiva, la si può studia con la simulazione tramite intelligenza artificiale[^fn:3]


### Tecnologia {#tecnologia}

-   la tecnologia inizia con i Neanderthal e continua fino ora
-   la società inizia con la Mesopotamia 3000 anni prima di Cristo
    -   [Yuval Noah Harari]({{< relref "20210604121119-yuval_noah_harari.md" >}}) riconduce il passaggio alla **rivoluzione cognitiva**[^fn:4]
        -   l'uomo ha cominciato a descrivere entità, scenari e miti che non esistono
        -   quindi non la tecnologia ma l'organizzazione della società attraverso e attorno entità fittizie
            -   dei, nazioni, organizzazioni, SPA


#### Costruzioni Sociali {#costruzioni-sociali}

Le prime sono state le normative

-   codice di Amurabi
-   codice romano, primo codice moderno
    -   lo schiavo era gestito con una complessa legislazione
        -   gli schiavi svolgevano lavori e stipulavano contratti a loro volta a nome del padrone

I _robot_ sono assimilabili a moderni schiavi, come andrebbero gestiti?

-   potremmo rifarci al codice romano
-   come regolare la responsabilità da parte di un robot
    -   ora una macchina semi-autonoma deve essere _supervisionata_ dall'utente, se non c'è la colpa è dell'umano


#### Conventional Wisdom {#conventional-wisdom}

-   da [The Affluent Society]({{< relref "20231123033317-the_affluent_society.md" >}})
-   competizione tra giusto e accettabile
    -   in  una competizione il vantaggio strategico si trova in ciò che è accettabile, comodo
        -   il test del applauso pubblico influenza più del test della verità
-   teorie scientifiche e modi di fare possiedono una **inerzia** che supera anche il  momento in cui vengono smentite
    -   sono creazioni umane e per questo convenzionali e contengono i bias del nostro ragionamento


#### Panopticon {#panopticon}

Geremia Bentham 1791

-   se non sai mai quando sei controllato la tua percezione diventa quella di controllo costante
-   una torre centrale che può controllare in qualsiasi momento ogni luogo dell'edificio
-   nel mondo digitale le corporation aggregano dati di controllo costantemente e possono cederli se richiesto  a terzi
    -   in diritto si devono avere motivi fondati per inquisire su qualcuno, non basta un sospetto infondato
    -   il diritto sta venendo distorto a causa della tecnologia sempre più presente che non è ancora stata limitata a quel livello

Il cambio di prospettiva è:

-   ti comporti bene perché sai che **potresti** essere controllato
-   ti comporti bene perché **sei** controllato


### Liberismo {#liberismo}

-   [Adam Smith]({{< relref "adam_smith.md" >}})
    -   mano invisibile
        -   se ognuno segue il proprio fine egoistico il sistema ne gioisce per tutti
        -   ammissione di razionalità limitata
            -   non abbiamo un modello per cui tanto vale lasciare tutto al mercato
        -   il comunismo ha fallito per mancanza di informazione
            -   la tecnologia in un certo senso potrebbe risolvere il problema, una `AI` può predire e governare un sistema anche senza un modello
                -   una sorta di comunismo in mano a multinazionali private
    -   un artigiano non può parallelizzare il lavoro a differenza di una catena di montaggio
    -   meno conosciuto per le sue posizioni attente alle condizioni lavorative degli operai
-   F. Hayek premio nobel per il neoliberismo nel 1974
-   crisi a metà '70
    -   crisi petrolifera
    -   conflitti in medio-oriente
    -   da qui disconnessione tra produttività e compenso dei lavoratori
        -   mentre la produttività continua a crescere ma il compenso no
        -   il patto sociale nato con Ford tra capitalista e lavoratore viene meno
    -   l'industria smette di essere abbastanza profittevole
        -   gli investitori si spostano verso strumenti speculativi sulle borse
        -   sviluppo del mondo finanziario, che si sostiene attraverso bolle che poi a volte scoppiano ciclicamente
        -   '76 shareholder value movement
-   T.Piketty, sostiene che negli ultimi decenni i guadagni sui capitali eccedono il tasso di crescita economica
    -   questo porta a una divergenza negli stipendi
    -   conseguenze sociali anti-democratiche
        -   finanziamenti ai politici sempre più importanti da parte degli imprenditori
        -   nel 2016 grandi donazioni nei confronti del partito repubblicano per le presidenziali da parte di poche famiglie americane
    -   ci si muove verso oligarchia, forti spinte anti-sociali e anti-democratiche che vanno regolata dal legislatore
    -   si va verso una società che gli studiosi definiscono **neofeudalismo**
        -   capitalismo patrimoniale che torna a una società pre-meritocratica


#### Proprietà {#proprietà}

-   una metafora
-   _commons_ - beni comuni
    -   [The Tragedy of the Commons]({{< relref "20231129072418-the_tragedy_of_the_commons.md" >}})
        -   _claim_: che la proprietà privata è preferibile a quella comune
            -   tutti guardano al proprio _self-interest_ utilizzando il campo comune,
                alla fine non ci sono più risorse per nessuno
            -   la base del Liberismo
    -   [Governing the Commons]({{< relref "20231129072523-governing_the_commons.md" >}})
        -   riscopre l'importanza dei _Commons_, erano regolati per mantenere l'equilibrio
            -   le costruzioni sociali _implicite_ nei commons erano state completamente ignorate da Hardin
        -   Ostrom premio nobel per questo contributo
-   questo deriva dal concetto che le produzioni dell'ingegno siano di proprietà di tutti
-   il concetto nasce da terreni che erano di proprietà della comunità in Inghilterra


#### Taylorismo {#taylorismo}

-   human micromanagement, controllo e espropriazione delle competenze e conoscenze del proletariato
-   `IA` può allo stesso modo controllare


#### La Mettrie {#la-mettrie}

-   [L'Homme Machine]({{< relref "l_homme_machine.md" >}})
-   afferma che il corpo è assimilabile ad una macchina, scomponibile
    -   quindi anche l'anima
-   l'`IA` è proprio un proseguo di questo discorso, la _meccanizzazione_ del pensiero


#### Emile Durkheim {#emile-durkheim}

-   [De la Division du Travail Social]({{< relref "de_la_division_du_travail_social.md" >}})

-   a seguito della rivoluzione industriale i lavoratori si sono specializzati
    -   quindi _interdipendenze_ sociali
    -   questo è positivo in quanto la rete sociale ha una dipendenza reciproca tra i lavoratori
    -   questo ha una forza morale
-   questo porta anche grossa disuguaglianza
    -   più difficile la rivendicazione all'interno della società
    -   la politica deve mantenere il diritto al miglioramento della propria situazione
-   queste _interdipendenze_ stanno scomparendo a causa dell'automazione
    -   questo aumento la disuguaglianza di conseguenza


### Monopoli {#monopoli}

-   [The Master Switch]({{< relref "the_master_switch.md" >}})
-   Western Union
    -   compagnia telegrafica
    -   monopolio
    -   le comunicazioni erano lente e in chiaro
        -   `WU` passa le comunicazioni ad Associated Press
        -   scoprono che in alcuni stati se tutti fossero andati a votare c'era la possibilità di ribaltare le elezioni
            -   informazione, comunicazione e politica sono legata fin dall'inizio

[Tim Wu]({{< relref "tim_wu.md" >}}) fa un'analisi storica e evidenzia come in ambito tecnologico e di comunicazione fin dal giorno 0 le compagnie tendono a formare monopoli.

-   telefono inventato in parallelo da più aziende
    -   molte litigation fino al monopolio di **Bell** nel 1888
-   monopolio di Bell nell'est
-   gli indipendenti non possono competere e soccombono al monopolio
-   Antitrust
    -   [The Curse of Bigness]({{< relref "the_curse_of_bigness.md" >}})
-   Rockfeller, Standard Oil, monopoli in petrolio, armi
    -   il monopolio viene sostenuto filosoficamente
    -   [Herbert Spencer]({{< relref "herbert_spencer.md" >}}): con retorica naturalistica viene sostenuto secondo Darwinismo Sociale, il più adatto sopravvive
        -   si cerca di dare giustificazioni naturali a fenomeni sociali costruiti dagli umani
        -   questo squalifica anche la politica dal regolare questi ambiti
        -   stesse teorie utilizzate per giustificare la Shoah

> Any violation of these "natural laws" would only benefit "the survival of the unfittest" and reverse the evolution of the race. [...] The state had neither right or reason to interfere with the workings of the economy.

Lo **Sherman Act** nel 1890 è la reazione da parte della società e della politica nella guerra contro i monopoli.

I monopoli ora sono cambiati, mentre prima i prezzi venivano mantenuti alti

-   argomento utilizzato per combattere i monopoli nella fine dell'ottocento

Ora i monopoli sul web portano tutto a essere _apparentemente_ gratuito.

-   **Theodore Vail**, giustificava i monopoli
    -   sosteneva che la competizione incontrollata fosse a detrimento dell'utente finale
    -   con la sicurezza provveduta dal monopolio sosteneva che le virtù dell'uomo sarebbero emerse
    -   immaginava un futuro economico libero dalla competizione Darwiniana in cui corporazioni organizzate **scientificamente** da uomini buoni e a stretto contatto con lo stato avrebbero servito il bene comune
-   AT&amp;T, standard acquisiti da J.P.Morgan

-   [Karl Polanyi]({{< relref "karl_polanyi.md" >}})
    -   conclude che le operazioni di un mercato che si auto-regola sono profondamente _distruttive_ se lanciate incontrollate da leggi e regolazioni
    -   descrive una **rete di misure e regolamenti** integrate da **forti istituzioni di controllo**
    -   esamina come si arriva al capitalismo
        -   serie di _commodity fictions_
            -   l'idea che la vita umana potesse essere subordinata alle dinamiche di mercato e trasformata in _lavoro_ da comprare e vendere
            -   l'idea che la natura potesse essere traslata sul mercato come possedimenti terrieri e _real estate_
                -   [Karl Marx]({{< relref "karl_marx.md" >}}) definiva proprio questo il **big bang** da cui origina l'accumulo moderno di capitale
            -   l'idea che gli scambi diventassero _denaro_

-   [Hannah Arendt]({{< relref "hannah_arendt.md" >}}), [The Origins of Totalitarianism]({{< relref "the_origins_of_totalitarianism.md" >}})
    -   vede che l'accumulo primitivo di Marx non è una esplosione singola ma un evento ciclico
    -   il capitalismo si sostiene grazie a un ciclico accumulo nel mondo naturale
        -   il c. va a _conquistare_ ciclicamente nuove aree naturali e sociali e le trasporta nel mercato assoggettandole alle sue leggi
        -   _dove non ci sono regole_ il c. va a prendere il controllo imponendo le sue
            -   questo fenomeno è chiaro nel colonialismo
    -   i totalitarismi mirano a portare il volere del popolo tutto a essere allineato con quello dello stato
        -   sfruttando i mezzi di informazione e la propaganda

La guerra ai monopoli si smorza allo scoppio della guerra fredda nel 1949

-   i governi cercano di mantenere le industrie di comunicazione in periodi di conflitto
-   _Consumer Welfare_, R.Bork 1950 Chicago School of Antitrust
    -   se non aumentano i prezzi il monopolio è buono
    -   dimenticando il pericolo per la democrazia
    -   in parallelo al giustificazionismo da parte del governo si formano movimenti intellettuali che diano fondamento a quest'ultimo
        -   con grande inerzia in quanto questa teoria continua a essere sostenuta ancora oggi
-   _The Hidden Persuaders_, V.Packard 1957
    -   la pubblicità e i media persuasivi nelle case dei cittadini
-   [Marshall McLuhan]({{< relref "marshall_mcluhan.md" >}})
    -   media come **estensioni** dell'essere umano
    -   prendere controllo del proprio consumo di media diventa una forma di auto-determinazione
        -   quindi libertà
    -   _The Medium is the Message_
    -   _Villaggio Globale_
        -   meccanismo base della società trasportato dai media su scala globale
        -   concetto che si è concretizzato grazie a Internet nei Social Media
-   nel 1960 Paul Baran teorizza il  packet switching
    -   AT&amp;T non permette lo sviluppo di una rete che nascerà poi solo negli anni 90
        -   si devono adeguare quando il governo e i militari impongono un modello decentralizzato alla rete per motivi di sicurezza militare
-   `MCI` con le chiamate a onde a lunga distanza crea qualche problema al monopolista
-   Antitrust nei confronti di `IBM`
    -   costringe la separazione di produzione tra hardware e software per indebolire il monopolio
        -   è lo stesso concetto che vende Apple
    -   poi rende _open_ l'architettura PC
        -   per sopravvivere nel mercato in qualche misura
            -   parte hardware acquisita dalla cinese Lenovo
    -   famoso spot Apple 1984 per il Macintosh che fa il parallelo tra totalitarismo e `IBM`, strumentalizzando il libro di Orwell
-   nel 1971 il legislatore vieta AT&amp;T di agire anche su internet
-   Nixon spinge per la nascita della tv via cavo
    -   aveva capito il pericolo di concentrare l'informazione  in pochi canali monopolizzati in una nuova epoca di mass media
    -   la pluralità dei contenuti rimane comunque sui cavi dei monopolista
-   '71 il senato americano inizia una investigazione su programmi ideati per effettuare modifiche comportamentali
    -   studi che erano iniziati dal controllo in telemetria di animali selvatici nel 1964 ma poi anche nella possibilità di influenzarli e studiarli in uno stato ignaro del controllo
    -   studi di elettro-fisiologia ideati per controllare il comportamento umano

> Concepts of freedom, privacy and self-determination inherently conflict with programs designed to control not just physical freedom, but the source of free thought as well. [...] As disturbing as behavior modification may be on a theoretical level, the unchecked growth of the practical technology of behavior control is cause for ever greater concern.

-   Ted Turner
    -   CNN
    -   tv satellitare, bypassa il cavo di proprietà del monopolista
    -   modello basato più sull'abbonamento che la pubblicità

Nel 1984 viene spezzato `AT&T`

-   il sistema Bell viene riorganizzato in tante diverse compagnie
-   ma in pochi anni queste si riconglomerano in `AT&T`

-   [Discipline and Punish: The Birth of the Prison]({{< relref "discipline_and_punish_the_birth_of_the_prison.md" >}}), M.Foucault 1975
    -   la formazione della prigione moderna ha formato parallelamente la nostra organizzazione societaria


#### Patriot Act {#patriot-act}

-   alleanza tra provider e governo rinforzata come nel dopoguerra
-   dopo il fallimento dell'intelligence dopo 9/11
-   2002 `NSA`, J.Poindexter
    -   propone Total Information Awareness `TIA`
    -   a scapito degli utenti e della privacy


#### Ford {#ford}

> Mass production begins in the perception of a public need.

-   5 dollar day
    -   l'operaio producendo l'automobile a un certo punto otterrà il denaro per comprare il bene di consumo prodotto
        -   un circolo virtuoso per il capitalista per così dire

Una **prima modernità** in cui il ruolo di un individuo non è più dove è nato e sempre vissuto ma piuttosto: in che città ti trovi, dove lavori, che cosa possiedi.


#### Cinema {#cinema}

Monopolio di **Edison** sulla costa est.
**Paramount** lotta contro questo colosso a partire da Hollywood.
La antitrust abbatte **Edison**.
Dopo il monopolio rinasce da parte di **Paramount**.

Il modello era investire sulla garanzia dell'autore

-   nel 1980 floppa Heaven's Gate di Michael Cimino
-   fallisce United Artists, attore più indipendente dell'industria
-   parte in processo di conglomerazione per ridurre il rischio
    -   UA viene acquisito da General Electrics
    -   il rischio del fallimento è troppo grande per investire grandi somme
    -   inizia il mercato del merchandising proprio per questo motivo


### Propaganda e Parola {#propaganda-e-parola}

-   1914 nasce in Inghilterra la propaganda per la chiamata alle armi
-   1917, comitato dell'informazione pubblica
    -   150000 impiegati
    -   concetto di _volontà di guerra_, la volontà individuale doveva essere sottoposta a quella dello stato per vincere la guerra

_L'industria dell'informazione messa al servizio dello stato._

-   [Public Opinion]({{< relref "public_opinion.md" >}})
    -   _consent is manufactured_
    -   manipolazione dai media controllati dallo stato, anche se limitati dalla democrazia
-   [Triumph of the Will]({{< relref "triumph_of_the_will.md" >}})
    -   la volontà di guerra dello stato, non la volontà individuale


#### Primo Emendamento {#primo-emendamento}

15 Dicembre 1791

-   impedisce al governo di legiferare per regolare
    -   religione
    -   diritto di assemblea
    -   libertà di espressione
    -   diritto di petizione al governo

La libertà di parola in quell'epoca poteva effettivamente solo impedirtela il governo.
Ora le corporation possono regolare l'agire del pubblico.


#### Attenzione {#attenzione}

[William James]({{< relref "william_james.md" >}}), uno dei padri del Pragmatismo Americano

-   l'esperienza della nostra vita non è altro che ciò cui prestiamo **attenzione**
-   [The Attention Merchants]({{< relref "the_attention_merchants.md" >}})
    -   trasforma l'attenzione, una dimensione profondamente personale, in un **bene di mercato**
-   **pubblicità**, 1833 con il **New York Sun**
    -   Benjamin Day, inventa l'inviato in tribunale
        -   per gli scandali, la qualità si abbassa per vendere a un pubblico più grande
            -   stesso principio delle **Fake News** e dei **Click Bait**
                -   la piattaforme spingono questi contenuti in quanto più tempo passato su di essa significa maggiori introiti
                -   non solo, ora non tutti vedono lo stesso contenuto: lo decide l'algoritmo per ognuno
        -   ha innescato un modello che si evolve con la tecnologia
-   1860 primi poster pubblicitari a Parigi, Jules Cheret
    -   i parigini protestarono questa che vedevano come una svendita degli spazi della loro comunità
    -   mercificazione  dello spazio
-   1890, prima dell'ordine dei medici
    -   i prodotti falsi esistevano da prima ma ora il metodo pubblicitario potenziava  le possibilità di truffa
    -   inizia la pubblicità a domicilio
-   1906 `FDA`
    -   Food and Drugs Act
    -   deve essere


#### Marketplace of Ideas {#marketplace-of-ideas}

Concetto nato da **Justice Oliver Wendell Holmes**.

-   metafora economica
-   le idee migliori emergono dallo scambio continuo in un mercato libero delle idee

Idea richiamata da E.Musk come motivazione per acquisto di Twitter

-   la differenza importante è che nella pubblica piazza non ci sono algoritmi che impongono chi venga raggiunto dal messaggio


#### Pubblicità {#pubblicità}


#### Radio {#radio}

-   solo nel 1921 nasce il concetto di radio a fini commerciali
-   i cavi erano in mano ai monopolisti AT&amp;T e RCA
-   in Europa nasce come servizio pubblico con la **BBC**
    -   servizio per il bene comune deve essere sostenuto pubblicamente
-   entra la pubblicità nelle case delle famiglie
    -   **Herbert Hoover** denuncia _l'intrusione_ della pubblicità nelle case
    -   il servizio importante della radio viene annegato dalla pubblicità

-   **RCA** monopolista radio cerca subito di prendere il controllo del mercato della neonata televisione nel 1928
    -   negli USA la tv non ha successo
    -   in Germania si
    -   la differenza? i monopolisti che hanno bloccato lo sviluppo della televisione per bloccare la concorrenza
        -   al contrario della retorica che Silicon Valley e monopolisti usano
    -   nel 1939 **RCA** introduce alla massa la tv ma come copia della radio, senza alcuna innovazione
        -   innovazioni che vengono mantenuti nei centri di ricerca dei monopolisti
        -   solo dopo decenni sono stati pubblicati


#### Psicologia {#psicologia}

Come scienza ai fini della pubblicità

-   **Edward Bernays**, nipote di Freud
    -   psicologia applicata alla propaganda
    -   campagna pubblicitaria per convincere le donne a fumare
        -   sigarette come _torce della libertà_
        -   manipolazione, paga _influencer_ per fumare pubblicamente


#### Targetting {#targetting}

J.Robbin, Claritan 1970s

-   _Potential Ratings in ZIP markets_
    -   si creano cluster di clienti
    -   nasce la _Diet Coke_ per riempire una nicchia commerciale grazie a questi studi di target


#### Censura {#censura}

-   **Production Code** nel cinema americano
    -   boicottaggio cattolico
    -   **Joseph Breen** e **Will H. Hays**
    -   censura imposta da privati che riesce a colpire perfino un monopolio come quello del cinema
        -   i monopoli sono manipolabili tramite il loro portafoglio


#### Behaviorism {#behaviorism}

John B. Watson, Behaviorist Manifesto, 1913

-   psicologia non verificabile
-   non si può parlare di mente, linguaggio, intenzioni, credenze
    -   non sono termini scientifici, non sono misurabili
    -   considerare solo ciò che è osservabile
        -   modello di Pavlov
        -   solo il comportamento è osservabile: **comportamentismo**

Skinner porta questo concetto alle estreme conseguenze, applicandolo alla società stessa.

-   Brave New World, Huxley 1931
    -   i cittadini vengono selezionati per i ruoli societari in base al loro comportamento
    -   per favorire l'economia si elimina tramite condizionamento ciò che non porta sviluppo economico
    -   Huxley ci mostra che un mondo basato puramente su scienza, tecnologia e ragione è un mondo assurdo
-   1984, Orwell 1948
    -   _mondo basato sulla tecnologia incompatibile con la libertà_
        -   il messaggio è più ampio rispetto alla declinazione staliniana che dà nel libro
        -   trasforma il Panopticon fisico in uno tecnologico
-   _Walden 2_, Skinner 1948
    -   propone un mondo basato su tecnologia come utopico nella sua visione, anche se comunque a discapito della libertà
-   _Beyond Freedom and Dignity_, Skinner 1971
    -   con comportamentismo, scienza, tecnologia, condizionamento
    -   libertà come mancanza di informazioni
        -   se avessimo tutte le informazioni la libertà non è più necessaria
        -   se ognuno è condizionato a fare ciò che la società pensa giusto si supera anche il concetto di punizione


### Seconda Modernità {#seconda-modernità}

-   [Shoshana Zuboff]({{< relref "shoshana_zuboff.md" >}})
-   prima modernità
    -   realtà sociale ben definita
    -   ruoli sociali chiari
        -   la società proiettava un ruolo sociale sull'individuo
        -   disagio psicologico
-   2001 iPod
    -   individualizzazione
    -   l'utente sceglie cosa ascoltare, cosa leggere, cosa vedere
-   una volta che la realtà è così individualizzata non esistono più i fatti
    -   ogni individuo è inserito in una propria realtà dagli algoritmi
    -   nuovo disagio psicologico, _cosa devo fare?_
        -   mentre spariscono questi ruoli definiti l'individualità va trovata
-   fine dell'anonimità
    -   con Facebook 2004
    -   puoi essere solo una persona
        -   nella realtà sociale le personalità non sono cristallizzate
        -   siamo persone diverse in situazioni diverse
    -   l'idea di identità come idea che gli altri hanno di noi viene attaccata da tutte le direzioni dalle informazioni che sono liberamente disponibili e che non sono più sotto il controllo della persona ma sono controllate dalle piattaforme che decidono che informazioni mostrare o meno e a chi

-   Behavioral Economics
    -   _The Gentle Nudge_, Thaler, Sunstein
    -   condizionamento portato sul web
-   Clickbait
    -   Huffington Post 2005
    -   massimizzazione dei guadagni dai click

-   **Right to be Forgotten**
    -   2011, Spanish Data Protection Agency
    -   2015, Corte di Giustizia dell'UE lo dichiara diritto fondamentale
    -   richiede Google a effettuare il de-linking sotto richiesta giustificata del cittadino

> The operator of a search engine is liable to affect significantly the fundamental rights to privacy and to the protection of personal data.


#### Cookies {#cookies}

1996, Federal Trade Commission in workshop discute di assegnare il controllo di tutte le informazioni personali agli utenti by default

-   opt-in
-   i pubblicitari erano aspramente contrari
    -   propongono la _self-regulation_
        -   richiamo alla self-regulation feudataria


#### Communications Decency Act {#communications-decency-act}

-   1996
-   solleva dalla responsabilità legale i provider
-   grande libertà dal punto di vista legislativo
-   le piattaforme hanno loro termini di servizio
    -   non tanto per motivi legali in quanto sono immuni da liability
    -   per motivi reputazionali
    -   per offrire una piattaforma pulita a advertisers e utenti
    -   il paletto però lo decide la piattaforma privata


#### Blog {#blog}

-   2000
-   user generated content
-   web 2.0 50M blog nel 2005
-   frammentazione dei contenuti 2007
    -   ognuno sceglie la propria nicchia
    -   poi l'algoritmo decide per gli utenti in che nicchia piazzarli


#### Netflix {#netflix}

-   2015 cambia la direzione dell'azienda
-   _putting the viewer in control of the experience_
-   binge watching
-   sustained attention
-   subscription model
-   producing content


#### Surveillance Capitalism {#surveillance-capitalism}

> **Sur-veil-lance Cap-i-tal-ism**, n.1. A new economic order that claims human experience as free raw material for hidden commercial practices of extraction, prediction, and sales; 2. A parasitic economic logic in which the production of goods and services is subordinated to a new global architecture of behavioral modification; 3. A rogue mutation of capitalism marked by concentrations of wealth, knowledge, and power unprecedented in human history; 4. The foundational framework of a surveillance economy; 5. A significant threat to human nature in the twenty-first century as industrial capitalism was to the natural world in the nineteenth and twentieth; 6. The origin of a new instrumentarian power that asserts dominance over society and presents startling challenges to market democracy; 7. A movement that aims to impose a new collective order based on total certainty; 8. An expropriation of critical human rights that is best understood as a coup from above: an overthrow of the people's sovereignty.

-   **behavioral futures**
    -   in senso finanziario
    -   scommesse finanziarie in ambito comportamentale
        -   il pubblicitario non compra solo uno spazio ma anche la scommesse che l'utente cliccherà su quello spazio
-   il valore in borsa non dipende solo da asset e introiti
    -   l'investitore investe se crede che ci sia possibilità di crescita oltre il prezzo attuale
    -   si innesca un meccanismo perverso per cui se le aziende non crescono esponenzialmente vanno a perdere il loro valore sgonfiandosi
-   _don' t be evil_
    -   **Google** inventa di fatto il `SC`
    -   l'algoritmo di page rank è fondamentale per la user experience
        -   va dato un ordine ai risultati di ricerca
    -   prendono coscienza che le query più cercate sono un importante termometro globale
    -   raccoglievano informazioni dagli utenti in favore degli utenti stessi in un percorso di miglioramento del servizio
        -   in prima battuta quindi un feedback loop positivo

> In this cycle, only behavioral data needed for service improvements are rendered. These are reinvested in the user experience.

-   _data exhaust_
    -   i dati spazzatura così definiti da Google erano in realtà la vera fonte di ricchezza
    -   materia prima
-   mancava un business plan
    -   la pubblicità non era nei piani
    -   fosse a pagamento avrebbe dato un precedente a chi compariva nei risultati
    -   non vendeva device di supporto al servizio
    -   prendono dal competitor Overture il concetto di vendere gli spazi nei primi risultati ai siti web
        -   ranked advertisers
-   quando scoppia la bolla dot com si ritorno sull'idea delle pubblicità
    -   mostrare item in vendita come primi risultati o banner
    -   **AdWords**
        -   utilizzare il _data exhaust_ per fare targeting accurato verso oggetti in vendita
        -   conoscere il profilo di ricerca degli utenti dava un forte potere predittivo sui possibili interessi di acquisto
-   _Patriot Act_
    -   le informazioni di sorveglianza non le hanno solo i media ma soprattutto chi raccoglie dati sugli utenti online
-   H.Varian
    -   _new contractual forms due to better monitoring_
        -   **uncontracts** per la Zuboff
        -   la parte di contrattazione e salvaguardia del contratto giuridico viene negata in nome del monitoraggio e dell'efficienza tecnica e finanziaria
-   questi siti non sono servizi venduti agli utenti
    -   creano una nuova dimensione e spazi pubblicitari
    -   vendono questi spazi ai brand
    -   si supera il modello di business del secolo scorso (Ford)
    -   il _metaverso_ è una operazione simile
        -   si creano nuovi spazi di raccolta dati e di vendita pubblicitaria
        -   nuovi spazi di _estrazione_

Brevetto Google sulla raccolta dati per ads, definizione di **profilo utente**:

-   _Generating User Information for Use in Targeted Advertising_
    -   brevetto sull'identificazione degli utenti adatti a specifici target (`UPI`)
    -   nonostante l'enorme quantità di dati demografici molto del budget viene sprecato
    -   necessario aumentare la rilevanza delle ads tramite altri dati:
        -   search query
        -   document request, qualsiasi click e visita web
        -   costruire _user profile information_
            -   può includere _qualsiasi_ informazione riguardo individuo o gruppi
            -   _such information may be provided by the user, and|or derived from user actions_
                -   una vera espropriazione dei dati degli utenti
-   _click-through_
    -   non pagare la pubblicità solo per numero di visualizzazioni ma per la conversione
        -   per questo si possono fare pagare molto di più per il servizio
    -   G crea un portale di aste automatizzato e istantaneo
        -   per i suoi clienti reali, i brand
        -   in `ms` si decide chi si aggiudica il banner, l'inserzione, etc.
        -   in base a match di profilo e richiesta e offerta si decide il vincitore
        -   pagamento richiesto solo se c'è il click utente
-   _behavioral surplus_
    -   eccedenza nelle informazioni che è la ricchezza dell'azienda `ICT`
    -   surplus dato gratuitamente dagli utenti ironicamente
    -   da questo si delinea il ciclo caratteristico del `SC`

-   the **cycle**:
    1.  Rendered Behavior (surplus)
    2.  New means of production
    3.  Prediction Products
    4.  Market in Future Behavior
    5.  Surveillance Revenues

Il problema è che questo ciclo non regolamentato porta le aziende a una gara all'estrazione di più dati, meglio, da nuovi domini: una escalation alla sorveglianza.

-   tradimento dell'**advocacy**
    -   non c'è più il primato dell'individuo che sembrava il fulcro nello sviluppo tecnologico ad inizio 2000
    -   l'individuo è utilizzato per le sue informazioni comportamentali e come target pubblicitario
    -   l'utente non è il prodotto, non esattamente
        -   l'utente è la miniera dei dati, poi le prediction vengono vendute

_Laws are existential threats to the frictionless flow of behavioral surplus._

> When asked about government regulation, Schmidt said that technology moves so fast that governments really shouldn't try to regulate it because it will change too fast, and any problem will be solved by technology. "We'll move much faster than any government."[^fn:5]

-   ciclo di adattamento:
    1.  appropriation, si prende un nuovo campo non regolamentato
    2.  adaptation, il legislatore si adatta
    3.  redirection, l'azienda subito si sposta su un nuovo dominio
-   Eric Schmidt dietro la campagna elettorale Obama 2008 e poi anche successivamente
-   _revolving doors_ tra governo e silicon valley
    -   legato allo stesso sentimento di mancanza di _know-how_ dell'intelligence americana a seguito del 2001
-   [Tim Wu]({{< relref "tim_wu.md" >}}) con altri ricercatori ha evidenziato come Google oscurasse i competitor e offrisse nei risultati alle query i propri servizi in priorità, caratterizzandosi quindi come **content provider**

Esempio di nuova dimensione di estrazione:

-   **Street View**
    -   lanciato con un blog post dal _privacy counsel_ di Google Peter Fleischer
    -   _celebrating America's "noble tradition" of public spaces, where, he claimed, "people don't have the same expectation of privacy as they do in their homes."_
        -   he asserts all public spaces are fair game for Google's incursion
    -   Google comunica alla German Federal Commission for Data Protection che l'operazione raccoglieva dati personali da WiFi privati
        -   Google affermava di raccogliere solo dati pubblici
        -   una analisi indipendente provo che le macchine stessero estraendo dati personali non criptati dalle case
        -   ingegnere nel team selezionato proprio per le sue capacità in **wardriving**[^fn:6]
-   Satia Nadella: Cortana
    -   anche nel caso di Microsoft si cerca di non parlare troppo delle possibilità di Cortana per non fare sentire gli utenti troppo controllati
    -   si è cercato di estrarre in un nuovo spazio, quello professionale


### Cosa non si vede dell'impatto AI {#cosa-non-si-vede-dell-impatto-ai}

-   [Atlas of AI]({{< relref "atlas_of_ai.md" >}})
-   _The Cleaners_
-   Mechanical Turk
-   Sfruttamento minorile nelle miniere di terre rare
-   Condizioni lavorative nell'industria di Amazon
-   Riconoscimento di volti utilizzato per controllo etnico in Cina
-   AI non è né artificiale né intelligente
    -   [Stochastic Parrot]({{< relref "stochastic_parrot.md" >}})
    -   Timnit Gebru, Margaret Mitchell: [On the Dangers of Stochastic Parrots]({{< relref "on_the_dangers_of_stochastic_parrots.md" >}})
    -   il problema `AI` non è solamente tecnico ma anche politico e sociale
    -   [LLM]({{< relref "llm.md" >}}) sono statici, modellano il mondo come ora: conservatori per definizione
        -   bias che poi si alimenta creando nuovo training data
    -   manipolazione degli utenti
        -   gli umani sono facili da ingannare nell'imitazione di intelligenza
        -   [ELIZA]({{< relref "eliza.md" >}}) l'ha fatto 70 anni fa, con grande impatto mediatico all'epoca
            -   nasceva proprio come provocazione da parte di Weizenbaum
-   _Coded Bias_
-   [GDPR]({{< relref "gdpr.md" >}})
    -   diritto a una spiegazione per una decisione presa da un sistema di Deep Learning
    -   ma cosa significa dare una spiegazione?
        -   la maggior parte delle informazioni parte della decisione sono [Tacit Knowledge]({{< relref "20231123031434-tacit_knowledge.md" >}})
    -   come capire cosa porta un [Neural Network]({{< relref "20210606215832-neural_network.md" >}}) a una data decisione?
        -   potrebbe essere un problema irrisolvibile, se la rete ha trovato un modello della realtà non esprimibile in maniera intelligibile all'essere umano come le si può richiedere una spiegazione?


### Letture per il Corso {#letture-per-il-corso}

-   [Weapons of Math Destruction]({{< relref "weapons_of_math_destruction.md" >}})
-   [The Master Switch]({{< relref "the_master_switch.md" >}})
    -   tendenza di creare corporazioni monopolistiche nell'ambito dell'informazione e tecnologia

[^fn:1]: [Tacit Knowledge]({{< relref "20231123031434-tacit_knowledge.md" >}})
[^fn:2]: [Emotional Intelligence]({{< relref "20231123032157-emotional_intelligence.md" >}})
[^fn:3]: Questo è il metodo della [Cognitive Science]({{< relref "cognitive_science.md" >}}) che cerca di essere una alternativa più scientificamente basata della psicologia.
[^fn:4]: [Sapiens: A brief History of Humankind]({{< relref "sapiens_a_brief_history_of_humankind.md" >}})
[^fn:5]: Business Insider on Schmidt
[^fn:6]: practice of driving around using equipment to locate wireless networks
