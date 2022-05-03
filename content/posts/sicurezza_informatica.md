+++
title = "Sicurezza Reti e Calcolatori"
author = ["Daniel Biasiotto"]
date = 2022-03-09T17:01:00+01:00
tags = ["university"]
draft = false
+++

-   Prof: Bergadono


## Cifrari Simmetrici {#cifrari-simmetrici}

Cifrari sono sempre esistiti, tra i cifrari pre-informatici piú famosi ci sono i cifrari simmetrici `character-oriented`:

-   Cifrario di Cesare, cifrari monoalfabetici a 1 lettera
-   Cifrario di Playfair, monoalfabetico a 2 lettere
-   Cifrari monoalfabetici a N lettere
-   Cifrario di Vigenére, polialfabetico

|                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------|
| I cifrari polialfabetici sostituiscono una lettera ogni volta in modo diverso, a seconda della sua posizione nel testo. |

Questi cifrari si possono ancora suddividere in base alla tecnica utilizzata:

-   a sostituzione
-   a permutazione

Da quest'ultimo derivano i cifrari simmetrici `bit-oriented`:

-   [Cifrario di Vernam]({{< relref "cifrario_di_vernam.md" >}})
-   [One-time Pad]({{< relref "one_time_pad.md" >}})

In questi cifrari al posto dell'operazione di sostituzione alfabetica viene utilizzato \\(\oplus\\) (Exclusive Or).

I cifrari simmetrici moderni sono caratterizzati da:

-   uso del calcolatore
-   combinazione di permutazioni e sostituzioni
-   uso di numerose fasi, _round_

Di questi ne esistono diversi:

-   [Macchine a Rotori]({{< relref "macchine_a_rotori.md" >}})
-   [Feistel Cipher]({{< relref "feistel_cipher.md" >}})
-   [DES]({{< relref "des.md" >}})
-   [AES]({{< relref "aes.md" >}})

Una proprietá desiderabile in un encryption algorithm é chiamata _avalanche effect_

-   un cambiamento marginale in un input (chiave o plaintext) dovrebbe produrre un grande cambiamento nel ciphertext

Queste tecniche sono utilizzate nel contesto della _bulk encryption_


### Cifrari a blocchi {#cifrari-a-blocchi}

Utilizzando chiavi lunghe e testi arbitrariamente lunghi

1.  cifrare a 2 fasi
    -   suscettibile all'attacco _meet in the meddle_
        -   con _known plaintext_
        -   conoscendo `<P1,C1> <P2,C2>`
            -   servono estrambe per incrociare la ricerca, i match sono diversi per blocco
            -   ci sono molte piu' chiavi che blocchi
        -   _brute force_ sulla prima fase di cifratura, su \\(2^{56}\\) possibilita' su [DES]({{< relref "des.md" >}})
2.  cifrare a 3 fasi
    -   `triple DES` o `3DES`
    -   sicuro, chiave di \\(3\cdot 56=168\\)
    -   normalmente si utilizza `K1 = K3`
        -   la forza sta nelle 3 fasi, non nelle 3 chiavi
    -   si puo' utilizzare `3DES-EDE` con 3 chiavi uguali, che equivale a `DES`

Per testi lunghi

-   Electonic Codebook
    -   divisione in blocchi esatti e criptarli tutti con la stessa chiave
        -   vulnerabilita' alla criptoanalisi statistica, utilizzabile solamente con testi corti
-   Cipher Block Chaining
    -   ogni blocco cifrato e' mette in \\(\oplus\\) con il successivo plaintext
    -   il primo blocco e' in \\(\oplus\\) con un _initialization vector_ \\(IV\\)
        -   solitamente publico
    -   il piu' usato, sicuro, semplice, efficiente
    -   un errore di 1 bit rende indecifrabile il blocco successivo
-   Cipher FeedBack
    -   cifrario a flusso
    -   simile al [Cifrario di Vernam]({{< relref "cifrario_di_vernam.md" >}})
    -   inefficiente, viene scartato del lavoro
    -   un errore di un bit effendoci feedback crea _effetto valanga_
-   Output Feedback
    -   molto simile al Cipher Feedback
    -   il feedback e' fatto utilizzando gli \\(i\\) bit di output del cifrario a blocchi
    -   di fatto si divide in 2 fasi la procedura
        1.  prima di conoscere il testo si produce la sequenza di \\(i\\) bit
        2.  utilizzare questa informazione bufferizzata per cifrare in \\(\oplus\\)
    -   simile al [One-time Pad]({{< relref "one_time_pad.md" >}}) e al [Cifrario di Vernam]({{< relref "cifrario_di_vernam.md" >}})
        -   solo simile in quanto il vettore di \\(i\\) e' solo pseudocasuale


### Metodi dell'avversario {#metodi-dell-avversario}

L'avversario puó decodificare i cifrari monoalfabetici a una lettera facilmente attraverso una [Crittanalisi Statistica]({{< relref "crittanalisi_statistica.md" >}}).

Questa analisi risulta molto piú difficile con un cifrario polialfabetico:

-   in conoscenza di \\(n\\) é possibile fare la stessa analisi per lettere che distano \\(n\\) posizioni nel testo
    -   per cui quindi vale la stessa sostituzione

