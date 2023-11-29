+++
title = "Problems & Algorithms"
draft = false
+++

## Problemi e Algoritmi {#problemi-e-algoritmi}


### Problemi Computazionali {#problemi-computazionali}

Collezione di domande (istanze-ingressi) per cui sia stabilito un criterio astratto per riconoscere le risposte (uscite) corrette

-   Es
    -   Massimo comune divisore
    -   moltiplicazione fra due interi
    -   fattorizzazione
    -   ordinamento
    -   percorso ottimo in un grafo

Un Problema é una <span class="underline">Relazione Binaria</span>
\\(R = {(istanza,risposta) : istanza, risposta soddisfano...}\\)
Il <span class="underline">dominio</span> della relazione é l'insieme delle domande possibili
R é <span class="underline">univoca</span> se ogni istanza ammette una sola risposta


### Algoritmi {#algoritmi}

Metodo meccanico per risolvere un Problema Computazionale

-   Procedura
    -   produce un output qualsiasi da input
-   Algoritmo
    -   procedura che termina per ogni ingressa ammissibile

Un algoritmo é detto deterministico se sullo stesso input fornisce sempre lo stesso output

-   ad ogni algoritmo deterministico possiamo associare una finzione input-output

Un algoritmo risolve R, ossia é corretto rispetto ad R, se la sua funzione A associa una risposta ad ogni istanza di R

Un programma implementa piú algoritmi, inoltre implementa opportune strutture dati


#### Peak Finding {#peak-finding}

Input: vettore A[0...n-1] interi positivi
Output: un intero 0&lt;= p &lt;n t.c. A[p-1]&lt;=A[p]&gt;=A[p+1] dove A[-1]=A[n]=-inf

```text
Peak(A)
for(i=0;i<length(A);i++)
    if(A[i]>=A[i-1] && A[i]>=A[i+1])
        return i
end for
```

<!--list-separator-->

-  Left Peak Finding

    Nel caso migliore `p=0` é un picco
    Nel caso peggiore `p=n-1` confronti

<!--list-separator-->

-  Max Peak Finding

    ```text
    MAX-PEAK(A)
    r = 0
    i = 1
    while(i<n-1)
        if A[i] > A[r]
            r <- i
        i <- i+1
    end while
    return r
    ```

    Fa sempre lo stesso numero di confronti, sempre `n-1`

<!--list-separator-->

-  Analisi

    Teorema picco
    Si trovano segmenti sempre piú corti su cui vale il teorema a partire da un `q` centrale.

<!--list-separator-->

-  Divide et Impera

    ```text
    PEAK-DI(A,i,j)
    p<-(i+j)/2
    if A[p-1]<=A[p]>=A[p+1] then
        return p
    else
        if A[p-1]>A[p] then
            return PEAK-DI(A,i,p-1)
        else
            return PEAK-DI(A,p+1,j)
        endif
    endif

    PEAK-FIND-DI(A,n)
    return PEAK-DI(A,0,n-1)
    ```

    \\(T(n)=\begin{cases} 1 & n=1 \\\ T(\frac{n}{2})+1 & n>1 \end{cases}\\)
    \\(T(n)=T(\frac{n}{2^k})+k\\) per \\(1\le k \le \log\_{2}n\\)
    \\(T(n)=1+\log\_{2}n\\)


### Insolubilitá e Intrattabilitá {#insolubilitá-e-intrattabilitá}

-   non tutti i problemi hanno una soluzione algoritmica (problema della `terminazione`)
-   `intrattabile` é un problema che ha una soluzione algoritmica ma il cui sforzo computazionale é troppo grande


### Correttezza {#correttezza}

`Totale` e `Parziale`

Specifica

-   Precondizioni
-   Postcondizioni
    -   criterio che stabilisce come deve essere fatto l'output


#### Ricorsione {#ricorsione}

Un problema si presta alla ricorsione quando la soluzione con un certo input ha una <span class="underline">relazione semplice</span> con la soluzione del problema con uno o piú input diminuiti

