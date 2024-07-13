+++
title = "PhotOntology"
author = ["Daniel Biasiotto"]
date = 2023-01-27T17:09:00+01:00
draft = false
+++

## Motivazioni {#motivazioni}

Il dominio scelto per lo svolgimento di questo progetto è stato quello della fotografia.
Questa arte è stata fin dalla sua nascita nel primo ottocento un grande motore culturale, sociale e politico e avrà sicuramente ancora per molto tempo un ruolo centrale nella cultura umana.

Questo senza ignorare la centralità rinnovata che il linguaggio per immagini continua a sviluppare nel mondo dei social network e  della messaggistica istantanea.

Ci sono diversi progetti di archiviazione e catalogo di fotografie in rete, le più importanti sono:

-   [Getty - Photo Archive](https://www.getty.edu/research/tools/photo/)
    -   archivio di opere d'arte in corso di digitalizzazione contenente oltre due milioni di fotografie
-   [The Commons](https://www.flickr.com/commons)
    -   progetto di **Flickr** lanciato nel 2008 in collaborazione con la _Library of Congress_, con l'obiettivo di aumentare l'accesso a collezioni fotografiche pubbliche
-   [Europeana](https://www.europeana.eu/en/collections/topic/48-photography)
    -   progetto europeo in collaborazione con migliaia di archivi, biblioteche e musei per condividere il bene culturale europeo
-   [Project Apollo Archive](http://apolloarchive.com/)
    -   progetto composto da scan fotografiche del Kennedy Space Center di archiviazione e catalogo delle fotografie scattate durante l'allunaggio
-   [Istituto Centrale per il Catalogo e la Documentazione](http://www.iccd.beniculturali.it/it/194/fondi-fotografici)
    -   catalogo fotografico gestito dal Ministero della Cultura


## Requisiti {#requisiti}

-   **Finalità**
    -   creare una tassonomia il più semplice e chiara possibile per descrivere il dominio
    -   facilitare la ricerca e la scoperta di opere tramite collegamenti tra risorse
-   **Task**
    -   consultazione delle specifiche tecniche delle fotografie
    -   verifica di informazioni sulle fotografie
    -   esplorazione del grafo tramite collegamenti inferiti ad altre fotografie (stesso autore, stesso genere, stessa macchina fotografica)
-   **Target Utenti**
    -   professionisti
    -   storici


## Descrizione del dominio {#descrizione-del-dominio}

Partendo dalla definizione Treccani di fotografia:

> Procedimento che, mediante processi chimico-fisici, permette di ottenere, servendosi di un apposito apparecchio (macchina fotografica), l’immagine di persone, oggetti, strutture, situazioni: una lastra o una pellicola trasparente rivestite di un’emulsione sensibile alla luce (o ad altra radiazione attinica, per es. i raggi X) sono impressionate dalla luce riflessa dal soggetto attraverso l’obiettivo della macchina, e sono sviluppate ed eventualmente riprodotte su altro supporto di materiale fotosensibile per stampa a contatto o per ingrandimento in quante copie si vogliono, di identico o differente formato; si distinguono, sotto l’aspetto tecnico e del risultato, una f. in bianco e nero e una f. a colori, secondo che si riproduca il soggetto rendendo con sfumature più o meno intense di grigio le differenze di colore e di luminosità, oppure che lo si riproduca, grazie a una tecnica più complessa, con i suoi colori naturali.

Il dominio si articola quindi in:

-   Fotografia
    -   Caratterizzabile dal periodo storico e dal luogo in cui è stata scattata
    -   Dimensioni (altezza x larghezza)
-   Agenti
    -   Soggetto
    -   Autore
-   Attrezzatura
    -   Corpo Macchina
    -   Lente
-   Medium
    -   Pellicola
    -   Digitale
    -   Stampa di qualche tipo
-   Genere
    -   Ritratto
    -   Glamour
    -   Natura
    -   etc.


### Sitografia {#sitografia}

1.  <https://en.wikipedia.org/wiki/Photography>
2.  <https://en.wiktionary.org/wiki/photography>
3.  <https://sigma.ontologyportal.org> (Photographing, Photography, Photograph, Camera, Lens)
4.  <http://wordnetweb.princeton.edu> (Photography, Photograph, Camera, Lens)
5.  <https://www.treccani.it/vocabolario/fotografia/>


## Documentazione {#documentazione}

-   [Guidelines](https://www.nps.gov/history/hdp/standards/index.htm) per la libreria del congresso sulla documentazione storica
-   [Formazione fototeche](https://www.aib.it/aib/commiss//libro/w/x080303a.htm) da parte dell'associazione italiana biblioteche riporta delle linee guida:
    -   segnalano i criteri più comuni per l'ordinamento
        -   alfabetico per autore
        -   cronologico
        -   geografico
        -   per materia
    -   suggeriscono di tenere insieme
        -   collezioni, raccolte, portfolio, _reportage_
        -   fotografie realizzate con un'unica tecnica
        -   gruppi assemblati per tema o soggetto
    -   riportare nell'inventario
        -   formato
        -   tecnica
        -   esistenza di negativo/positivo dell'originale
        -   diritti d'autore
        -   data di esecuzione
-   [Pale Blue Dot (wikipedia)](https://en.wikipedia.org/wiki/Pale_Blue_Dot)
-   [Pale Blue Dot Revisited (JPL)](https://photojournal.jpl.nasa.gov/catalog/PIA23645)
-   [Migrant Mother (wikipedia)](https://en.wikipedia.org/wiki/Migrant_Mother)
-   [Migrant Mother (MoMA)](https://www.moma.org/collection/works/50989)

Vedere `Figure 1, 2, 3, 4, 5` per screenshot delle pagine che sono state consultate per le opere.

{{< figure src="~/Pictures/20230127_18h46m54s_grim.png" caption="<span class=\"figure-number\">Figure 1: </span>Catalogo sul sito del MoMA di Migrant Mother" >}}

{{< figure src="~/Pictures/20230127_18h47m14s_grim.png" caption="<span class=\"figure-number\">Figure 2: </span>Catalogo sul sito del MoMA di Migrant Mother" >}}

{{< figure src="~/Pictures/20230127_18h48m33s_grim.png" caption="<span class=\"figure-number\">Figure 3: </span>Catalogo sul sito della NASA di Pale Blue Dot Revisited" >}}

{{< figure src="~/Pictures/20230127_18h49m07s_grim.png" caption="<span class=\"figure-number\">Figure 4: </span>Catalogo su wikipedia di Migrant Mother" >}}

{{< figure src="~/Pictures/20230127_18h53m59s_grim.png" caption="<span class=\"figure-number\">Figure 5: </span>Catalogo di una foto storica sull'archivio del Ministero dei Beni Culturali" >}}

\pagebreak
L'ontologia è stata allineata con due ontologie ritenute utili a questo scopo:

-   DOLCE, come ontologia di alto livello;
-   FaBiO, per concetti legati a lavori di creatività pubblicabili e citabili.

In particolare è stata allineata una versione semplificata di Dolce: [DOLCE+DnS_Ultralite](http://ontologydesignpatterns.org/wiki/Ontology:DOLCE+DnS_Ultralite).
La versione di FaBiO allineata può essere trovata a questo [link](https://sparontologies.github.io/fabio/current/fabio.html).

Inoltre è stato utilizzato il pattern architetturale `List` &rarr; `ListItem` per rappresentare serie fotografiche e i loro singoli componenti (`Figure 8`).


## LODE {#lode}

![](~/Documents/UNI/Master/ModSem/PhotOntology/phon/lode-1.JPG)
![](~/Documents/UNI/Master/ModSem/PhotOntology/phon/lode-2.JPG)


## Visualizzazione {#visualizzazione}

Vedere `Figure 6, 7, 8, 9, 10` per screenshot dei grafi e degli individui in Protégé.

{{< figure src="~/Pictures/20230207_04h05m10s_grim.png" caption="<span class=\"figure-number\">Figure 6: </span>Struttura tassonomica di base" >}}

{{< figure src="~/Pictures/20230207_04h09m18s_grim.png" caption="<span class=\"figure-number\">Figure 7: </span>Fotografie" >}}

{{< figure src="~/Pictures/20230207_04h11m41s_grim.png" caption="<span class=\"figure-number\">Figure 8: </span>Pattern tra fotografie e serie fotografiche" >}}

{{< figure src="~/Pictures/20230207_04h14m04s_grim.png" caption="<span class=\"figure-number\">Figure 9: </span>Pagina Protégé di PaleBlueDot" >}}

{{< figure src="~/Pictures/20230207_04h17m23s_grim.png" caption="<span class=\"figure-number\">Figure 10: </span>Pagina Protégé della serie fotografica FamilyPortrait" >}}


## Interazione utente {#interazione-utente}

Una applicazione basata su questa ontologia deve poter soddisfare le richieste degli utenti reperendo le informazioni della base di conoscenza.

Ad esempio, interazioni fondamentali a questo scopo sono:

-   contare il numero di fotografie scattate da ciascun fotografo
-   elencare le fotografie scattate da un fotografo
-   elencare i fotografi che hanno scattato fotografie analogiche
-   elencare le fotografie scattate in un certo luogo
-   elencare le fotografie scattate prima o dopo una certa data

\vspace{10mm} ![](~/Documents/UNI/Master/ModSem/PhotOntology/phon/flowchart_interaction.drawio.png)
\pagebreak

{{< figure src="~/Documents/UNI/Master/ModSem/PhotOntology/phon/mockup.png" >}}

\pagebreak


## SPARQL queries {#sparql-queries}

Elenco dei fotografi per numero di foto scattate:

```text
SELECT (COUNT(*) AS ?count)
WHERE {
  ?photo <phon#shotBy> ?author .
}
GROUP BY ?author
ORDER BY ?count
```

Risultato:

| NASA           | 6 |
|----------------|---|
| Dorethea Lange | 1 |

\vspace{5mm}
Elenco delle foto scattate da Dorothea Lange:

```text
SELECT ?photo
WHERE {
  ?photo <phon#shotBy> ?author .
  FILTER (?author = <phon#DorotheaLange>)
}
```

Risultato:

| Migrant Mother |
|----------------|

\vspace{5mm}
Elenco delle foto scattate in California:

```text
SELECT ?photo
WHERE {
  ?photo <phon#shotIn> ?location .
  FILTER (?location = <phon#California>)
}
```

Risultato:

| Migrant Mother |
|----------------|

\vspace{5mm}
Elenco delle foto analogiche:

```text
SELECT ?photo
WHERE {
  ?photo <phon#medium> ?m .
  FILTER (?m = <phon#Film>)
}
```

Risultato:

| Migrant Mother |
|----------------|

\vspace{5mm}
Elenco delle foto scattate tra il 1990 e il 1999:

```text
SELECT ?photo ?y
WHERE {
  ?photo <phon#year> ?y .
  FILTER (?y <= "1990"^^xsd:positiveInteger &&
          "1999"^^xsd:positiveInteger <= ?y )
}
```

Risultato:

| Venus         |
|---------------|
| Jupiter       |
| Uranus        |
| Saturn        |
| Neptune       |
| Pale Blue Dot |