Di conseguenza un testo cifrato di questo tipo risulta tanto piú facile da decifrare tanto é piú lungo, ancor di piú in presenza di parti di testo fisse.


## Cifrari Asimmetrici {#cifrari-asimmetrici}

Si utilizzano 2 chiavi, una per criptare e una per decriptare
Le due chiavi non sono solo diverse nella forma, sono generate insieme e non e' possibile ottenere una dall'altra
La difficolta' per un avversario non é piú informativa ma **computazionale**
Questi cifrari non sostituiscono quelli tradizionali, simmetrici, in quanto piú impegnativo a livello computazionale, infatti i primi sono molto recenti ([Diffie-Hellman Key Exchange]({{< relref "diffie_hellman_key_exchange.md" >}})).

-   il protocollo piú utilizzato in questo ambito é [RSA]({{< relref "rsa.md" >}}).
-   sono spesso combinati con cifrari simmetrici e funzioni di hash
    -   vedi [Digital Envelope]({{< relref "digital_envelope.md" >}})

É possibile classificare l'uso di questi sistemi in:

1.  Encryption/Decryption
    -   sender encrypts with recipient public key
2.  Digital Signature
    -   sender signs with its private key
3.  Key Exchange
    -   le parti collaborano per scambiarsi una chiave segreta

{{< figure src="/ox-hugo/public-key-applications.jpg" >}}


## Funzioni di Hash {#funzioni-di-hash}

> Una funzione di Hash \\(H\\) accetta un blocco di dati \\(M\\) di lunghezza variabile e produce un valore di hash \\(h = H(M)\\) di lunghezza fissa.

-   una buona funzione di Hash ha la proprietá che applicata a un gran numero di input gli output siano ben distribuiti e apparentemente random
-   un cambiamento a un qualsiasi bit o bits in \\(M\\) causa, probabilmente, un cambiamento nel codice hash generato

In crittografia si una un particolare tipo di funzione di hash, che ha ulteriori proprietá:

-   `one-way property`
    -   _infeasible to find an object mapping to a pre-specified hash_
-   `collision-free property`
    -   _infeasible to find two objects mapping to the same hash_

Queste funzioni di hash sono utilizzate per:

-   autenticare messaggi con i `message digest`
    -   _sender_ e _recipient_ applicano entrambi la funzione e comparano i risultati
-   `digital signature`
-   `one-way password file`
-   `intrusion detection`
-   `virus detection`

{{< figure src="/ox-hugo/secure-hash-code.jpg" >}}

La funzione di hash piú utilizzata in tempi recenti é stato il [Secure Hash Algorithm]({{< relref "secure_hash_algorithm.md" >}})

Un _birthday attack_ é effettuato generando collissioni:

-   \\(2^{m}\\) messaggi
-   codici di \\(c\\) bit
-   \\(P(\text{collision}) > 0.5\\) per \\(m > \frac{c}{2}\\)
    -   quindi per 64 bit bastano \\(2^{32}\\) messaggi


## Autenticazione {#autenticazione}

> **NB**  Un messaggio cifrato non é necessariamente autentico, un messaggio autenticato puó essere leggibile. Spesso questi ultimi non vengono cifrati.


### Simmetrica {#simmetrica}

-   basata su cifrari simmetrici
-   chiave condivisa

\\(\textsc{mac}\_{K}(M)\\) - `Message Authentication Code`

1.  [DES]({{< relref "des.md" >}})-CBC -  `MAC-CBC`
    -   si usa l'ultimo blocco cifrato (o una parte) come `MAC`
2.  _Keyed Hash Function_ - `HMAC`
    -   `MAC` generato applicando \\(H\\) a una combinazione di \\(M\\) e una chiave segreta
    -   \\(\textsc{hmac}\_{K}(M) = H((K''\oplus \text{opad}) || H((K'' \oplus \text{ipad}) || M'))\\)
        -   \\(K''\\): una chiave segrete \\(K'\\) con padding di 0 fino a \\(j\\) bit
        -   \\(\text{ipad}\\): 00110110 ripetuto \\(j/8\\) volte
        -   \\(\text{opad}\\): 01011010 ripetuto \\(j/8\\) volte
    -   efficiente quanto \\(H\\)
        -   molto piú efficiente che `MAC-CBC`


### Firma elettronica {#firma-elettronica}

-   basata su cifrari asimmetrici
-   firma con la chiave _privata_, verifica con la chiave _pubblica_ di chi firma

In questo caso:

1.  [RSA]({{< relref "rsa.md" >}}) con `MD5/SHA-1`
    -   \\(\textsc{sha-1}(M)\\): _digest_
    -   \\(\textsc{rsa}(K^-(A),\text{digest})\\)
2.  `DSA` con `SHA-1`

Per far funzionare questo meccanismo é necessario risolvere il problema della distribuzione delle chiavi pubbliche.

-   una terza parte `C` puó ricevere \\(<ID,K^+(ID)>\\) e restituirne un certificato
-   questo poi viene condivisto da altre terze parti o dagli stessi che lo hanno richiesto

Alla fine il messaggio autenticato avrá la forma:
`M - FirmaElettronica - Certificato - Timestamp`