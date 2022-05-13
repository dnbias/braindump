+++
title = "Quantum e Algoritmi in Q#"
author = ["Daniel Biasiotto"]
date = 2022-05-12T19:31:00+02:00
tags = ["university", "thesis", "compsci"]
draft = false
+++

-   Tags: [Quantum Computing]({{< relref "quantum_computing.md" >}}), [CalcCompl]({{< relref "20210921121153-calcolabilita_e_complessita.md" >}}), [Deutsch-Jozsa Algorithm]({{< relref "deutsch_jozsa_algorithm.md" >}})
-   Source: [Learn Quantum Computing with Python and Q#]({{< relref "learn_quantum_computing_with_python_and_q.md" >}})


## Ambiente {#ambiente}

L'ambiente di esecuzione `Q#` puó essere configurato sul editor `Visual Studio Code` tramite l'add-on proprietario di Microsoft.

Oppure é possibile sviluppare codice `Q#` ed eseguirlo tramite `Jupyter Notebook` tramite `Python`.

```bash
$ conda create -n qsharp-env -c microsoft qsharp notebook
$ conda activate qsharp-env
```


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

{{< figure src="/ox-hugo/deutsch_steps.png" caption="<span class=\"figure-number\">Figure 1: </span>i passi dell'algoritmo in forma di circuito" >}}


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


## Oracoli {#oracoli}

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

[^fn:1]: dove \\(\oplus\\) é l'addizione modulo \\(2\\)