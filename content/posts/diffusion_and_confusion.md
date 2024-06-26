+++
title = "Diffusione e Confusione"
author = ["Daniel Biasiotto"]
date = 2022-03-10T14:53:00+01:00
draft = false
+++

Termini introdotti da Claude Shannon per indicare due elementi fondamentali a qualsiasi sistema crittografico.
L'interesse é quello di sviare la crittoanalisi statistica, in qualsiasi linguaggio naturale c'é regolaritá statistica, lettere con una certa frequenza e parole ripetute. Questo, dato un testo abbastanza lungo, permettono all'avversario di intuire un set di chiavi possibili o parte di una chiave.
Shannon si riferisce ad un cipher ideale come a uno nel quale tutte le statistiche del ciphertext sono indipendenti dalla chiave usata.
Egli propone questi due metodi per confondere la crittoanalisi statistica:

\\(\textsc{diffusion}\\)    la struttura statistica del plaintext é dissipata da statistiche sul ciphertext, ogni carattere del plaintext va a modificare il valore diversi caratteri del ciphertext.

\\(\textsc{confusion}\\)    rendere la relazione tra le statistiche del ciphertext e la chiave utilizzata piú complessa possibile, questo é ottenuto con un algoritmo di sostituzione complesso.
