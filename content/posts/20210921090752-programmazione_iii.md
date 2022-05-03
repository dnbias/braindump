+++
title = "Programmazione III"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

## Info Corso {#info-corso}

-   Orari:
    -   Mar: 9-11
    -   Gio: 11-13
    -   Mer: 9-11 (Lab1)
-   Testi:
    -   [Java: How to Program, Late Objects]({{< relref "20210921120356-java_how_to_program_late_objects.md" >}})
-   IDE
    -   IntelliJ IDEA


## Teoria {#teoria}


### Programmazione ad Oggetti {#programmazione-ad-oggetti}


#### Concetti Base {#concetti-base}

Secondo <span class="underline">Alan Kay (Smalltalk)</span>

-   Oggetti
    _fornitori di servizi_
    -   Stato
        -   attributi
    -   Tipo/Classe
-   Richieste/Metodi - _delega al metodo, si conosce l'API non l'implementazione_
    -   modificano lo stato
    -   invio richieste ad altri oggetti
    -   comunicazione di informazioni
-   Object-oriented Design
    -   progettazione orientato ad O

-   Classe/Istanza
    -   astratto/concreto
        -   concreto anche in memoria nello Heap


#### p. procedurale vs p. oggetti {#p-dot-procedurale-vs-p-dot-oggetti}

-   Procedurale
    -   Algoritmi + Strutture Dati
-   Oggetti
    -   Oggetti + Collaborazione
        _si scorporano funzionalitá diverse in oggetti diversi:_ **delega**
        1.  dati + algoritmi
        2.  interfacce


#### Gerarchia {#gerarchia}

-   kind-of hierarchy
-   part-of hierarchy

<!--list-separator-->

-  ereditarieta'

<!--list-separator-->

-  polimorfismo

    <!--list-separator-->

    -  Binding Dinamico

        <span class="underline">Binding statico</span>, all'atto della compilazione
        <span class="underline">Binding dinamico</span>, l'esecutore puó controllare i tipi degli oggetti, e decidere a runtime il body del metodo da eseguire

        -   esegue l'implementazione piú specifica possibile
        -   solo sui metodi, le variabili non vanno a fare overriding

        Estremamente modulare e scalabile, meccanismo di delaga

    <!--list-separator-->

    -  Classi Astratte

        Utilizzate come interfaccia comune e pubblica, la sottoclasse andrá a implementare i dettagli

    <!--list-separator-->

    -  Interfacce

        Non possono avere metodi non astratti

        -   non sono soggette all'ereditarietá singola, una classe puó implementare tutte le interfacce di cui ha bisogro

    <!--list-separator-->

    -  Overloading

        Definizione di firma alternativa di metodo esistente
        A tempo <span class="underline">statico</span> viene scelta la firma, é bloccante e se ci sono eventuali overloading vengono persi

        -   a runtime si discende solamente la catena di ereditarietá

    <!--list-separator-->

    -  Overriding

        Diverso dall'Overloading in quanto le firme sono le stesse

<!--list-separator-->

-  reflection


#### Tipi Generici {#tipi-generici}

Introdotti per scrivere codice generico, applicabile a piú tipi di dati

-   **type checking statico**
-   il compilatore previa compatibilitá tra tipo attuale e generico, sostituisce il tipo attuale a E
    -   _erasure_
-   vincoli/restrizioni sul tipo T: upperbound al tipo parametrico
    -   `extends Comparable <T>.`
    -   `extends` a una singola classe
        -   ma multiple inferfacce

<!--list-separator-->

-  Raw types

    Utilizzando Object direttamente, in questo modo peró il compilatore non puó controllare la correttezza dei tipi

<!--list-separator-->

-  Collezioni

    Vincoli sintattici per evitare errori a Runtime che non sarebbero rilevati:

    -   quindi le `Collection` sono controllate per Nome del tipo, non viene considerata l'ereditarietá
        -   si risolve utilizzando l'upcasting

    Per risolvere e definire una `Collection` di qualsiasi cosa

    -   `Collection<?>.`
    -   si utilizza la _wildcard_
        -   per restringerlo si utilizza anche in questo caso `extends`


#### Interfacce {#interfacce}

-   Collection
    -   Add()
-   Iterator
    -   hasNext()
    -   next()


#### Classi e Interfacce innestate {#classi-e-interfacce-innestate}

Innestando una classe dentro l'altra si facilita il codice mantenendo i contenenti privati

-   questo vale sia dalla classe interna che quella estesna