```text
HANOI(n,sorgente,destinazione,appoggio)
PRE:
- n>0
- base degli n dischi in alto ha diametro piú piccolo del disco piú in alto sia di destinazione che di appoggio
POST:
- torre di n dischi piú in alto su sorgente é spostata su destinazione

if n-1 then
    sposta un disco da sorgente a destinazione
else
    HANOI(n-1, sorgente, appoggio, destinazione)
    sposta un disco da sorgente a destinazione
    HANOI(n-1, appoggio, destinazione, sorgente)
endif
```

```text
DIV-REC(a,b)
- Pre: a >= 0, b > 0
- Post: q,r t.c. a == bq + r && 0 <= r < b
if a < b then
    q,r <- 0,a
else
    q',r <- DIV-REC(a-b,b)
    q <- q'+1
end if
return q,r
```

<!--list-separator-->

-  Schema dell'induzione semplice

    1.  Caso base P(1)
    2.  Passo induttivo P(m+1), P(m) é l'ipotesi induttiva
    3.  1. e 2. implicano che \\(\forall n \ge 1, P(n)\\)

<!--list-separator-->

-  Schema dell'induzione completa

    1.  Caso base
    2.  Passo induttivo
    3.  Conclusione


#### Iterazione {#iterazione}

**Divisione Interativa**:

```text
DIV_IT(a,b)
while r >= b do
    r <- r-b
    q <- q+1
end while
return r,q
```

Si utilizzano le <span class="underline">invarianti</span> per la dimostrazione di correttezza

-   sempre vera:
    -   inizializzazione
    -   mantenimento
        -   vale prima del ciclo `->` vale anche dopo il corpo del ciclo

Va scelto in modo che sia utile per la dimostrazione di correttezza


### Terminazione {#terminazione}

T2 temporal prover

-   la non terminazione puó essere semplicemente causata da un errore logico
-   non terminazione implicita nel problema
    -   problema \\(3n+1\\)
        -   <span class="underline">Congettura di Collatz</span>

É difficile dimostrare la terminazione se i parametri non decrescono in tutti i casi
Spesso gli algoritmi diminuiscono la dimensione dei parametri, l'ampiezza dell'intervallo


### Problema del Ordinamento - Sorting {#problema-del-ordinamento-sorting}


#### Binary Search {#binary-search}

aka `Ricerca Dicotomica`

-   <span class="underline">dimezza la dimensione del problema</span> ad ogni passo

<!--listend-->

```text
BinSearch-Ric(x,A,i,j)
- Pre: A[i...j] ordinato
- Post: true se x appartiene A[i...j]
if i>j then
    return false
else
    m <- floor((i+j)/2)
    if x == A[m] then
        return true
    else
        if x<A[m] then
            return BinSearch-Ric(x,A,i,m-1)
        else
            return BinSearch-Ric(x,A,m+1,j)
        end if
    end if
end if
```

Casi

-   best: \\(1\\)
-   worst: \\(log\_2 n\\)


#### Insertion Sort {#insertion-sort}

per ordinare `A[1...n]`:

-   la parte `A[1...i-1]` giá ordinato
-   si puó inserire l'elemento `A[i]` nella parte ordinata tramite scambi
    -   se `A[i] > A[i-1] -> A[1...i]` é ordinato e ci si ferma; altrimenti si scambia `A[i]` con `A[i-1]`
    -   se `A[i-1] > A[i-2] -> A[1...i]` é ordinato; altrimenti si scambia `A[i-1]` e `A[i-2]`
    -   ...

Si parte inserendo `A[2]` poi si prosegue fino a `n`

```text
Insertion-Sort(A)
for i<-2 to length(A) do
    j<-i
    while j>1 and A[j-1]>A[j] do
        scambia A[j-1] con A[j]
        j<-j-1
    end while
end for
return A
```

<!--list-separator-->

-  Terminazione

    assicurata dalla limitatezza dei cicli **for** e **while**

<!--list-separator-->

-  Correttezza

    2 cicli `->` 2 invarianti

    1.  `A[1...i-1]` é ordinato
        -   corretto se il ciclo interno é corretto
    2.  `A[1...j-1]` e `A[j...i]` sono ordinati  `&&` `A[1...j-1] \le A[j+1...i]`

    All'uscita dell'algoritmo abbiamo `i` uguale a `n+1` che implica che tutto il vettore `A[1...n]` é ordinato

