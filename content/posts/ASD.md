+++
title = "Algoritmi e Strutture Dati"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

Esame

-   scritto
-   discussione laboratorio

Libro

-   Introduzione agli algoritmi e strutture dati


## [Problems &amp; Algorithms]({{< relref "20210414192358-problems_algorithms.md" >}}) {#problems-and-algorithms--20210414192358-problems-algorithms-dot-md}


## [Data Structures]({{< relref "20210414192432-data_structures.md" >}}) {#data-structures--20210414192432-data-structures-dot-md}


## Laboratorio {#laboratorio}


### Fonti utili {#fonti-utili}

-   Cormer, Leiserson, Rivest, Stein: Introduzione agli algoritmi e strutture dati
-   Pro Git
    -   bibbia di git
-   Junit 4
    -   per lo unit testing in java


### Indicazioni per il progetto {#indicazioni-per-il-progetto}

Vedere [GitLab](https://gitlab2.educ.di.unito.it/pozzato/laboratorio-algoritmi-2020-2021) del dipartimento.

-   Negli esercizi dove é richiesta l'implementazione di una libreria + applicazione
    -   netta separazione fra libreria e applicazione
    -   lib deve offrire un insieme di funzionalitá potenzialmente utili a qualunque utili a qualunque applicazione
    -   l'implementazione nen deve essere influenzato in alcun modo dagli usi di essa eventualmente richiesti
-   Nelle librerie
    -   information hiding
        -   non definire metodi pubblici se hanno solo uso interno
        -   Java: utilizzo adeguato dei modificatori di accesso
        -   C: suddividere le dichiarazioni e l'implementazione fra header e file .c
    -   i metodi esposti non devono richiedere la conoscenza dell'implementazione specifica
-   Modularizzare il codice
    -   lunghezza: 30 righe considerando anche i commenti e whitespace
    -   commenti prima di una definizione che spieghi il funzionamento dell'oggetto definito
        -   evitare il commentare direttamente il codice in se, dovrebbe essere chiaro
-   Nomi **significativi** e in **inglese**
    -   Java: package, TheClass, theMethod(), THE_CONSTANT
    -   C (convenzioni GTK+): THE_MACRO, THE_CONSTANT, TheType, TheStruct, the_function()


### Unit Testing {#unit-testing}

-   **UNIT Test**
    -   verificano porzioni di codice
    -   test funzionali, verificano correttezza
        -   piccoli e autocontenuti
        -   test di singole unitá di codice
    -   predipongono un input
    -   invocano la unit
    -   verificano che output o side-effect sia corretto
        -   attraverso asserzioni
            -   asserzione del risultato atteso
            -   in caso di fallimento il test viene interrotto ed é restituito un messaggio d'errore
    -   un classico approccio é quello di scrivere tutti gli unit test prima di implementare il codice
    -   test su casi limiti e casi semplici
    -   devono essere **focalizzati**
        -   un singolo unit test deve focalizzarsi su un solo unit
        -   se sono presenti piú asserzioni questo puó essere un segnale di poca focalizzazione del test
    -   devono essere **indipendenti**
        -   l'ordine non deve mai influire sul loro risultato
        -   input e output di test diversi non devono essere comunicanti tra loro
        -   questo vincolo é imposto da Junit ricaricando l'intera classe in memoria prima di eseguire ciascun metodo di test e seguendo i test in ordine casuale
    -   devono essere **automatici**
        -   non devono richiedere l'intervento umano
        -   non devono dare output interni
-   Una suite di unit test migliora la documentazione di un progetto

Java: `JUnit`
C:    `Unity`


### Git {#git}

Sistema di Versioning del software

-   [Pro Git](https://git-scm.com/book/en/v2)
-


### Java {#java}


#### Documentazione secondo JavaDoc {#documentazione-secondo-javadoc}


#### Hash-code {#hash-code}

Fare attenzione che sia consistente con Equals

-   quando si implementa `compare`


#### BufferedReader {#bufferedreader}

Utilizzato per leggere `file.csv` di input


#### Try with resources {#try-with-resources}


#### String.split() {#string-dot-split}


### C {#c}


#### Documentare nell'header {#documentare-nell-header}


#### Generici non disponibili {#generici-non-disponibili}

Utilizziamo puntatori a puntatori void

-   `void** array`


#### Comparatori {#comparatori}

Si richiede all'utente un puntatore ad una funzione
che implementa il comparator


#### Unit Testing {#unit-testing}

-   Assert
-   Unity
    -   non é uno standard ma é utile


### Algoritmi {#algoritmi}


#### [Generic Merge-Binary Insertion Sort]({{< relref "20210409200632-generic_merge_binary_insertion_sort.md" >}}) {#generic-merge-binary-insertion-sort--20210409200632-generic-merge-binary-insertion-sort-dot-md}


#### [Dynamic Edit Distance]({{< relref "20210409200833-dynamic_edit_distance.md" >}}) {#dynamic-edit-distance--20210409200833-dynamic-edit-distance-dot-md}


#### [Union-Find Set]({{< relref "20210516213623-union_find_set.md" >}}) {#union-find-set--20210516213623-union-find-set-dot-md}
