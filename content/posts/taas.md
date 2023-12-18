+++
title = "TAAS"
author = ["Daniel Biasiotto"]
date = 2022-09-19T10:14:00+02:00
tags = ["university", "master", "compsci"]
draft = false
+++

## Informazioni Corso {#informazioni-corso}

-   Giovanna Petrone
-   Laboratorio
    -   partecipazione obbligatoria
    -   a gruppi
    -   simili a corsi di management nelle aziende
    -   indicazioni sul backend (Spring), frontend a libero sviluppo
-   Obiettivi
    -   **Extreme Programming** / **SCRUM**
    -   imparare a gestire un progetto
        -   identificare l'ambito per poter gestire correttamente lo sviluppo
        -   _off the shelf_
            -   per ogni cliente possibile
        -   _custom made_
    -   _project scheduling_
    -   stesura dei requisiti e sviluppo dei _task_


## Project Management {#project-management}

-   Meeting
    -   Project Meeting
    -   Project Review


### Traditional Approach {#traditional-approach}

-   **Project Charter**
    -   objectives, _no goals_
    -   assunzioni, restrizioni
    -   misure
-   Planning
    -   l'approccio cerca di anticipare i problemi
    -   stabilire obiettivi concreti


## Maven {#maven}

-   repeatable builds
-   dipendenze transitive
-   gestisce l'ambiente di sviluppo e di esecuzione

Ogni progetto è identificato dal `GAV`

-   groupID:artifactID:version

Per progetti di grandi dimensioni si può definire un _parent project_ da cui ereditare la configurazione dall'alto.

`Maven` è opinionato riguardo la struttura del progetto.

-   _target_, _src_, _...test_, etc
-   `mvn install`
-   `mvn clean`
-   `mvn clean compile`


## JEE {#jee}

Java Enterprise

-   quando ci sono necessità di scalabilità
-   adatta allo sviluppo di applicazioni web-based a livello di impresa
-   il competitor Microsoft è `.net`

Offre funzionalità _on top of_ i componenti di gestione dati e database

-   servlet
-   injection
-   web pages
-   expression language
-   SOAP services
-   REST services
-   JSON
-   validation
-   persistence
-   concurrency
-   security
-   ...


### Enterprise Java Beans {#enterprise-java-beans}

`EJB`
Componenti sul lato server


## Single Page Application {#single-page-application}

Le interazioni sono gestite dal client che richiama il server solo per le richieste dati necessarie alle interazioni utente.

-   niente _reload_ continui o page flicker
-   interazione più veloce e seamless, migliore `UX`
-   il render è gestito da `JavaScript`

È una evoluzione a partire dal sito web classico, carica una singola pagina `HTML`. Sfruttano `AJAX` e `HTML5` per creare una web app fluida e responsiva.


## Docker {#docker}

Moduli divisi in _container_ diversi, si comunicano attraverso il network.


## Spring {#spring}


## Angular {#angular}


## Service Oriented  Architecture {#service-oriented-architecture}

-   [SOA]({{< relref "20231129035126-soa.md" >}})
-   necessità di integrare servizi eterogenei tra loro di terze parti
-   prima di questa architettura si utilizzavano software
    -   sito-ed, closed, monolithic, brittle
    -   una volta aggiornata una delle sezioni andavano testate e redeployed tutte quante

-   dopo
    -   strutturare il software attorno applicazioni composite e composed business process
    -   vengono estratti i servizi riutilizzabili, _reusable business services_
    -   test e redeploy sono necessari solamente per il modulo aggiornato successivamente
    -   i servizi vengono poi orchestrati per il funzionamento delle applicazioni sovrastanti

**Web service wrapper** sono stati utilizzati per creare interfacce tra una lingua franca (`XML`) e applicazioni in un qualsiasi linguaggio.

Uno shift fondamentale dell'uso del web

-   web human-centric
    -   maggioranza delle transazioni web iniziate da un umano
-   web application-centric
    -   scambi inter-application
    -   necessità di esporre tramite uno standard dei servizi sul web

Questi `web-service` sono