Per information hiding la classe interna puó essere solo meno visibile o uguale a quella esternaPer information hiding la classe interna puó essere solo meno visibile o uguale a quella esternanon puó sempre rispondere

-   le classe `IN` hanno un puntatore `outerThis` che permette di fare riferemento al contenitore
    -   tramite quello hanno accesso come fossero locali

<!--list-separator-->

-  Classi innestate in interfacce

    -   Interfaccia publica
        -   classe statica che rappresenta l'implementazione di default dell'Iterfaccia
    -   si puó estendere oppure

    Possibile avere classi nested anonime definendo in line

    -   `return new Iteratore(){ ... }`

    Posso essere ancora piú sintetico utilizzando le `lambda expression`

    -   ovviamente non deve esserci ambiguitá per quanto riguarda i parametri, un'interfaccia con metodi non ambigui e con poche righe di codice si presta ad una `lambda`
    -   inoltre é possibile omette i tipi dei parametri se sono inferibili
    -   é possibile omettere graffe e `return` se si tratta di una singola istruzione, deve essere una funzione (restituire un valore)
    -   se il paremetro é uno si possono omettere le parentesi tonde


#### Pattern Architetturali {#pattern-architetturali}

Una classe `Kernel` che utilizza una `Interfaccia Modulo` cui poi si sceglierá una implementazione con una `Implementazione del Modulo`

-   `Observer-Observable`
-   `Model View Controller`
-   `Facade`
    -   lavorare in upcasting quando permesso
    -   utilizzare interfacce e non classi specifiche per parti la cui implementazione puó variare


#### IO {#io}

-   Flussi di byte
    -   InputStream
    -   OutputStream
    -   PrintStream
-   File
    -   FileReader
    -   FileWriter

Utile comporre stream

<div class="code">

Buffered Reader in = new BufferedReader(new FileReader("es.txt"))

</div>

Per scrivere e leggere dati primitivi:

-   DataInputStream
-   DataOutputStream

Per scrivere e leggere oggetti (`Serializable`)

-   ObjectInputStream
-   ObjectOutputStream
-   file testuali
    -   Scanner
    -   File
    -   PrintWriter
-   file binari
    -   FileInputStream
    -   FileOutputStream

Da File


#### GUI {#gui}

-   `AWT` - Abstact Window Toolkit
-   `SWING`
    -   `JFrame`
    -   `JApplet`
    -   `JDialog`


### Programmazione ad Eventi {#programmazione-ad-eventi}


#### Event-Driven Programming {#event-driven-programming}

Differentemente da un classico programma, che ad un input restituisce un output seguendo un suo flusso di controllo e solo raramente si attende input dal utente, questa metodologia consiste in procedure che rispondono a certi eventi

-   _event handlers_
-   _events_

Si distinguono due fasi:

-   Ciclo di individuazione degli eventi
-   Gestione degli eventi

Dopo essere stati creati gli _event-handlers_ devono essere associati come _listener_ ad un evento di una specifica sorgente, componente la `GUI`

<!--list-separator-->

-  Eventi

    In `Java`
    Oggetti derivati dalla classe `EventObject`

    -   eventi _semantici_
        -   su componenti virtuali dell'interfaccia
    -   eventi _low-level_
        -   eventi fisici relativi al mouse o tastiera

    Sono gestiti con un meccanismo di <span class="underline">delega</span>

    -   la sorgente, generato un evento, passa un **oggetto** che descrive l'evento ad un listener
        -   registrato presso la sorgente
        -   il passaggio dell'evento cousa l'invocazione di un metodo del _listener_

<!--list-separator-->

-  Sorgenti

    I diversi componenti dell'interfaccia

    -   `JButton`
    -   `JTextField`
    -   `Component`
    -   `Window`

<!--list-separator-->

-  Listener

    O _event-handler_, istanza di una classe che contiene metodi per gestire gli eventi
    Per ogni tipo di evento é definita una interfaccia che il _listener_ deve implementare

    -   `ActionListener`
        -   `void addActionListener(ActionListener I)`
    -   `MouseListener`
    -   `MouseMotionListener`
    -   `WindowListener`

    Per non dover implementare tutti i metodi dell'interfaccia che ci interessa sono state introdotte le _classi filtro_

    -   implementazioni di default delle interfacce dei listener
        -   metodi che non fanno nulla
        -   si fa _overriding_ solamente dei metodi di gestione che ci servono

    -   `WindowListener` &rarr; `WindowAdapter`


#### Organizzazione e uso GUI {#organizzazione-e-uso-gui}


#### Model View Controller {#model-view-controller}