<!--list-separator-->

-  Complessitá

    dipende da `n` e dalla distribuzione all'interno del vettore
    assegnamo un costo ad ogni riga dell'algoritmo e lo moltiplichiamo alle volte per cui é eseguito

    1.  for     - `n`
    2.  `<-`      - `n-1`
    3.  while   - \\(\sum\_{i}^{n}{t\_i-1}\\)
        a. 1 nel caso migliore
        b. i nel caso peggiore
    4.  scambio - \\(\sum\_{i}^{n}{t\_i-1}\\)

    **Worst**:
    \\(an^2 + bn + c\\)
    Nel caso peggiore Insert-Sort ha <span class="underline">complessitá temporale quadratica</span>
    **Best**:
    \\(dn + e\\)
    Nel caso migliore Insert-Sort ha <span class="underline">complessitá temporale lineare</span>


#### Selection Sort {#selection-sort}

Assumiamo che la parte sx del vettore sia giá ordinata e che contenga elementi &lt;= di questa parte a dx

-   cerchiamo l'elemento minimo della parte dx e lo spostiamo in ultima posizione a sx (diminuendo la dimensione del problema)

<!--listend-->

```text
Selection-Sort(A)
for i <- 1 to length(A)-1 do
    j <- i+1
    k <- i
    while j < length(A)+1 do
        if A[j] < A[k] do
            k <- j
        end if
        j <- j+1
    end while
    scambia A[i] e A[k]
end for
return A
```

<!--list-separator-->

-  Terminazione

    Implicata dalla terminazione dei cicli

<!--list-separator-->

-  Correttezza

    2 Invarianti

    1.  `A[1...i-1]` ordinato e `A[i...n]` &lt;= `A[1...i-1]`
    2.  `A[k]` &le; `A[i...j-1]`

<!--list-separator-->

-  Complessitá

    Sia nel caso migliore che nel caso peggiore,
    Complessitá temporale quadratica


#### Alberi di Decisione {#alberi-di-decisione}

le foglie dell'albero devono essere tutte le possibili pormutazioni degli elementi del vettore

-   \\(n!\\)
-   per costruire un albero con un numero tale di foglie sono necessari almeno \\(\log\_2 n!\\) livelli
-   Usando la formula di Stirling per approssimare \\(n!\\)
    -   \\(n \log\_2 n\\)

Che cresce molto piú lentamente di una funzione quadratica

-   ció implica che esistano algoritmi molto piú efficienti di quelli quadratici visti


### Complessitá di un algoritmo {#complessitá-di-un-algoritmo}

Risorse utilizzate dall'algoritmo

-   tempo
-   spazio
-   hardware
    -   sempre piú importante con piú core e thread di esecuzione

Noi trattiamo la **complessitá temporale**

-   per stimare la grandezza massima dell'ingresso(input) di un esecuzione ragionevole
-   per confrontare l'efficienza di piú algoritmi
-   _analisi asintotica_

