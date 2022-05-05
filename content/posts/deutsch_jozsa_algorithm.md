+++
title = "Deutsch-Jozsa Algorithm"
author = ["Daniel Biasiotto"]
date = 2022-04-02T09:28:00+02:00
tags = ["algorithms", "compsci"]
draft = false
+++

-   Tags: [Quantum Computing]({{< relref "quantum_computing.md" >}}), [CalcCompl]({{< relref "20210921121153-calcolabilita_e_complessita.md" >}})
-   Source: [qiskit](https://qiskit.org/textbook/ch-algorithms/deutsch-jozsa.html), [Learn Quantum Computing with Python and Q#]({{< relref "learn_quantum_computing_with_python_and_q.md" >}}) [Ap.D]

The first example of a quantum algorithm performing better than the best classical algorithm.

The algorithm can be applied to an oracle \\(U\_{f}\\) where \\(f\\) is either _constant_ or _balanced_ and decide in \\(O(1)\\) whether it's one or the other, in a single application.


## Algorithm {#algorithm}

1.  prepare two qubits, `control` and `target`, in the \\(| 0 \rangle \otimes |0\rangle\\) state
2.  prepare the state \\(| +  - \rangle\\)[^fn:1]
3.  apply the `oracle` \\(U\_{f}\\) to input state \\(| +- \rangle\\)
4.  measure `control` in the \\(X\text{-basis}\\)
    -   if 0 then \\(f\\) is constant, otherwise \\(f\\) is balanced

[^fn:1]: shortand for \\(| + \rangle \otimes | - \rangle\\)