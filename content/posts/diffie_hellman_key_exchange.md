+++
title = "Diffie-Hellman Key Exchange"
author = ["Daniel Biasiotto"]
date = 2022-03-23T14:42:00+01:00
tags = ["security"]
draft = false
+++

-   1976
-   One of first public key protocols in Cryptography
-   specifics at [ibm.com](https://www.ibm.com/docs/en/zvse/6.2?topic=SSB27H_6.2.0/fa2ti_openssl_diffie_hellman.html)

Its main use is the exchange of symmetric keys over a non-secure channel.
It functions using module arithmetics.

-   \\(q\\) prime
-   \\(\alpha\\) primitive root of \\(q\\)

> Let \\(n\\) be a positive integer. A **primitive root** \\(\mod n\\) is an integer \\(g\\) such that every integer relatively prime to \\(n\\) is congruent to a power of \\(g \mod n\\). That is, the integer \\(g\\) is a primitive root (\\(\mod n\\) ) if for every number \\(a\\) relatively prime to \\(n\\) there is an integer \\(z\\) such that \\(a \equiv (g^z \mod{n})\\)


## Algorithm {#algorithm}

To realize `DH` we need:

1.  efficient algorithm for \\(a^{b}\mod q\\)
2.  efficient algorithm for generating a prime \\(q\\)
3.  efficient algorithm for generating a primitive root for this \\(q\\)

**1.**

```c
int expmod_r (int a, int b, int q) {
    if (b == 0) return 1;
    if (b%2 == 0)
        return ((expmod_r(a,b/2,q))^2) % q;
    else
        return (a*expmod_r(a,b-1,q)) % q;
}

int expmod_i (int a, int[] b, int q) { // here b is encoded in binary
    int c = 0, d = 1;
    for (i = b.length-1; i >= 0; i--) {
        c = c*2; // c is used to prove correctness
        d = (d*d)%q;
        if (b[i] == 1) {
            c++;
            d = (d*a)%q;
        }
    }
    return d;
}
```

**2.**
Probabilistic approach is best: **Miller Rabin primality test**

```c
int generate_prime(int k) { // k rounds of testing to perform
    bool probablyPrime = false;
    while (!probablyPrime) {
        int n = getRandomInt();
        probablyPrime = miller_rabin(n,k);
    }
    return n;
}
```

For full algorithm in `C` see [here](https://www.sanfoundry.com/c-program-implement-rabin-miller-primality-test-check-number-prime/).

**3.**


### Complexity {#complexity}

For \\(a^{b} \mod q\\), with \\(n\\) as the bit-length of \\(b\\)

-   recursive algorithm: \\(O(2 \log\_{2}(b)) = O(2\log\_{2} (2^{n})) = O(2n)=O(n)\\)
-   iterative algorithm: \\(O(n)\\)

**Miller Rabin**

-   \\(O(k \log^{3} n)\\)
    -   polynomial


## Security {#security}

By  the rules of modular arithmetics:

\begin{align\*}
K &= (Y\_{B} )^{X\_{A}}\_{}  \text{mod } q \\\\
&= ( \alpha^{X\_{B}} \text{mod } q)^{X\_{A}} \text{mod } q \\\\
&= ( \alpha^{X\_{B}} )^{X\_{A}} \text{mod } q \\\\
&=  \alpha^{X\_{B} X\_{A}} \text{mod } q \\\\
&= ( \alpha^{X\_{A}} )^{X\_{B}} \text{mod } q \\\\
&= ( \alpha^{X\_{A}} \text{mod } q)^{X\_{B}} \text{mod } q \\\\
K &= (Y\_{A} )^{X\_{B}}\_{}  \text{mod } q \\\\
\end{align\*}

This way the two sides exchanged the secret value using the private keys \\(X\_{A}, X\_{B}\\).
The only way the adversary can solve this knowing:

-   \\(q\\)
-   \\(\alpha\\)
-   \\(Y\_{A}\\)
-   \\(Y\_{B}\\)

\begin{align\*}
X\_{B} &= \text{dlog}\_{\alpha,q}(Y\_{B}) \\\\
K &= (Y\_{A})^{X\_{B}} \text{mod }q
\end{align\*}

But for larger primes discrete logarithms are considered infeasible.