-   encapsulated
-   loosely coupled
-   contracted software objects via standard protocols
-   disponibili tramite web
-   utilizzano messaggi `XML` standardizzati
-   indipendenti da `OS` o linguaggio
-   self describing via `XML`
-   easily discoverable

Gli  standard `XML` sono:

-   [SOAP]({{< relref "20231129041501-soap.md" >}}), simple object access protocol
-   [WSDL]({{< relref "20231129041522-wsdl.md" >}}), web services description language
-   [UDDI]({{< relref "20231129041546-uddi.md" >}}), universal description, discovery and integration
    -   Microsoft
    -   interrogati da applicazioni in rete
    -   sostanzialmente delle pagine gialle per `SOAP`
    -   provvedono contact/business information
    -   binding information e `API`

Il modello di uso è

-   publish
-   find
-   bind

Per l'utilizzo di `SOAP`

-   RPC-style, sincrono
    -   _remote procedure call_
-   Document-style, asincrono

La differenza con [REST]({{< relref "20231129043029-rest.md" >}}) è che con questa architettura ho la possibilità di fare programmazione distribuita, le richieste possono essere vere richieste programmatiche mentre l'alternativa si occupa più prettamente di scambio di dati.


## Representational State Transfer {#representational-state-transfer}

-   [REST]({{< relref "20231129043029-rest.md" >}})
-   2000, tesi di dottorato di Roy Fielding
-   il tipo di contenuto che viene restituito sta al programmatore
    -   spesso `JSON`, `XML`
-   i siti web sono `RESTful`
-   non ha l'espressività di [WSDL]({{< relref "20231129041522-wsdl.md" >}})

Utilizzo dei metodi `http`

-   `GET`
-   `POST`
-   `PUT`
-   `DELETE`


## Microservice Architecture {#microservice-architecture}

Evoluzione della [SOA]({{< relref "20231129035126-soa.md" >}}).
Il microservizio è una componente che offre un servizio ben definito e indipendente. La parola in particolare sottolinea che queste componenti espongono servizi ovvero `API`.

-   _autonomous, independently deployable_
    -   questi collaborano all'interno dell'applicazione
    -   facilita anche il debugging grazie all'isolamento e permette di incapsulare librerie di terzi all'interno di microservizi ad-hoc
    -   si vuole semplificale il più possibile l'uso da parte dell'utente, non forzare scelte implementative a valle
-   ridurre ulteriormente le dimensioni dei servizi e renderli completamente indipendenti gli uni dagli altri
    -   una architettura monolitica può funzionare per un progetto piccolo di dimensioni di _codebase_ sia per team
-   `db` diversi per ogni microservizio
    -   questo porta anche degli svantaggi
-   il _load balancer_ diventa parte dell'architettura stessa, da subito posto l'accento sulla scalabilità
-   [SOA]({{< relref "20231129035126-soa.md" >}}) tradizionalmente risultava in servizi monolitici, per mancanza di comprensione della dimensione ideale di un servizio
-   la indipendenza e la dimensione ridotta dei servizi permette più facilmente la gestione da parte di un team e facilità la collaborazione tramite le `API`
-   _deployment_ individuale, rischio più basso minor downtime e update frequenti
    -   quindi va automatizzato il processo di _deployment_
-   scalabilità dei singoli microservizi individualmente

Per rinforzare l'indipendenza tra servizi:

-   messaggi asincroni, `MOM`
-   RabbitMQ
-   l'architettura più pura prevede che i microservizio comunichino tra loro tramite messaggi asincroni su bus

Scelte:

-   `API` Gateway
-   Message Bus, event driven tramite messaggi asincroni

Registrazione servizi `Eureka` per discoverability.

-   pubblicazione dei singoli servizi

Il problema di avere `db` divisi è la duplicazione dei dati e quindi la _consistenza_.
I microservizi possono essere in 3 stadi/ambienti

-   `development` &rarr; `staging` &rarr; `production`


## Distributed Monoliths {#distributed-monoliths}

-   singolo `db` condiviso
-   servizi divisi ma che vanno rilasciati insieme e hanno forti interdipendenze
