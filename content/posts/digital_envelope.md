+++
title = "Digital Envelope"
author = ["Daniel Biasiotto"]
date = 2022-03-23T14:36:00+01:00
tags = ["security"]
draft = false
+++

-   Source: <http://security.nknu.edu.tw/crypto/faq/html/2-2-4.html>

Combines public and secret key encryption:

-   use a secret key \\(K\_{1}\\) to encrypt the messsage \\(M\\)
-   use the public key of the receiver to encrypt the secret key \\(K\_{1}\\)
-   the receiver will decrypt \\(K\_{1}\\) with its private key
