+++
title = "eMail Client-Server"
author = ["Daniel Biasiotto"]
draft = false
+++

Corso: [Programmazione III]({{< relref "20210921090752-programmazione_iii.md" >}})


## Specifiche {#specifiche}

Si sviluppi un’applicazione Java che implementi un servizio di posta elettronica organizzato con un mail server che gestisce le caselle di posta elettronica degli utenti e i mail client necessari per permettere agli utenti di accedere alle proprie caselle di posta.

-   Il mail server gestisce una lista di caselle di posta elettronica e ne mantiene la persistenza utilizzando file ( **txt** o **binari**, a vostra scelta, non si possono usare database) per memorizzare i messaggi in modo permanente.
-   Il mail server ha un’interfaccia grafica sulla quale viene visualizzato il **log delle azioni effettuate** dai mail clients e degli eventi che occorrono durante l’interazione tra i client e il server.
    -   Per esempio: apertura/chiusura di una connessione tra mail client e server, invio di messaggi da parte di un client, ricezione di messaggi da parte di un client, errori nella consegna di messaggi.
    -   <span class="underline">NON fare log di eventi locali al client</span> come per esempio il fatto che ha schiacciato un bottone, aperto una finestra o simili in quanto non sono di pertinenza del server.

-   Una casella di posta elettronica contiene:
    -   **Nome** dell’account di mail associato alla casella postale (es.giorgio@mia.mail.com).
    -   **Lista** (eventualmente vuota) di **messaggi**. I messaggi di posta elettronica sono istanze di una classe Email che specifica ID, mittente, destinatario/i, argomento, testo e data di spedizione del messaggio.

-   Il mail client, associato a un particolare account di posta elettronica, ha un’interfaccia grafica così caratterizzata:
    -   **L’interfaccia** permette di:
        -   creare e **inviare** un messaggio a uno o più destinatari (destinatari multipli di un solo messaggio di posta elettronica)
        -   **leggere** i messaggi della casella di posta
        -   **rispondere** a un messaggio ricevuto, in Reply (al mittente del messaggio) e/o in Reply-all (al mittente e a tutti i destinatari del messaggio ricevuto)
        -   **girare** (forward) un messaggio a uno o più account di posta elettronica
        -   **rimuovere** un messaggio dalla casella di posta.
    -   L’interfaccia mostra sempre la lista aggiornata dei messaggi in casella e, quando arriva un nuovo messaggio, **notifica** l’utente attraverso una finestra di dialogo.
    -   NB: per semplicità <span class="underline">si associno i mail client agli utenti a priori</span>: non si richiede che il mail client offra le funzionalità di registrazione di un account di posta. Inoltre, un mail client è associato a una sola casella di posta elettronica e la sua interfaccia non richiede autenticazione da parte dell’utente.

-   NB: il mail client non deve andare in crash se il mail server viene spento – <span class="underline">gestire i problemi di connessione al mail server inviando opportuni messaggi di errore</span> all’utente e fare in modo che il mail client <span class="underline">si riconnetta automaticamente al server</span> quando questo è nuovamente attivo.


### Requisiti tecnici {#requisiti-tecnici}

-   Per la dimostrazione si assuma di avere 3 utenti di posta elettronica che comunicano tra loro. Si progetti però il sistema in modo da renderlo scalabile a molti utenti.
-   L’applicazione deve essere sviluppata:
    -   `JavaFXML`
    -   `MVC`
        -   con Controller + viste e Model, seguendo i principi del pattern
        -   `Observer Observable`. Si noti che non deve esserci comunicazione diretta tra viste e model: ogni tipo di comunicazione tra questi due livelli deve essere mediato dal controller o supportata dal pattern Observer Observable. Non si usino le classi deprecate Observer.java e Observable.java.
    -   Si usino le classi di `JavaFX` che supportano il pattern Observer Observable.
-   L’applicazione deve permettere all’utente di correggere eventuali input errati
    -   in caso di inserimento di indirizzi di posta elettronica non esistenti, il server deve inviare messaggio di errore al client che ha inviato il messaggio; inoltre
    -   in caso di inserimento di indirizzi sintatticamente errati il client stesso deve segnalare il problema senza tentare di inviare i messaggi al server.
-   I client e il server dell’applicazione devono <span class="underline">parallelizzare le attività che non necessitano di esecuzione sequenziale</span> e gestire gli eventuali problemi di accesso a risorse in mutua esclusione.
    -   i client e il server di mail devono essere applicazioni java distinte
    -   la creazione/gestione dei messaggi deve avvenire in parallelo alla ricezione di altri messaggi.
-   L’applicazione deve essere <span class="underline">distribuita</span> (i mail client e il server devono stare tutti su JVM distinte) attraverso l’uso di `Socket Java`.


### Requisiti dell’interfaccia utente {#requisiti-dell-interfaccia-utente}

L’interfaccia utente deve essere:

-   Comprensibile (_trasparenza_). In particolare, a fronte di errori, deve segnalare il problema all’utente.
-   Ragionevolmente _efficiente_ per permettere all’utente di eseguire le operazioni con un numero minimo di click e di inserimenti di dati.
-   Deve essere implementata utilizzando `JavaFXML` e, se necessario, `Thread` java. Non è richiesto, ma consigliato, l’uso di `Java Beans`, properties e binding di properties.


### Note {#note}

-   Si raccomanda di prestare molta attenzione alla progettazione dell’applicazione per facilitare il parallelismo nell’esecuzione delle istruzioni e la distribuzione su JVM diverse.
-   Si ricorda che: - Il progetto SW può essere svolto in gruppo (max 3 persone) o individualmente. Se lo si svolge in gruppo la discussione deve essere fatta dall’intero gruppo in soluzione unica.
-   La discussione potrà essere fatta nelle date di appello orale dell’insegnamento, che saranno distribuite su tutto l’Anno Accademico.
-   Si può discutere il progetto SW prima o dopo aver sostenuto la prova orale.
-   Come da regolamento d’esame il voto finale si ottiene come media del voto della prova orale e della discussione di laboratorio (i due voti hanno ugual peso nella media).
-   Il voto finale deve essere registrato entro fine settembre 2022, data oltre la quale non è possibile mantenere i voti parziali. Leggere il regolamento d’esame sulla pagina web delll’insegnamento per ulteriori dettagli.
