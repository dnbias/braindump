+++
title = "RSA"
author = ["Daniel Biasiotto"]
date = 2022-04-15T00:13:00+02:00
tags = ["algorithm", "security"]
draft = false
+++

## Algorithm {#algorithm}

1.  choose \\(p\\) and \\(q\\) primes
    -   `Miller-Rabin`
2.  calculate modulo \\(n = pq\\)
3.  choose \\(e < (p-1)(q-1)\\) such that \\(\text{gcd}(e,(p-1)(q-1))=1\\)
4.  calculate \\(d=e^{-1} \mod (p-1) (q-1)\\)[^fn:1]
    -   private key
5.  \\(K^{+} = <e,n>\\)  ---  \\(K^{-} = <d,n>\\)


## Usage {#usage}

-   Cypher: \\(c = m^{e} \mod n\\)
-   Decypher: \\(m = c^{d} \mod n\\)

\\(\textsc{Proof}\\)   using **Euler's Theorem**[^fn:2], modulo used is \\(n\\):

\begin{align\*}
m^{\phi(n)} &\equiv 1 \\\\
(m^{\phi(n)} )^{k}&\equiv 1^{k} \\\\
\forall k:m^{\phi(n)k}  \cdot m&\equiv 1 \cdot m \\\\
m^{\phi(n)k +1} &\equiv m \\\\
m^{(p-1)(q-1)k +1} &\equiv m
\end{align\*}

while, with \\(ed\\) the _multiplicative inverse_ of the private key :

\begin{align\*}
ed  &\equiv 1 \mod (p-1)(q-1) \\\\
\exists k': ed &= k' (p-1)(q-1) + 1
\end{align\*}

we can conclude

\begin{align\*}
m^{ed} \mod n =  m^{k'(p-1)(q-1) +1} = m  hspace{6em} \blacksquare
\end{align\*}

Example with _Bob_ and _Alice_:

-   modulus \\(p\\) and base \\(g\\) are agreed publicly
-   \\(a\\) private Alice key
-   \\(A\\) public Alice key
    -   \\(A= g^{a} \mod p\\)
-   \\(b\\) private Bob key
-   \\(B\\) public Bob key
    -   \\(A= g^{b} \mod p\\)


## Security {#security}

-   **hard** - decypher without knowing \\(d\\)
-   **hard** - calculating \\(d\\) knowing \\(e, n\\) without knowing \\(p,q\\)
-   **hard** - calculating \\(p,q\\) knowing \\(n\\), with \\(n\\) sufficiently big (at least 1024 bits)

[^fn:1]: The algorithm used is **Generalized Euclid's Algorithm**,
[^fn:2]: for \\(p,q\\) primes: \\(\phi(n) = \phi(p\cdot q) = (p-1)\cdot(q-1)\\)