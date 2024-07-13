+++
title = "Cifrario di Vernam"
author = ["Daniel Biasiotto"]
date = 2022-03-09T17:09:00+01:00
draft = false
+++

A transposition technique for encrypting alphabetic text

-   we take a key to encrypt which length should be equal to the length of the plain text
-   assign a number to each character in the text and the key
    -   according to alphabetical order
-   add both numbers
-   reconvert modulo 26 to alphabetic text
