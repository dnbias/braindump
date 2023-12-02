+++
title = "Secure Hash Algorithm"
date = 2022-04-15T01:40:00+02:00
tags = ["security"]
draft = false
+++

{{< figure src="/ox-hugo/SHAs.jpg" >}}

`SHA` is based on the hash function `MD4`.
`SHA-256` and `SHA-384` and `SHA-512` are collectively known as `SHA-2`.


## SHA-512 Logic {#sha-512-logic}

1.  Append padding bits
2.  Append length
3.  Initialize hash buffer
4.  Process message in 1024-bit blocks
5.  Output

{{< figure src="/ox-hugo/SHA-512-single-round.jpg" >}}