`MVC`

-   Model
    -   memorizza e recupera i dati
    -   mantiene lo stato dell'applicazione
-   View
    -   gestisce l'interfaccia
    -   visualizza i dati del _Model_
    -   gestisce l'interazione con l'utente
-   Controller
    -   interpreta l'input dell'utente
    -   istruisce il _Model_ in base all'input

Separa le implementazioni, in questo modo sono indipendenti e facilmente sostituibili

-   solitamente il legame principale é tra _controller_ e _modello_ e _controller_ e _view_
-   il legame diretto tra _modello_ e _vista_ é contemplato solo in situazioni piú semplici
    -   il refresh della vista é automatizzato dal modello `Observer-Observable`
        -   al cambiamento il _model_ segnala il cambiamento agli osservatori


#### JavaFX {#javafx}

Il successore di `SWING`

-   separa il contenuto dalla sua visualizzazione tramite _stylesheet_ `CSS`
-   permette il binding di property dei Model con elementi dell'interfaccia utente aggiornando automaticamente le viste
-   offre classi/interface che implementano Observer Observable
-   permette anche di scrivere interfacce in `XML`

<!--list-separator-->

-  Componenti

    -   Stage
        -   finestra
    -   Scene
        -   una principale
    -   Panels
    -   Buttons

<!--list-separator-->

-  Scene Builder


### Programmazione Multithread {#programmazione-multithread}

_Stesso processo - Esecuzione concorrente di istruzioni_
Piú leggeri rispetto ai processi concorrenti

-   in `JFrame` viene attivato un thread di interfaccia utente
    -   contiene tutti i <span class="underline">listener</span> dell'interfaccia

Si utilizzano classi in estensione a `Thread`

-   si creano in memoria con la `new`
-   si lanciano in parallelo il metodo `run()` con il metodo `start()`
-   si puó inserire lo `start()` all'interno del costruttore

Questo ha il problema dell'ereditarietá singola.

Per separare logicamente `Thread` (esecutore) e ció che va eseguito esiste l'interfaccia `Runnable`

-   contengono il metodo `run()`
-   eseguibile con `new Thread(Runnable r)`

I `Thread` possono eseguire il metodo `join(Thread t)` per aspettare che `t` abbia terminato `run()` per continuare la propria esecuzione


#### Deamon {#deamon}

Un `Thread` puó essere dichiarato come `Deamon`

-   utilizzato per servizi

In particolare termina solo quando tutti i `Thread` parenti terminano


#### Sincronizzazione {#sincronizzazione}

Necessaria su oggetti con accesso condiviso

-   in particolare quando le operazioni eseguite non sono _atomiche_

Le sezione critiche possono essere gestite con:

-   `Semaphore(int n)`
    -   `acquire()`
    -   `release()`

In `Java` peró ogni `Object` é dotato di `lock`

-   ogni istanza possiede un semaforo binario `lock`
-   questo é utilizzato con la dichiarazione del metodo `synchronized`
-   il `lock` é sulla singola instanza dell'oggetto, quindi la sincronizzazione avviene su piú esecuzioni di metodo `synchronized` dello stesso oggetto
-   sincronizzazione _server side_
    -   i client chiamano senza preoccuparsi, della sincronizzazione se ne occupa il server

Anche l'oggetto `Class` relativo ha un `lock`

-   relativo a tutto ció che statico

Per dichiarare sezioni critiche solamente sezioni di metodi si utilizza il metodo:

-   `synchronized(Object o)`

Per i puntatori o contatori esiste `AtomicInteger`

<!--list-separator-->

-  Thread

    I `Thread` possono attendere lo stato giusto della risorsa con il metodo:

    -   `wait()`
        -   sbloccati attraverso notifica
        -   `notifyAll()`
        -   `notify()`
            -   risvegli il primo della coda di `wait`

    Le due situazioni che si possono creare con un utilizzo errato della sincronizzazione:

    -   _deadlock_
    -   _starvation_

    Tra `Thread` la comunicazione puó essere gestita facilmente con le `Pipe`

<!--list-separator-->

-  BlockingQueue

    Interfaccia generica

<!--list-separator-->

-  Lock e Condition

    Ogni oggetto ha un lock implicito.
    Per usare lock espliciti si utilizza l'interfaccia `Lock`
    Implementata ad esempio in `ReentrantLock`

    -   `newCondition()`
        -   restituisce un oggetto di tipo `Condition`
            -   `await()`
            -   `signal()`
            -   `signalAll()`

    `ReadWriteLock`

    -   `Lock readLock()`
    -   `Lock writeLock()`


