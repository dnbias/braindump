+++
title = "Etica e Filosofia nell'Intelligenza Artificiale: definire i limiti dello sviluppo"
author = ["Daniel Biasiotto"]
date = 2023-12-18T08:07:00+01:00
tags = ["video", "talk", "compsci", "ai"]
draft = false
+++

-   Source: <https://www.youtube.com/live/8AGskFyzhY0?si=8XxkoSMBcKYGvJrR>
-   Channel: HKN PoliTo
-   Related: [AI]({{< relref "20210606005210-artificial_intelligence.md" >}}), [Ethics]({{< relref "ethics.md" >}})


## Datapizza[^fn:1] {#datapizza}

-   cos'è l'intelligenza?
    -   capacità di creare modelli astratti di fenomeni complessi
    -   capacità di adattamento
    -   generalizzare esperienze singole in comportamenti generali
-   [Attention is all you need]({{< relref "attention_is_all_you_need.md" >}})
    -   la memorizzazione di grandi quantità di dati porta overfitting
    -   modulo di attenzione per gestire efficientemente la capacità predittiva del modello
-   **The Pile**
    -   dataset di [OpenAI]({{< relref "openai.md" >}})
    -   costruito con crawler
    -   codice, letteratura scientifica, legale, prosa, conversazioni
-   embedding
    -   mapping del vocabolario naturale in uno spazio vettoriale del modello
    -   ogni punto indica un concetto e operazioni vettoriale su questi punti portano spostamenti nello spazio vettoriale e a concetti diversi
    -   spazio semantico &rarr; spazio vettoriale
-   allucinazioni
    -   un **AI** non è una buona fonte, non sa cosa è giusto o sbagliato
-   ChatAI come interfaccia per i servizi nel futuro
-   consulenti che utilizzano la AI come supporto sono più produttivi e accurati
-   compiti:
    -   solo per me
    -   delegati
    -   centaur
        -   collaborazione _back and forward_
-   trade-off
    -   efficienza ma meno unicità
    -   come gestiamo una transizione verso una agency maggiore delle AI
    -   impatto su lavori o su parte di un workflow di un umano
    -   bias nel modello[^fn:2]
        -   le industrie **vogliono** modelli biased che riflettono accuratamente le attuali ingiustizie e differenze sociali[^fn:3]
        -   mantenere i bias sociali significa mantenere il proprio potere predittivo
        -   il bias sta nei dati o in chi a creato il dataset?
    -   controllo tramite AI sempre più forte
    -   accesso alle risorse, come fare con l'OpenSource?


## [Guido Boella]({{< relref "guido_boella.md" >}}) {#guido-boella--guido-boella-dot-md}

-   SIpEIA
-   <https://ai-aware.eu>
-   ai generated Tank Man
    -   primo nei risultati Google Image
-   il bias sociale è riflesso nell'output dei modelli
-   [On the Dangers of Stochastic Parrots]({{< relref "on_the_dangers_of_stochastic_parrots.md" >}})
    -   causa del licenziamento delle due Head of Ethics in Google
    -   **Unfathomable Training Data**
        -   _incapable of being fully explored or understood_
        -   buona parte dei problemi dei modelli sta nella difficoltà nel gestire i dataset
        -   la grandezza non garantisce diversità, il web è orientato
        -   sistemi statici, conservatori _by design_: guardano al passato
            -   i temi che stanno nascendo sono per definizione sotto-rappresentati
        -   _encoding bias_, non fanno altro che codificare i pregiudizi reali
    -   la tecnologia è sempre politica
        -   i problemi insiti nei modelli non sono risolvibili, almeno non del tutto, tecnicamente
    -   _manipulation of users_
        -   gli umani sono condizionati a attribuire intenzioni comunicative a messaggi in linguaggio naturale
            -   si attribuiscono emozioni, intelligenza, capacità a [LLM]({{< relref "llm.md" >}}) che non ne hanno
        -   il significato viene costruito nell'interazione simmetrica e continua tra umani, il modello è invece asimmetrico
        -   quello che ci è presentata è una **illusione**, il significato è attribuito dall'umano a un semplice processo statistico
        -   [Stochastic Parrot]({{< relref "stochastic_parrot.md" >}})
        -   [J.Weizenbaum]({{< relref "j_weizenbaum.md" >}}) aveva descritto la stessa illusione con [ELIZA]({{< relref "eliza.md" >}})
-   Allucinazione
-   Plagio
    -   [OpenAI]({{< relref "openai.md" >}}) ha pubblicato un sistema di analisi e riconoscimento AI/umano: pessime performance e fatto sparire dopo qualche mese
-   Libri generati da [AI]({{< relref "20210606005210-artificial_intelligence.md" >}}) e spacciati come reali sono sempre di più
-   Fake News sempre più credibili
    -   Deep fake _My Blond GF_
    -   **QAnon** nato da post su 4chan
        -   [LLM]({{< relref "llm.md" >}}) in grado di fare propaganda sui social media hanno potenzialità ben maggiori
-   Copyright
    -   il fatto che i dati siano pubblici non equivale che possano essere utilizzati per farci business
        -   compreso contenuto pirata
    -   [GRRM]({{< relref "20210531215418-g_r_r_m.md" >}}) e altri autori fanno causa per [OpenAI]({{< relref "openai.md" >}})
    -   la potenzialità di modelli in mano a chiunque in grado di riprodurre testi e stili di autori che detengono il proprio diritto di autore è molto maggiore di quello di singoli individui con capacità artistiche che volessero tentare lo stesso
    -   [OpenAI]({{< relref "openai.md" >}}) e Google stanno cercando di sovvertire la giurisprudenza sul tema
        -   cercano di proporre soluzioni **opt-out** quando la legge è chiaramente **opt-in** alla cessione dei propri dati e le proprie produzioni
            -   quando poi non c'è modo di verificare se il contenuto che io volevo negare è stato inserito all'interno dei modelli
-   Daniel Dennett: [The Problem With Counterfeit People]({{< relref "the_problem_with_counterfeit_people.md" >}})


### Letture {#letture}

-   [Klara and the Sun]({{< relref "klara_and_the_sun.md" >}})
-   [[[never_let_me_go.md]({{< relref "never_let_me_go.md" >}})][Never Let Me Go]

[^fn:1]: ha letto [Weapons of Math Destruction]({{< relref "weapons_of_math_destruction.md" >}}).
[^fn:2]: i bias dei creatori  vanno a finire nelle loro creazioni
[^fn:3]: e le rinforzano, è una downward spiral che descrive benissimo [Cathy O'Neil]({{< relref "cathy_o_neil.md" >}}) una [WMD]({{< relref "weapons_of_math_destruction.md" >}})
