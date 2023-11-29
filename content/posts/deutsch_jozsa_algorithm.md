+++
title = "Deutsch-Jozsa Algorithm"
date = 2022-04-02T09:28:00+02:00
tags = ["algorithms", "compsci"]
draft = false
+++

-   Tags: [Quantum Computing]({{< relref "quantum_computing.md" >}}), [CalcCompl]({{< relref "20210921121153-calcolabilita_e_complessita.md" >}})
-   Source: [qiskit](https://qiskit.org/textbook/ch-algorithms/deutsch-jozsa.html), [Learn Quantum Computing with Python and Q#]({{< relref "learn_quantum_computing_with_python_and_q.md" >}}) [Ap.D]
-   see [Jupiter Notebook Extract](/ox-hugo/deutsch-jozsa-notebook.pdf)

The first example of a quantum algorithm performing better than the best classical algorithm.

The algorithm can be applied to an oracle \\(U\_{f}\\) where \\(f\\) is either _constant_ or _balanced_ and decide in \\(O(1)\\) whether it's one or the other, in a single application.


## Algorithm {#algorithm}

1.  prepare two qubits, `control` and `target`, in the \\(| 0 \rangle \otimes |0\rangle\\) state
2.  prepare the state \\(| +  - \rangle\\)[^fn:1]
3.  apply the `oracle` \\(U\_{f}\\) to input state \\(| +- \rangle\\)
4.  measure `control` in the \\(X\text{-basis}\\)
    -   if 0 then \\(f\\) is constant, otherwise \\(f\\) is balanced

The algorithm can be extended to \\(n\\) qubits with functions of form
\\[f(x\_{0}, x\_{1},\cdots,x\_{n})\\]
and n-qubits oracles
\\[U\_{f}|x\_{0} x\_{1}\cdots x\_{n}y\rangle = | x\_{0} x\_{1}\cdots x\_{n}\rangle \otimes | f(x\_{0}, x\_{1},\cdots,x\_{n}) \oplus y\rangle\\]

{{< figure src="/ox-hugo/deutsch_steps.png" caption="<span class=\"figure-number\">Figure 1: </span>Circuit for Deutsch-Jozsa" >}}


## Code {#code}


### Algorithm {#algorithm}

```Q#
namespace DeutschJozsa {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    operation CheckIfOracleIsBalanced(oracle : ((Qubit, Qubit) => Unit))
    : Bool {
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

    operation RunDeutschJozsaAlgorithm() : Unit {
        Fact(not CheckIfOracleIsBalanced(ApplyZeroOracle),
            "Test failed for zero oracle.");
        Fact(not CheckIfOracleIsBalanced(ApplyOneOracle),
            "Test failed for one oracle.");
        Fact(CheckIfOracleIsBalanced(ApplyIdOracle),
            "Test failed for id oracle.");
        Fact(CheckIfOracleIsBalanced(ApplyNotOracle),
            "Test failed for not oracle.");

        Message("All tests passed!");
    }
}
```


### Oracles {#oracles}

```Q#
namespace DeutschJozsa {
    open Microsoft.Quantum.Intrinsic;

    operation ApplyZeroOracle(control : Qubit, target : Qubit) : Unit {
    }

    operation ApplyOneOracle(control : Qubit, target : Qubit) : Unit {
        X(target);
    }

    operation ApplyIdOracle(control : Qubit, target : Qubit) : Unit {
        CNOT(control, target);
    }

    operation ApplyNotOracle(control : Qubit, target : Qubit) : Unit {
        X(control);
        CNOT(control, target);
        X(control);
    }
}
```

[^fn:1]: shortand for \\(| + \rangle \otimes | - \rangle\\)