#### Pool {#pool}

`Thread Pool`
Si creano un numero di `Thread` in un colpo solo a cui sono poi assegnati man mano i compiti da eseguire.

-   sono dotati di coda in cui sono inserite le task man mano
-   il `Pool` si auto gestisce le code bilanciandole

<!--list-separator-->

-  Executor

    `Executor` Interface

    -   `ExecutorService newFixedThreadPool(int n)`
    -   `ScheduleExecutorService newScheduledThreadPool(int n)`
    -   `ScheduleAtFixedRate`

    `shutdown()`


#### Runnable {#runnable}

Task che corrisponde a un metodo con ritorno `void`


#### Callable&lt;T&gt; {#callable-t}

Task che é parametrizzato con `T` generico

-   `public T call()`

<!--list-separator-->

-  Future&lt;T&gt;

    `Futuretask(Callabre<T> task)`

    -   `isDone()`
    -   `get()`
        -   sospende in caso non abbia ancora terminato la computazione


### Programmazione in Rete {#programmazione-in-rete}


#### Architettura Client-Server {#architettura-client-server}


#### Socket {#socket}

`Pipe` per applicativi su macchine diverse

-   l'unica differenza e' la connessione remota

Il package Java che permettono l'uso di queste funzionalita' e' `java.net`

```java
import java.net;
try {
    String ip = "time-c.nist.gov";
    int port = 14;
    Socket s = new Socket(ip, port);
} catch (IOException e) {
    e.pringStackTrace();
} finally {
    s.close();
}
```


#### Server Socket {#server-socket}

Con l'uso di `accept()` ci si mette in attesa di una richiesta di connessione da un socket client

```java
try {
   ServerSocket server = new ServerSocket(port);
   Socket client = s.accept();

   try {
       InputStream in = client.getInputStream();
       OutputStream out = client.getOutputStream();
   } catch (IOException e) {
       e.pringStackTrace();
   }
} catch (IOException e){
    e.pringStackTrace();
} finally {
    try {
        client.close();
        server.close();
    } catch (IOException e) {
        e.pringStackTrace();
    }
}
```

Per servire piu' client:

```java
while (true){
    Socket incoming = s.accept();
    Runnable r = new ThreadedEchoHandler(incoming);
    Thread t = new Thread(r);
    t.start();
}
```


#### Polimorfismo {#polimorfismo}

Il polimorfismo viene mantenuto ma il client deve disporre delle definizioni necessarie
Questo tipo di operazione crea problemi di sicurezza e `Loader`

-   se si utilizzano classi definite da noi
-   ma queste classi non sono controllate
    -   se le classi devono essere scaricate da rete dinamicamente esiste
    -   `Security Manager`
        -   specificati permessi
            -   `IP` specifici
            -   tipo di connessioni
        -   permette l'uso di `class loader` dinamico


#### Polimorfismo {#polimorfismo}


#### Esecuzione Distribuita {#esecuzione-distribuita}


## Laboratorio {#laboratorio}


### MVC {#mvc}

1.  <~/Uni/III/ProgIII/L/MVC/org/prog3/lab/week6/es1/es1_svolto/Exercise1.java>
2.  <~/Uni/III/ProgIII/L/MVC/org/prog3/lab/week6/es2/ProverbsApp.java>


### Progetto {#progetto}

[eMail Client-Server]({{< relref "20211110134630-email_client_server.md" >}})

-   Server
    -   ha una interfaccia grafica con il log delle operazioni client-server
-   Modello
    -   mail
        -   account
            -   ben formata
        -   lista di messaggi - inbox
            -   eventualmente vuota se non ha messaggi
            -   List di Classe `EMail`
                -   ID
                -   mittente
                -   destinatario / destinatari
                -   soggetto
                -   testo
                -   data
                -   ...
-   Client
    -   associato ad un account
    -   Intefaccia grafica
        -   creazione / invio mail
        -   lettura messaggi inbox
        -   rispondere a un messaggio
        -   forward di un messaggi
        -   rimozione messaggi
        -   aggiornata
            -   notifica nuovi messaggi
    -   lo stato dell'Inbox mantenuto lato server
        -   _attendere riscontro docenti_
    -   il client dovrebbe funzionare anche se ci sono problemi di connessione con il server
        -   avvertendo il client
-   Multithreading
    -   se una operazione puó essere parallelizzata allora deve esserlo
-   `Properties / Java Beans`
    -   per l'implementazione della `View`
    -   consigliato