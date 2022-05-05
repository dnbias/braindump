+++
title = "Learn Quantum Computing with Python and Q#"
author = ["Daniel Biasiotto"]
date = 2022-03-29T18:05:00+02:00
tags = ["book"]
draft = false
+++

Sarah Kaiser, Christopher Granade, _Learn Quantum Computing with Python and Q#_, 2021, Manning

-   Tags: [Quantum Computing]({{< relref "quantum_computing.md" >}}), [Q#]({{< relref "q.md" >}})
-   Code: <https://github.com/crazy4pi314/learn-qc-with-python-and-qsharp>


## Concepts {#concepts}


### Qubits {#qubits}

Quantum analogue to the classical _bits_


#### Quantum Random Number Generation {#quantum-random-number-generation}

`QRNG`

Randomness is important, expecially where security is concerned.
We need `RNG` that our adversary can't predict.
While `RSA` relies on _just_ the assumption that factoring large numbers is hard the randomness of quantum mechanics is guaranteed by physics.
Generating truly random numbers allows the implementation of a secure [One-time Pad]({{< relref "one_time_pad.md" >}}).

The algorithm:

1.  allocate a `qubit`
2.  apply the `Hadamard` instruction to the `qubit`
3.  measure the `qubit`


### Quantum Key Distribution {#quantum-key-distribution}


### Nonlocal Games {#nonlocal-games}


### Teleportation &amp; Entanglement {#teleportation-and-entanglement}


## Programming {#programming}


### Setting Up the Environment {#setting-up-the-environment}

-   <https://docs.microsoft.com/en-us/azure/quantum/install-overview-qdk>

The authors use Anaconda w/ [Python]({{< relref "20210328164122-python.md" >}}) 3 and the Conda package manager for the qsharp packages.

On Arch the `anaconda` package on the `AUR` installs everything but you need to add it to `PATH`:

```bash
PATH=/opt/anaconda/bin:$PATH
```

Then you set the environment via `environment.yml` in the book's repo.

```bash
$ conda env create environment.yml
$ conda activate qsharp-book
```

-   for this `conda` needs to be set up on the console (`bash`, `zsh`, ...)

After this the last thing to setup is `dotnet`, download the appropriate `Core SDK`.
Install project templates:

```bash
$ dotnet new -i "Microsoft.Quantum.ProjectTemplates"
```

and to use them:

```bash
$ dotnet new console -lang Q# -O MyProject
```

Then to have language hinting on `VS Code` you need to install the extension `Microsoft Quantum Development Kit`

-   not available on the FOSS version of `VS Code` on the `AUR`

For Jupyter Notebooks you can install `IQ#`

```bash
$ dotnet tool install -g Microsoft.Quantum.IQSharp
$ dotnet iqsharp install
```

If there are problems with `iqsharp` install the correct runtime, `aspnet-runtime` on the `AUR`.


### Q# {#q}


### [Deutsch-Jozsa Algorithm]({{< relref "deutsch_jozsa_algorithm.md" >}}) {#deutsch-jozsa-algorithm--deutsch-jozsa-algorithm-dot-md}

To use the algorithm on function \\(f\\) to decide whether it is balanced or constant we need to define an _oracle_ for that function.

-   this is because functions can be _unreversible_
    -   `id`, reversible
    -   `not`, reversible
    -   `zero`, unreversible
    -   `one`, unreversible
    -   constant functions are unreversible as they lose track of which input resulted in the output

> Oracles are unitary matrixes defined by applying \\(f\\) conditionally to the labels for qubits states, applying an oracle twice results in the identity \\(I\\)

To make a `classical reversible function` \\(h\\) from the unreversible \\(f\\):
\\[h(x,y) = (x,y \oplus f(x))\\]

In the same way we can make a `reversible quantum operation` or `oracle`:
\\[U\_{f} |x \rangle | y \rangle = | x \rangle | y \oplus f(x) \rangle\\]

-   \\(x\\) is the `control qubit`
-   \\(y\\) is the `target qubit`

The algorithm works by using a quantum programming technique colled _phase kickback_.

-   the fact that the input qubit's state changes base on transformations defined in the output qubit

    The algorithm can be extended to \\(n\\) qubits with functions of form

    \begin{centre}f(x\_{0}, x\_{1},\cdots,x\_{n})\end{centre}

    and n-qubits oracles:

    \begin{centre}U\_{f}|x\_{0} x\_{1}\cdots x\_{n}y\rangle = | x\_{0} x\_{1}\cdots x\_{n}\rangle \otimes | f(x\_{0}, x\_{1},\cdots,x\_{n}) \oplus y\rangle\end{centre}


### Quantum Sensing {#quantum-sensing}


## Applied Quantum Computing {#applied-quantum-computing}


### Chemistry {#chemistry}


### Searching {#searching}


#### Grover's Search Algorithm {#grover-s-search-algorithm}


### Arithmetic {#arithmetic}


#### Shor's Algorithm {#shor-s-algorithm}