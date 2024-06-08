+++
title = "One-time Pad"
author = ["Daniel Biasiotto"]
date = 2022-03-09T17:09:00+01:00
draft = false
+++

Un particolare [Cifrario di Vernam]({{< relref "cifrario_di_vernam.md" >}}) dove la chiave ha la stessa lunghezza del testo.
É l'unico cifrario totalmente sicuro, ma risulta poco pratico:

-   se c'é bisogno di scambiarsi in modo sicuro una chiave lunga come il messaggio tanto vale scambiarsi direttamente il messaggio!
-   é totalmente sicuro in quanto anche un avversario con infinita potenza computazionale in un attacco _brute force_ troverebbe tutte le possibili combinazioni di caratteri, molto di queste sarebbero nella lingua ricercata e avrebbero senso compiuto. Impossibile stabilire il messaggio decriptato.
