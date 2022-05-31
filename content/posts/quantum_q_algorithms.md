+++
title = "Quantum e Algoritmi in Q#"
author = ["Daniel Biasiotto"]
date = 2022-05-12T19:31:00+02:00
tags = ["university", "thesis", "compsci"]
draft = false
+++

-   Tags: [Quantum Computing]({{< relref "quantum_computing.md" >}}), [CalcCompl]({{< relref "20210921121153-calcolabilita_e_complessita.md" >}}), [Deutsch-Jozsa Algorithm]({{< relref "deutsch_jozsa_algorithm.md" >}})
-   Sources: [Learn Quantum Computing with Python and Q#]({{< relref "learn_quantum_computing_with_python_and_q.md" >}}), [Medium: Quantum Basics](https://medium.com/a-bit-of-qubit/deutsch-jozsa-algorithm-quantum-computing-basics-708df8c4caf7), [Qiskit textbook](https://qiskit.org/textbook/ch-algorithms/deutsch-jozsa.html)


## Introduzione {#introduzione}

Lo sviluppo di software quantistici si é confermato come un'area di grande interesse negli ultimi decenni, offrendo grandi possibilitá di superare i limiti computazionali attualmente compresi in diverse aree di ricerca.
Per esempio é possibile che in futuro algoritmi quantistici possano sostituire controparti classiche in diverse applicazioni:

-   crittografia
-   problemi di ricerca
-   simulazione di sistemi quantistici
-   machine learning
-   computazione biologica
-   chimica generativa

Ovviamente il calcolo classico non verrá abbandonato, l'approccio classico e quello quantistico differiscono nelle loro forze e debolezze.
Mentre gli attuali computer diventano sempre piú veloci e le tecniche industriali permettono miniaturizzazioni sempre maggiori gli hardware quantistici rimangono estremamenti complicati da costruire e distribuire.
Il modo attualmente piú congeniale di utilizzare questi hardware rimane quello della condivisione di risorse attraverso le tecnologie di _cloud computing_.

Ma questo non significa che non sia possibile studiare i problemi e le soluzioni algoritmiche che il calcolo quantistico offre a livello teorico e di sviluppo software.
Attualmente i software sviluppati per hardware quantistici possono essere eseguiti su simulatori, sempre software, oppure sfruttando reali macchine quantistiche in in remoto.
I simulatori e le macchine reali condividono interfacce condivise che permettono lo sviluppo di software che abbia la possibilitá di essere testato in maniera indiscriminata su un qualsiasi di questi.


## Ambiente {#ambiente}

Per lo sviluppo di software quantistici sono disponibili diversi ambienti e framework, tra i piú conosciuti troviamo **Microsoft Azure** con il proprio Quantum Development Kit (`QDK`) o l'ambiente di sviluppo di `IBM` **Qiskit**.
Altri _Software Development Kit_ che possono essere utilizzati per eseguire circuiti quantistici su prototipi di device quantistici o simulatori sono:

-   Ocean
-   ProjectQ
-   Forest
-   t|ket&gt;
-   Strawberry Fields
-   PennyLane

Molti di questi progetti sono open-source e sviluppati sulla base di `Python`.

Per questo lavoro abbiamo utilizzato gli strumenti offerti da Microsoft  per l'ottima documentazione consultabile sulle loro pagine web e in quanto era ció che era utilizzato dalla nostra fonte principale _Learn Quantum Computing with Python and Q#_.

L'ambiente di esecuzione `Q#` puó essere configurato sul editor `Visual Studio Code` tramite l'add-on proprietario di Microsoft.
Quest'ultimo é disponibile solo sulla versione non `FOSS` del software, che é possibile installare tramite le repository opensource linux.

In alternativa o anche parallelamente é possibile sviluppare codice `Q#` ed eseguirlo tramite `Jupyter Notebook` tramite `Python`. Questo con i kernel necessari installati, quindi l'ultima versione di `dotnet` disponibile.

Tramite `anaconda` si crea un ambiente con il necessario:

```bash
$ conda create -n qsharp-env -c microsoft qsharp notebook
$ conda activate qsharp-env
```

L'esecuzione del software `Q#` puo' essere testato localmente predisponendo un ambiente di simulazione tramite il pacchetto `Python` chiamato `qsharp`.

<a id="code-snippet--host.py"></a>
```python
import qsharp
from QsharpNamespace import Operation_One, Operation_Two
var1 = 10
print("Simulation started...")
Operation_One.simulate(par1=var1)
Operation_Two.simulate(par2=var1,par3=5)
```

Ad esempio come nel listato qui sopra utiliziamo uno script `host.py` per creare un ambiente di simulazione per poter eseguire le operazioni `Q#` definite in `Operation_One` e `Operation_Two`.
Il pacchetto automaticamente va a cercare nella directory locale le definizioni.


## Oracoli {#oracoli}

Gli oracoli che utiliziamo per testare gli algoritmi definiti in seguito sono:

<a id="code-snippet--oracles.qs"></a>
```Q#
operation ApplyZeroOracle(control : Qubit, target : Qubit) : Unit {
  }

  operation ApplyOneOracle(control : Qubit, target : Qubit) : Unit {
    X(target);
  }

  operation ApplyZeroOracleN(control : Qubit[], target : Qubit) : Unit {
  }

  operation ApplyOneOracleN(control : Qubit[], target : Qubit) : Unit {
    X(target);
  }

  operation ApplyIdOracle(control : Qubit, target : Qubit) : Unit {
    CNOT(control,target);
  }

  operation ApplyXOROracleN(control : Qubit[], target : Qubit) : Unit {
    for qubit in control {
        CNOT(qubit,target);
    }
  }

  operation ApplyNotOracle(control : Qubit, target : Qubit) : Unit {
    X(control);
    CNOT(control,target);
    X(control);
  }
```

Dove sono definiti versioni a singolo qbit e a n-qbit degli oracoli quantistici di alcune funzioni booleane costanti e bilanciate.
In particolare abbiamo definito oracoli per le seguenti funzioni:

-   \\(f(x)=0\\)
-   \\(f(x)=1\\)
-   \\(f(x)=x\\)
-   \\(f(x)= \lnot x\\) o \\(f(x) = 1-x\\)
-   \\(f(x, y) = x \oplus y\\)
    -   dove \\(x\\) e' l'input lungo \\(n\\) qbit e \\(y\\) e' l'output

{{< figure src="/ox-hugo/balanced-oracle.png" caption="<span class=\"figure-number\">Figure 1: </span>esempio di oracolo bilanciato utilizzando porte CNOT" >}}

In questi casi le prime due funzioni sono costanti e le restanti sono bilanciate.


## Algoritmo di Deutsch-Jozsa {#algoritmo-di-deutsch-jozsa}

L'algoritmo di Deutsch-Jozsa ha interesse storico in quanto primo algoritmo quantico in grado di superare in performance il miglior algoritmo classico corrispondente, mostrando che possono esistere vantaggi nel calcolo quantico. Spingendo la ricerca in questa direzione per determinati problemi.

L'algoritmo tratta la decisione di una funzione \\(f\\) booleana con \\(n\\) bit in input
\\[f(\\{x\_{0},x\_{1},\cdots,x\_{n}\\}) \rightarrow 0\text{ o }1\\]

Questa funzione su cui agisce l'algoritmo ha la proprietá di essere una di due forme:

-   costante
-   bilanciata

E quindi restituisca per tutti gli input \\(\\{x\_{0},x\_{1},\cdots,x\_{n}\\}\_{}\\) lo stesso risultato se costante oppure restituisca _esattamente_ \\(0\\) per metá degli input e \\(1\\) per metá degli input.


### La Soluzione Classica {#la-soluzione-classica}

Nella soluzione classica nel **caso migliore** due _query_ all'oracolo sono sufficienti per riconoscere la funzione \\(f\\) come bilanciata.
Per esempio si hanno due chiamate:
\\[f(0,0,\cdots) \rightarrow 0\\]
\\[f(1,0,\cdots) \rightarrow 1\\]

Dato che é assunto che \\(f\\) é _garantita_ essere costante oppure bilanciata questi risultati ci dimostrano \\(f\\) come bilanciata.

Per quanto riguarda il caso peggiore tutte le nostre interrogazioni daranno lo stesso output, decidere in modo certo che \\(f\\) sia costante necessita di metá piú uno interrogazioni.
In quanto il numero di input possibili é \\(2^{n}\\) questo significa che saranno necessarie \\(2^{n-1}+1\\) interrogazioni per essere certi che \\(f(x)\\) sia costante nel caso peggiore.


### La Soluzione Quantica {#la-soluzione-quantica}

Tramite la computazione quantica é possibile risolvere questo problema con un'unica chiamata della funzione \\(f(x)\\).
Questo a patto che la funzione \\(f\\) sia implementata come un oracolo quantico, che mappi:
\\(|x\rangle | y \rangle\\) a \\(| x \rangle |y \oplus f(x) \rangle\\)&nbsp;[^fn:1]

I passi dell'algoritmo in particolare sono:

1.  prepara 2 registri di `qubit`, il primo di \\(n\\) `qubit` inizializzato a \\(| 0 \rangle\\) e il secondo di un singolo `qubit` inizializzato a \\(| 1\rangle\\)
2.  applica `Hadamard` a entrambi i registri
3.  applica l'oracolo quantico
4.  a questo punto il secondo registro puó essere ignorato, riapplica `Hadamard` al primo registro
5.  misura il primo registro, questa risulta \\(1\\) per \\(f(x)\\) costante e \\(0\\) altrimenti nel caso bilanciato

{{< figure src="/ox-hugo/deutsch_steps.png" caption="<span class=\"figure-number\">Figure 2: </span>i passi dell'algoritmo in forma di circuito" >}}


#### single-bit Deutsch-Jozsa {#single-bit-deutsch-jozsa}

```Q#
operation DeutschJozsaSingleBit(oracle : (( Qubit, Qubit ) => Unit)) : Bool {
    use control = Qubit();
    use target = Qubit();

    H(control);
    X(target);
    H(target);

    oracle(control, target);

    H(target);
    X(target);

    return MResetX(control) == One;
}
```


#### n-bit Deutsch-Jozsa {#n-bit-deutsch-jozsa}

```Q#
operation DeutschJozsa(size : Int, oracle : ((Qubit[], Qubit ) => Unit) ) : Bool {
    use control = Qubit[size];
    use target = Qubit();

    ApplyToEachA(H, control);
    X(target);
    H(target);

    oracle(control, target);

    H(target);
    X(target);

    let result = MResetX(control[0]) == One;
    ResetAll(control);
    return result;
}
function _And(a : Bool, b : Result) : Bool {
      return a and ResultAsBool(b);
}
```

[^fn:1]: dove \\(\oplus\\) é l'addizione modulo \\(2\\) o `XOR`