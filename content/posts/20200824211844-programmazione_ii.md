+++
title = "Programmazione II"
author = ["Daniel Biasiotto"]
draft = false
+++

Prof: `Cattuto`
:Computer_Science:


## Generici Vincolati {#generici-vincolati}


### Classe Tree di generici T vincolati a Comparable&lt;T&gt; {#classe-tree-di-generici-t-vincolati-a-comparable-t}


## Errori e Eccezioni --&gt; Throwable {#errori-e-eccezioni-throwable}


### Error {#error}


#### eccezioni non rimediabili {#eccezioni-non-rimediabili}

-   scelta del programmatore


### Exception ~ se estesa: controllata {#exception-se-estesa-controllata}

-   Condizioni di errore che pensiamo di poter gestire


#### Checked {#checked}

-   Eccezioni controllate
    -   origine esterna
    -   va previsto un rimedio
-   Sono cosi' comuni che il compilatore pretende che il programmatore gestisca l'eccezione
    -   o avverta con la parola chiave `throws`


##### IOException {#ioexception}


###### FileNotFoundException {#filenotfoundexception}


###### EOFException {#eofexception}

-   End Of File


#### Unchecked {#unchecked}

-   Eccezioni non controllate
    -   origine interna
    -   possiomo prevedere un rimedio oppure no


##### RuntimeException {#runtimeexception}


###### NullPointerException {#nullpointerexception}


###### ArithmeticException {#arithmeticexception}

-   / 0


###### IllegalArgumentException {#illegalargumentexception}

<!--list-separator-->

-  NumberFormatException

    <a id="code-snippet--Esempio"></a>
    ```java
    Integer.parseInt("ciro");
    ```


### Uso {#uso}

<a id="code-snippet--Uso di try e catch"></a>
```java
public class TestError{
    public static void m1(){
        throw new Error("mio errore");
    }

    // Esempio eccezione controllata, devo usare throws per compilare
    public static void m2() throws IOException {
        throw new IOException("IO Exception");
    }

    // Esempio di eccezione non controllata, il compilatore non controlla
    public static void m3(){
        throw new RuntimeException("runtime");
    }

    public static void main(String[] args){

        try{
            m1();
            m2();
            m3();
        } catch(Throwable e) { // Upcast alla classe Throwable
            System.out.println("Captured: " + e);
        }

    }
}
```


## Iterable su Intervalli {#iterable-su-intervalli}


### iterazione su una lista collegata di interi {#iterazione-su-una-lista-collegata-di-interi}


### da un nodo `first` a un altro `last` {#da-un-nodo-first-a-un-altro-last}

**\***


## Alberi Binari di Ricerca Binaria {#alberi-binari-di-ricerca-binaria}

-   Estensione delle classi per permettere vari tipologie di visite
    -   preOrder()
    -   inOrder()
    -   postOrder()
    -   livello(int n)
    -   livello()
    -   leavesAt(int n)


### abstract Tree {#abstract-tree}


#### Leaf {#leaf}


#### Branch {#branch}