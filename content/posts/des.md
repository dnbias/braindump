+++
title = "Data Encryption Standard"
author = ["Daniel Biasiotto"]
date = 2022-03-09T17:27:00+01:00
draft = false
+++

Cifrario simmetrico moderno,

-   pubblicato nel 1977 dal _National Bureau of Standards_
-   piú diffuso fino al 2002
    -   sostituito da [AES]({{< relref "aes.md" >}})
-   basato su [Diffusione e Confusione]({{< relref "diffusion_and_confusion.md" >}})
-   **block cipher**
    -   piú analizzati degli **stream cipher**, sembrano piú applicabili


## Caratteristiche {#caratteristiche}

-   chiavi da 56 bit
    -   solitamente estese a 64 bit con bit di paritá
-   16 round
-   efficiente
-   noti solo attacchi di _brute force_

Struttura simile al [Feistel Cipher]({{< relref "feistel_cipher.md" >}}), ne differische solo nell'uso di una permutazione iniziale \\(\text{IP}\\) e una permutazione finale \\(\text{IP}^{-1}\\).

\\[\textsc{des}(T,K) = C\\]

-   \\(T\\) é plaintext 64 bit
-   \\(K\\) é la chiave
-   \\(C\\) é il ciphertext

{{< figure src="/ox-hugo/DES.png" >}}

La sue debolezze sono:

-   lunghezza delle chiavi
-   algoritmo