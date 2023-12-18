+++
title = "Etica, Società e Privacy"
author = ["Daniel Biasiotto"]
date = 2023-11-09T09:41:00+01:00
tags = ["university", "compsci", "master"]
draft = false
+++

## Privacy {#privacy}


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

_Law of Unintended Consequences_

-   `SSN` è era stato pensato per sicurezza sociale
    -   ora è utilizzato per identificare gli studenti
-   gli smartphone erano nati con scopi di comunicazione
    -   ora sono utilizzati come metodi di pagamento
-   `DNA` utilizzato per motivi evolutivi
    -   potrebbe essere un'identificativo

_Big Data_

-   i dati sono molti, cosi tanti che non si sa come gestirli ma neanche come proteggerli
-   molti dati sporchi e difficilmente analizzabili
-   i dati vengono collezionati in maniera indiscriminata, spesso più di quelli necessari
-   dati non ben caratterizzati
-   queste quantità di dati permettono l'identificazione di **pattern** che altrimenti non sarebbe possibile riconoscere
    -   caso `FDA`, Bing e colesterolo

_Dataification_

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

<!--list-separator-->

-  Attribute-based Authorization

    -   **access control**
        -   restrizione dell'accesso in un sistema multi utente
        -   un sistema complesso necessiterà di una implementazione complessa
    -   role based access control
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
    -   attribute based access control
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


## Etica {#etica}


### Metafora {#metafora}

-   partendo da [Metaphors We Live By]({{< relref "20231123030545-metaphors_we_live_by.md" >}}) di [George Lakoff]({{< relref "20231123030705-george_lakoff.md" >}})
-   mapping matematico (o meglio **omomorfismo**) tra concetti complessi della vita e un dominio più semplice da rappresentare
-   il nostro cervello utilizza questo meccanismo perché non conosciamo le conseguenze delle nostre azioni, il problema è troppo complesso
    -   quindi semplifica

-   causalità e tempo sono esempi di domini che non conosciamo bene quanto crediamo e per i quali utilizziamo linguaggio metaforico per farne riferimento
    -   si riconducono a qualcosa di più conosciuto
    -   anche la tecnologia la concettualizziamo in questo modo


### Conoscenza Esplicita e Tacita {#conoscenza-esplicita-e-tacita}

-   teorizzata dal filosofo e economista [Michael Polanyi]({{< relref "20231123031310-michael_polanyi.md" >}})[^fn:1]
-   la conoscenza di cui siamo coscienti non è tutta, il _gap_ è tacito in quanto non esprimibile dal linguaggio e non accessibile alla coscienza
    -   la c. tacita tratta la pratica, che non è trasmissibile o comunicabile
    -   altro esempio sono le regole del linguaggio
    -   altro esempio è la logica, il ragionare è una c. tacita di cui non siamo coscienti di come funzioni
    -   la percezione, utilizziamo linguaggio metaforico per descriverla
    -   la nostra dimensione emotiva[^fn:2]
        -   questa intelligenza non la conosciamo, a volte solamente a posteriori o tramite empatia capiamo i nostri stati emotivi


### Realtà Sociale {#realtà-sociale}

-   da [The Construction of Social Reality]({{< relref "20231123032542-the_construction_of_social_reality.md" >}})
-   non è data ma creata da noi
    -   tutto è deciso da regole **costitutive** ideate dalla collettività
-   la **realtà costruita** costituisce la gran parte della nostra realtà vissuta
    -   la tecnologia sta sempre più cambiando le regole e la realtà in cui viviamo
        -   non cambia fatti naturali ma piuttosto nostre costruzioni sociali


### Conventional Wisdom {#conventional-wisdom}

-   da [The Affluent Society]({{< relref "20231123033317-the_affluent_society.md" >}})
-   competizione tra giusto e accettabile
    -   in  una competizione il vantaggio strategico si trova in ciò che è accettabile, comodo
        -   il test del applauso pubblico influenza più del test della verità
-   teorie scientifiche e modi di fare possiedono una **inerzia** che supera anche il  momento in cui vengono smentite
    -   sono creazioni umane e per questo convenzionali e contengono i bias del nostro ragionamento


### Tecnologia {#tecnologia}

-   la tecnologia inizia con i Neanderthal e continua fino ora
-   la società inizia con la Mesopotamia 3000 anni prima di Cristo
    -   [Yuval Noah Harari]({{< relref "20210604121119-yuval_noah_harari.md" >}}) riconduce il passaggio alla **rivoluzione cognitiva**[^fn:3]
        -   l'uomo ha cominciato a descrivere entità, scenari e miti che non esistono
        -   quindi non la tecnologia ma l'organizzazione della società attraverso e attorno entità fittizie
            -   dei, nazioni, organizzazioni, SPA


### Costruzioni Sociali {#costruzioni-sociali}

Le prime sono state le normative

-   codice di Amurabi
-   codice romano, primo codice moderno
    -   lo schiavo era gestito con una complessa legislazione
        -   gli schiavi svolgevano lavori e stipulavano contratti a loro volta a nome del padrone

I _robot_ sono assimilabili a moderni schiavi, come andrebbero gestiti?

-   potremmo rifarci al codice romano
-   come regolare la responsabilità da parte di un robot
    -   ora una macchina semi-autonoma deve essere _supervisionata_ dall'utente, se non c'è la colpa è dell'umano


### Proprietà {#proprietà}

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


### Requerimiento {#requerimiento}

-   i conquistadores prima di conquistare con il massacro le terre indigene dichiaravano un _requerimiento_ con cui intimavano a cedere il terreno agli indigeni, in spagnolo ovviamente
-   una sorta di assoluzione dall'etica tramite sovrastrutture e costrutti sociali


