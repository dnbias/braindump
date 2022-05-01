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
2.  calculate module \\(n = pq\\)
3.  choose $e &lt; (p-1)(q-1) such that \\(\text{gcd}(e,(p-1)(q-1))=1\\)
4.  calculate \\(d=e^{-1} \mod (p-1) (q-1)\\)
5.  \\(K^{+} = <e,n>\\)  ---  \\(K^{-} = <d,n>\\)

This algorithm is **Generalized Euclid's Algorithm**


## Usage {#usage}

Cypher: \\(c = m^{e} \mod n\\)
Decypher: \\(m = c^{d} \mod n\\)


## Security {#security}

-   **hard** - decypher without knowing \\(d\\)
-   **hard** - calculating \\(d\\) knowing \\(e, n\\) without knowing \\(p,q\\)
-   **hard** - calculating \\(p,q\\) knowing \\(n\\), with \\(n\\) sufficiently big (at least 1024 bits)