<span class="underline">Il tempo di calcolo</span> é una funzione rispetto all'input
Gli approcci differiscono solo di una costante moltiplicativa (che puó essere quindi ignorata ai fini dell'analisi) sotto certe condizioni:

-   secondi di esecuzioni
-   numero di operazioni elementari
-   numero di volte una specifica operazione viene eseguita
    -   piú semplice

Una volta stabiliti i numeri di esecuzioni si passa all'analisi del caso migliore e del caso peggiore, si riconducono a polinomi

La **dimensione dell'ingresso** é una misura della sua rappresentazione

-   \\(\mid m \mid \log\_2 (m)+1\\)
-   \\(\mid A[0...n-1] \mid nc\\)
    -   \\(c\\) numero bit del generico elemento di \\(A\\)
        -   \\(c = 1\\) perché le <span class="underline">costanti moltiplicative</span> non contano dal punto di vista dell'analisi asintotica

Fissato la dimensione esistano algoritmi per cui \\(T\\) puó cambiare rispetto alla forma dell'input
Distinguiamo i casi: migliore e peggiore

-   \\(T\_{peggiore}(n) \text{max}\\{T()x\\}: \mid x\mid n\\)
-   \\(T\_{migliore}(n) \text{min}\\{T()x\\}: \mid x \mid n\\)

Dobbiamo confrontare tra loro funzioni che hanno infiniti valori

-   si trascura il numero finito di casi, conviene scegliere la funzione che cresce piú lentamente all'infinito
    -   se non ci interessano questi casi, se abbiamo informazioni in piú allora vanno analizzati anche questi casi

Quanto contano le costanti?

-   con un computer molto piú veloce la dimensione massima trattabile cambia in maniera trascurabile
-   la funzione che cresce meno velocemente é comunque piú importante di una costante moltiplicativa per il calcolo della complessitá
-   inoltre la stima delle costanti é molto difficile nella pratica


#### O-grande {#o-grande}

Definito da P. Bachman, 1892.
\\(f(n) \in O(g(n)) \iff \exists c > 0, n\_0 \forall n > n\_0 \mid f(n) \le cg(n)\\)
Un \\(f(n)\\) é O-grande di \\(g(n)\\) se e solo se \\(f(n)\\) cresce al piú come \\(g(n)\\) dopo un numero finito di casi \\(n\_0\\) e eventuali costanti moltiplicative \\(c\\).
Permette di specificare limiti superiori non stretti.

-   \\(O(1)\\)
    -   insieme delle funzioni superiormente limitate
        -   la dimensione dell'input non ha impatto sul lavoro dell'algoritmo

Se \\(p(n)\\) é un polinomio di grado \\(k\\) allora \\(p(k) \in O(n^k)\\)

**Definizione equivalente**
\\(f(n) \in O(g(n)) \iff lim\_{n \to \infty}\frac{f(n)}{g(n)}\\) e
\\(0 \le lim\_{n \to \infty} \frac{f(n)}{g(n)} < \infty\\)

**Teorema Utile**
\\(\lim\_{ n \to \infty}\frac{f(n)}{g(n)} = 0 \iff f(n) \in O(g(n)) \land g(n) \notin O(f(n))\\)

-   **NB**
    -   nei polinomi ció che conta é il termine di grado piú alto: il grado del polinomio
    -   nei logaritmi non conta la base per O-grande
        -   \\(O(\log\_a n) = O(\log\_b n) \text{ con } a,b >1\\)

-   **Inclusioni**
    -   \\(O(1) \subset O(\log n)\\)

    -   \\(O(\log n) \subset O(n)\\)

    -   \\(O(n) \subset O(n \log n)\\)

    -   \\(O(n^p) \subset O(2^n)\\)

    -   \\(O(2^n) \subset O(3^n)\\)

Il tempo di calcolo sufficiente alla risoluzione del problema é il suo confine superiore

-   confine superiore alla complessitá di un problema

Il tempo di calcolo necessario alla risoluzione del problema

-   confine inferiore alla complessitá del problema, per i tempi di calcolo di tutti gli algoritmi che risolvono il problema
-   banali
    -   dimensione del input
    -   dimensione del output
    -   eventi contabili


#### Omega {#omega}

\\(\Omega\\) limite asintotico inferiore
\\(f(n) \in \Omega(g(n)) \iff \exists c > 0, n\_0 \forall n > n\_0 \mid cg(n) \le f(n)\\)
\\(0< lim\_{n \to \infty} \frac{f(n)}{g(n)} \le \infty\\)


#### Teta {#teta}

&Theta; limite asintotico sia inferiore sia superiore
\\(f(n) \in \Theta(g(n)) \iff \exists c\_1 > 0,c\_2 >0, n\_0 \forall n > n\_0 \mid c\_1 g(n) \le f(n) \le c\_2 g(n)\\)
\\(f(n) \in \Theta(g(n)) \iff f(n) \in O(g(n)) \land f(n) \in \Omega (g(n))\\)
\\(0< lim\_{n \to \infty} \frac{f(n)}{g(n)} < \infty\\)


#### o-piccolo {#o-piccolo}

\\(f(n) \in (g(n)) \iff \forall c > 0 \exists n\_0 \forall n > n\_0 \mid f(n) \le cg(n)\\)
\\(f(n)\\) é un infinitesimo di \\(g(n)\\)


#### Somma-17 {#somma-17}

```text
Somma-17(V)
- Pre: V é un vettore che contiene numeri positivi
- Post: True se ci sono due numeri a,b t.c. a+b=17, False altrimenti

boolean b = False
for i=0 to length(V)-1
  for j=i+1 to length(V)-1
    if V[i] + V[j] == 17
      b = True
    end-if
  end-for
end-for
return b
```

\\(O(n^2)\\) per il numero di volte che viene eseguito l'if nel caso peggiore
\\(\Omega(n)\\) per la dimensione dei dati

<span class="underline">Soluzione di complessitá lineare</span>

```text
Somma-17-Lineare(V)

bool C[18]
int i, j
for i=0 to 17
  C[i] = False
end-for
for i=0 to length(V)-1
  if V[i] <= 17
    C[V[i]] = True
end-for
for i=0,j=17; i<j && !(C[i] && C[j]) do
  i++
  j--
end-for
return i < j
```

\\(T\_{Somma-17-Lineare}(n) \in O(18+n+9+1) \in O(n)\\)
Questo implica che l'algoritmo <span class="underline">é ottimo</span> in quanto \\(\Omega(n)\\) é confine inferiore del problema.


#### Minimo {#minimo}

\\(cn + d \le T(n) \le an+b\\)

-   contenuto tra funzioni lineari
    -   al piú lineare


### Relazioni di Ricorrenza {#relazioni-di-ricorrenza}

La funzione tempo di un algoritmo ricorsivo é a sua volta ricorsiva: é detta **Relazione di ricorrenza**

-   Calcolo ricorsivo del fattoriale

\\(T(n) = c \text{ se } n=0\\)
\\(T(n) = T(n-1)+d \text{ altrimenti}\\)

```C
int min_ric(int a[], int i){
  if (i = length(a))
      return a[i];
  else
      return min(a[i], min_ric(a, i+1));
}
```

Nel caso dell'algoritmo della torre di Hanoi ci si riconduce ad una sommatoria di progressione geometrica.
\\(T(n)=c^n b + \frac{c^n - 1}{c - 1}d\\)
\\(T(n) \subset \Theta(c^n)\\)


#### Quick Sort {#quick-sort}

Sceglie un perno e riorganizza il vettore per avere elementi minori di \\(q\\) prima di questo e maggiori dopo.
Ogni passo se necessario va partizionato il vettore.

```C
int partition(int a[],int s, int n){
  int i=s;
  int j = n-1;
  while(i<=j){
    if(a[i] <= a[0])
      i++;
    else if(a[j] > a[1])
      j--;
    else {
      int temp = a[i];
      a[i] = a[j];
      a[j] = temp;
    }
  }
  int temp = a[j];
  a[j] = a[s];
  a[s] = temp;
  return j;
}

void quick_sort(int a[]){
  int n = length(a)-1;
  if(n>0){
    int p = partition(a,0,n);
    if(p>2)
      quick_sort(a,0,n);
    if(p<n-1)
      quick_sort(a,p+1,n);
  }
}
```

Per dimostrarne la correttezza va utilizzata l'induzione completa, non semplice.

-   in quanto la dimensione delle due chiamate ricorsive operano su dimensioni ignote minori di n elementi

Uno volta dimostrata la correttezza di `partizione` la dimostrazione é banale

<!--list-separator-->

-  Complessitá

    Il partizionamento esamina una volta ogni elemento: é lineare
    \\(T\_p(n)=an\\)
    Identifichiamo le situazioni estreme della ricorsione di quicksort

    1.  due partizioni con lo stesso numero degli elementi
    2.  una contiene tutti gli elementi e una é vuota

    3.  da luogo ad una relazione di  ricorrenza
        -   \\(T(n) = c\\) con \\(n=1\\)

        -   \\(T(n)= T(n-1)+T\_p(n)+b\\) altriment


#### Relazioni Lineari a Partizione costante {#relazioni-lineari-a-partizione-costante}

Teorema master per relazioni lineari in termini \\(O()\\), con \\(a\\) che rappresenta il numero di chiamate ricorsive.
h: quanto diminuisce la dimensione del problema
a: numero delle chiamate ricorsive
b e c: quanto tempo impiegano le parti non ricorsive

-   \\(a=1\\): \\(T(n)\subset O(n^{b+1})\\)
-   \\(a\ge 2\\): \\(T(n)\subset O(a^n n^b)\\)

Il risultato dá meno informazioni rispetto alla sostituzione o l'iterazione, che dá informazioni rispetto a \\(\Theta()\\).
Puó anche non fornire il limite piú stretto possibile.


### Divide et Impera - Relazioni lineari a partizione bilanciata {#divide-et-impera-relazioni-lineari-a-partizione-bilanciata}

`Teorema`
\\(T(n) = d \text{ se }n=1\\)
\\(T(n) = aT(n/b)+cn^\beta \text{ se } n=1\\)
allora:
posto \\(\alpha = \log a / \log b\\)
\\(\alpha > \beta\\): \\(T(n) \subset O(n^\alpha)\\)
\\(\alpha = \beta\\): \\(T(n) \subset O(n^\alpha \log n)\\)
\\(\alpha < \beta\\): \\(T(n) \subset O(n^\beta)\\)


#### Minimo e Massimo {#minimo-e-massimo}


#### Merge Sort {#merge-sort}

Fondere array ordinati impiega molto meno tempo

```C
int merge(int b[],int c[]){
  if (b == NULL)
    return c;
  else if(c == NULL)
    return b;
  else if(b[1] <= c[1])
    return {b[1],merge(b[2...length(b)],c)};
  else
    return {c[1],merge(b,c[2...length(b)])};
}

int merge_sort(int a[], int i, int n){
  if(n-i == 1)
    return a;
  else{
    int k = (n-i)/2;
    int b[] = merge_sort(a, 1, k);
    int c[] = merge_sort(a, k+1, n);
    return merge(b,c);
  }
}
```

<!--list-separator-->

-  Complessitá

    \\(T(n)=2T(n/2)+n\\)
    \\(T(n)=\log\_2 n \cdot n \text{ . } cn \in \Theta(n \log n)\\)
    L'algoritmo é ottimo.


#### Quick Sort: caso medio {#quick-sort-caso-medio}

Il caso peggiore é noto (quadratico), il caso migliore sará come il `Merge Sort` \\(O(n \log n)\\)

Si dimostra che é ottimo con \\(O(n \log n)\\)


### Programmazione Dinamica {#programmazione-dinamica}

Si basano come i _Divide et Impera_ sulla scomposizione ricorsiva di un problema in sottoproblemi per poi ricomporli

-   **DI** efficiente se i sottopreblemi sono indipendenti, altrimenti puó fare lo stesso lavoro piú di una volta
-   **DI** puó essere molto inefficiente se i sottoproblemi non sono indipendenti tra loro

Al contrario **PD** puó semplificare molto il problema.

Il problema deve possedere due proprietá

1.  _sottostruttura della soluzione_
    -   la soluzione del sottoproblema e' un sottoinsieme del problema
2.  _sottoproblemi ripetuti_
    -   una soluzione deve essere riutilizzabile in un altro sottoproblema
    -   annotazione dei risultati piu' semplici
        -   [Memoization]({{< relref "20210402203855-memoization.md" >}})
    -   per efficienza di memoria si sviluppa un approccio [Bottom-up]({{< relref "20210402203940-bottom_up.md" >}})

Prima si sviluppa una soluzione iterativa, poi la si migliora con le tecniche della **PD**


#### Successione di Fibonacci {#successione-di-fibonacci}

\\(f\_0 = 0 \text{, } f\_1=1\\)
\\(f\_n = f\_{n-2} + f\_{n-1}  \text{ per } n>1\\)

```text
Fib(n)
if n <= 2 then
  f = 1
else
  f = Fib(n-1) + Fib(n-2)
endif
return f
```

La _relazione di ricorrenza_ del numero di nodi \\(N\_n\\) nell'albero delle chiamate é simile a quella della sequenza di Fibonacci \\(f\_n\\). Cambia per un +1.
La <span class="underline">formula di Binet</span> permette il calcolo del ennesimo Fibonacci.
\\(N\_n \subset \Omega(\phi^n)\\)
Quindi ha crescita esponenziale, almeno.

Molto lento  perché é richiesto il <span class="underline">calcolo della stessa cosa ripetutamente</span>

-   perció implementiamo la _memoization_: approccio [Top-down]({{< relref "20210402210717-top_down.md" >}})
    -   lo spazio utilizzato per migliorare l'algoritmo cosí é \\(\Theta(n)\\)

L'albero ha uno sviluppa lineare verso sinistra, anche il tempo sará \\(\Theta(n)\\)

```text
Fib-BottomUp(n)
if n <= 2 then
  return 1
else
  Fib[1] = 1, Fib[2] = 1
  for i=3 to n do
    Fib[i] = Fib[i-1]+Fib[i-2]
  end-for
endif
return Fib[n]
```

Tempo e spazio sono \\(\Theta(n)\\)

L'array puó essere eliminato, servono solo gli ultimi due numeri

```text
Fib-Iter(n)
if n <= 2 then
  return 1
else
  FibA = 1, FibB = 1
  for i=3 to n do
    tmp = FibA+FibB
    FibB = FibA
    FibA = tmp
  end-for
endif
return FibA
```

Il tempo di calcolo é sempre \\(\Theta(n)\\)
ma lo spazio  ora é \\(\Theta(1)\\)


#### Massima Sottosequenza Comune - LCS {#massima-sottosequenza-comune-lcs}

`Longest Common Subsequence`
es: Trattando Stringhe di DNA
Non si intendono elementi necessariamente successivi

-   CS = sotto-sequenza / common-subsequence

Z é LCS se

-   `Z cs X && Z cs Y && Z ha lunghezza massima`

**Proprietá della sottostruttura**

-   mettere in relazione \\(LCS(X,Y)\\) con la soluzioni che coinvolgono prefissi di \\(X\\) e \\(Y\\)
-   definiamo \\(k,m,n\\) come lunghezze di \\(Z,X.Y\\)
-   due casi
    -   \\(x\_m = y\_n\\)
        -   se \\(Z\\) é \\(LCS(X,Y)\\) allora \\(z\_k\\) sará \\(x\_m\\)
            -   allora \\(Z\_{k-1}\\) é \\(LCS(X\_{m-1},Y\_{n-1})\\)
    -   \\(x\_m \neq y\_n\\)
        -   se \\(Z\\) é \\(LCS(X,Y)\\) allora \\(z\_k\\) puó essere \\(x\_m\\) o \\(y\_n\\) o qualsiasi altro
            -   sicuramente \\(x\_m\\) o \\(y\_n\\) non serve per formare \\(Z\\), anche entrambi
            -   allora \\(Z\_{k-1}\\) é \\(LCS(X\_{m-1},Y\_{n})\\) o \\(LCS(X\_{m},Y\_{n-1})\\) o entrambi

`Teorema`

-   se \\(i=0 || j=0\\)
    -   &lt; &gt;
-   se \\(x\_i = y\_j\\)
    -   \\(LCS(X\_{i-1}, Y\_{j-1}) + x\_i\\) dove \\(+\\) indica la concatenazione
-   se \\(x\_i \neq y\_j\\)
    -   longest(\\(LCS(X\_{i-1},Y)\\), \\(LCS(X,Y\_{j-1})\\))

Il Tempo di calcolo di questa procedura ricorsiva é esponenziale:
\\(T(k)=2T(k-1)+1 \in \Theta(2^k) =  \Theta(2^{m+n})\\)

Si costruiscono due tabelle basate sullo schema ricorsivo
\\(c[0..m, 0..n]\\) e \\(b[1..m, 1..n]\\)

<!--list-separator-->

-  Algoritmo Bottom-up

    permette di ottimizzare riempiendo una tabella \\(m \cdot n\\)
    \\(T(k) \in \Theta(m \cdot n)\\)