### Linguaggio {#linguaggio}

-   descrive il vero? no
-   può formulare domande, ordini, richieste
    -   tramite formule linguistiche definiamo e cambiamo le regole che regolano il mondo in cui agiamo
-   [How to Do Things with Words]({{< relref "20231129074610-how_to_do_things_with_words.md" >}})


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


### Cartesio {#cartesio}

-   porta una materia complessa nel campo della matematica
-   permette di trattarla con linguaggio formale
-   il corpo era tabù religioso
    -   Cartesio rompe questo tabù logicamente
    -   se lo spazio è studiabile matematicamente, e il corpo è uno spazio, posso studiare il corpo
    -   non posso studiare un corpo morto in movimento ma posso studiarlo tramite simulazione meccanica
        -   questo si applica oggi alla scienza cognitiva, la si può studia con la simulazione tramite intelligenza artificiale[^fn:4]


### La Mettrie {#la-mettrie}

-   [L'Homme Machine]({{< relref "l_homme_machine.md" >}})
-   afferma che il corpo è assimilabile ad una macchina, scomponibile
    -   quindi anche l'anima
-   l'`IA` è proprio un proseguo di questo discorso, la _meccanizzazione_ del pensiero


### Taylorismo {#taylorismo}

-   human micromanagement, controllo e espropriazione delle competenze e conoscenze del proletariato
-   `IA` può allo stesso modo controllare


### Emile Durkheim {#emile-durkheim}

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


### Primo Emendamento {#primo-emendamento}

15 Dicembre 1791

-   impedisce al governo di legiferare per regolare
    -   religione
    -   diritto di assemblea
    -   libertà di espressione
    -   diritto di petizione al governo

La libertà di parola in quell'epoca poteva effettivamente solo impedirtela il governo.
Ora le corporation possono regolare l'agire del pubblico.


### Panopticon {#panopticon}

Geremia Bentham 1791

-   se non sai mai quando sei controllato la tua percezione diventa quella di controllo costante
-   una torre centrale che può controllare in qualsiasi momento ogni luogo dell'edificio
-   nel mondo digitale le corporation aggregano dati di controllo costantemente e possono cederli se richiesto  a terzi
    -   in diritto si devono avere motivi fondati per inquisire su qualcuno, non basta un sospetto infondato
    -   il diritto sta venendo distorto a causa della tecnologia sempre più presente che non è ancora stata limitata a quel livello

Il cambio di prospettiva è:

-   ti comporti bene perché sai che **potresti** essere controllato
-   ti comporti bene perché **sei** controllato


### Attenzione {#attenzione}

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
    -   conclude che le operazioni di un mercato che si auto-regola sono profondamente distruttive se lanciate incontrollate da leggi e regolazioni
    -   descrive una **rete di misure e regolamenti** integrate da **forti istituzioni di controllo**
    -   esamina come si arriva al capitalismo
        -   serie di _commodity fictions_
            -   l'idea che la vita umana potesse essere subordinata alle dinamiche di mercato e trasformata in _lavoro_ da vendere
            -   l'idea che la natura potesse essere traslata sul mercato come possedimenti terrieri e _real estate_
                -   [Karl Marx]({{< relref "karl_marx.md" >}}) definiva proprio questo il **big bang** da cui origina l'accumulo moderno di capitale
            -   l'idea che gli scambi diventassero _denaro_

-   [Hannah Arendt]({{< relref "hannah_arendt.md" >}}), [The Origins of Totalitarianism]({{< relref "the_origins_of_totalitarianism.md" >}})
    -   vede che l'accumulo primitivo di Marx non è una esplosione singola ma un evento ciclico
    -   il capitalismo si sostiene grazie a un ciclico accumulo nel mondo naturale
        -   il c. va a _conquistare_ ciclicamente nuove aree naturali e sociali e le trasporta nel mercato assoggettandole alle sue leggi
        -   dove non ci sono regole il c. va a prendere il controllo imponendo le sue
            -   questo fenomeno è chiaro nel colonialismo


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


### Marketplace of Ideas {#marketplace-of-ideas}

Concetto nato da **Justice Oliver Wendell Holmes**.

-   metafora economica
-   le idee migliori emergono dallo scambio continuo in un mercato libero delle idee


### Pubblicità {#pubblicità}


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


### Censura {#censura}

-   **Production Code** nel cinema americano
    -   boicottaggio cattolico
    -   **Joseph Breen** e **Will H. Hays**
    -   censura imposta da privati che riesce a colpire perfino un monopolio come quello del cinema
        -   i monopoli sono manipolabili tramite il loro portafoglio


### Letture per il Corso {#letture-per-il-corso}

-   [Weapons of Math Destruction]({{< relref "weapons_of_math_destruction.md" >}})
-   [The Master Switch]({{< relref "the_master_switch.md" >}})
    -   tendenza di creare corporazioni monopolistiche nell'ambito dell'informazione e tecnologia

[^fn:1]: [Tacit Knowledge]({{< relref "20231123031434-tacit_knowledge.md" >}})
[^fn:2]: [Emotional Intelligence]({{< relref "20231123032157-emotional_intelligence.md" >}})
[^fn:3]: [Sapiens: A brief History of Humankind]({{< relref "sapiens_a_brief_history_of_humankind.md" >}})
[^fn:4]: Questo è il metodo della [Cognitive Science]({{< relref "cognitive_science.md" >}}) che cerca di essere una alternativa più scientificamente basata della psicologia.
