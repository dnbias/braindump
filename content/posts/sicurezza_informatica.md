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

> I cifrari polialfabetici sostituiscono una lettera ogni volta in modo diverso, a seconda della sua posizione nel testo.

Questi cifrari si possono ancora suddividere in base alla tecnica utilizzata:

-   a sostituzione
-   a permutazione

Da quest'ultimo derivano i cifrari simmetrici `bit-oriented`:

-   [Cifrario di Vernam]({{< relref "cifrario_di_vernam.md" >}})
-   [One-time Pad]({{< relref "one_time_pad.md" >}})

In questi cifrari al posto dell'operazione di sostituzione alfabetica viene utilizzato \\(\oplus\\)[^fn:1]


### Cifrari a blocchi {#cifrari-a-blocchi}

Utilizzando chiavi lunghe e testi arbitrariamente lunghi

1.  cifrare a 2 fasi
    -   suscettibile all'attacco _meet in the middle_
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

Per _plaintext_ lunghi si hanno diverse tecniche per creare un messaggio cifrato a partire dai blocchi:

-   **Electonic Codebook**
    -   molto semplice ed efficiente ma insicuro
    -   divisione in blocchi esatti e criptarli tutti con la stessa chiave
        -   parti di testo uguali avranno blocco _ciphertext_ uguali
        -   vulnerabilitá alla criptoanalisi statistica, utilizzabile solamente con testi corti
-   **Cipher Block Chaining**
    -   ogni blocco cifrato e mette in \\(\oplus\\) con il successivo plaintext
        -   si decifra con un \\(\oplus\\) tra la decrittazione del blocco corrente \\(C\_{i}\\) e il blocco precedente (cifrato) \\(C\_{i-1}\\)
    -   il primo blocco é in \\(\oplus\\) con un _initialization vector_ \\(IV\\)
        -   solitamente publico
    -   il piú usato, sicuro, semplice, efficiente
    -   un errore di 1 bit rende indecifrabile il blocco successivo
-   **Cipher FeedBack**
    -   cifrario a flusso
    -   simile al [Cifrario di Vernam]({{< relref "cifrario_di_vernam.md" >}})
    -   inefficiente, viene scartato del lavoro
    -   un errore di un bit essendoci feedback crea _effetto valanga_
-   **Output Feedback**
    -   molto simile al Cipher Feedback
    -   il feedback é fatto utilizzando gli \\(i\\) bit di output del cifrario a blocchi
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
Le due chiavi non sono solo diverse nella forma, sono generate insieme e non é possibile ottenere una dall'altra
La difficoltá per un avversario non é piú informativa ma **computazionale**
Questi cifrari non sostituiscono quelli tradizionali, simmetrici, in quanto piú impegnativo a livello computazionale, infatti i primi sono molto recenti ([Diffie-Hellman Key Exchange]({{< relref "diffie_hellman_key_exchange.md" >}})).

-   il protocollo piú utilizzato in questo ambito é [RSA]({{< relref "rsa.md" >}}).
-   sono spesso combinati con cifrari simmetrici e funzioni di hash
    -   vedi [Digital Envelope]({{< relref "digital_envelope.md" >}})

É possibile classificare l'uso di questi sistemi in:

1.  **Encryption/Decryption**
    -   sender encrypts with recipient public key
2.  **Digital Signature**
    -   sender signs with its private key
3.  **Key Exchange**
    -   parts work together  to exchange a common secret key

{{< figure src="/ox-hugo/public-key-applications.jpg" >}}


## Funzioni di Hash {#funzioni-di-hash}

> Una funzione di Hash \\(H\\) accetta un blocco di dati \\(M\\) di lunghezza variabile e produce un valore di hash \\(h = H(M)\\) di lunghezza fissa.

-   una buona funzione di Hash ha la proprietá che applicata a un gran numero di input gli output siano ben distribuiti e apparentemente random
-   un cambiamento a un qualsiasi bit o bits in \\(M\\) causa, probabilmente, un cambiamento nel codice hash generato

In crittografia si usa un particolare tipo di funzione di hash, che ha ulteriori proprietá:

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
    -   quindi per \\(64\\) bit bastano \\(2^{32}\\) messaggi

Quindi un attaccante puó facilmente creare collisioni, ma il messaggio di cui il digest colliderá sará comunque incomprensibile, questo attacco é utile quando il ricevente si aspetta numeri o stringhe arbitrarie e non noterá nulla di strano nel messaggio ricevuto.
Questi risultati impongono digest con almeno \\(256\\) bit.


## Autenticazione {#autenticazione}

> **NB**  Un messaggio cifrato non é necessariamente autentico, un messaggio autenticato puó essere leggibile. Spesso questi ultimi non vengono cifrati.


### Simmetrica {#simmetrica}

-   basata su **cifrari simmetrici**
-   chiave condivisa

\\(\textsc{mac}\_{K}(M)\\) - `Message Authentication Code`

1.  [DES]({{< relref "des.md" >}})-CBC -  `MAC-CBC`
    -   si usa l'ultimo blocco cifrato (o una parte) come `MAC`
2.  _Keyed Hash Function_ - `HMAC`
    -   `MAC` generato applicando \\(H\\) a una combinazione di \\(M\\) e una chiave segreta
    -   \\(\textsc{hmac}\_{K}(M) = H((K''\oplus \text{opad}) || H((K'' \oplus \text{ipad}) || M'))\\)
        -   \\(K''\\): una chiave segreta \\(K'\\) con padding di 0 fino a \\(j\\) bit
            -   se maggiore di \\(j\\) bit \\(K'' = H(K')\\)
        -   \\(\text{ipad}\\): 00110110 ripetuto \\(j/8\\) volte
        -   \\(\text{opad}\\): 01011010 ripetuto \\(j/8\\) volte
    -   efficiente quanto \\(H\\)
        -   molto piú efficiente che `MAC-CBC`


### Firma elettronica {#firma-elettronica}

-   basata su **cifrari asimmetrici**
-   firma con la chiave _privata_, verifica con la chiave _pubblica_ di chi firma

In questo caso:

1.  [RSA]({{< relref "rsa.md" >}}) con `MD5/SHA-1`
    -   \\(\textsc{sha-1}(M)\\): _digest_
    -   \\(\textsc{rsa}(K^-(A),\text{digest})\\)
2.  `DSA` con `SHA-1`

Per far funzionare questo meccanismo é necessario risolvere il problema della distribuzione delle chiavi pubbliche. Questo in quanto rimane possibile un **Man in the Middle attack**.

-   una terza parte `C` puó ricevere \\(\langle ID,K^+(ID)\rangle\\) e restituirne un certificato
-   questo poi viene condivisto da altre terze parti o dagli stessi che lo hanno richiesto
-   il certificato di chiave pubblica é un documento che attesta <span class="underline">l'associazione univoca</span> tra chiave pubblica e l'identitá del soggetto
-   queste operazioni sono eseguite da un ente fidato, `Certification Authority` o `CA`
    -   un attaccante pur sostituendo una chiave certificata _sniffata_ non puó sostituirla con la propria, non ha accesso alla chiave privata della `CA` e non puó crearsi un certificato falso

Alla fine il messaggio autenticato avrá la forma:
`M - FirmaElettronica - Certificato - Timestamp`


## Sniffing &amp; Spoofing {#sniffing-and-spoofing}

1.  sniffing
    -   non facile su rete geografica
    -   possibile su `LAN`
        -   sia su switch che non
        -   non é possibile su _switch unicast_
        -   solo su _broadcast_
2.  spoofing
    -   `ARP` spoofing/poisoning
    -   `DHCP` associa automaticamente `IP` di router e `DNS`
    -   `ARP` associa `MAC-IP`
        -   _broadcast_ per la richiesta del `MAC` associato a un `IP`
        -   _unicast_ per la risposta
        -   l'avversario risponde con il proprio `MAC` ingannando il richiedente
    -   possibile tecnica per:
        -   `MAC`
            -   scheda di rete in modalitá promiscua
            -   `MAC` della scheda cambiato malevolmente
        -   `IP`
            -   non in `TCP` dove c'é il _3-way handshake_
        -   `DNS`
            -   instradamento degli utenti verso un `DNS` malevolo
            -   `DNS` malevolo serve `IP` falsificati
        -   `URL`
            -   indirizzi falsi

Per evitare questi attacchi:

-   non usare `HUB` ma switch
-   non usare _broadcast_
-   cifrare a livello applicativo e a livello di trasporto


## DDoS {#ddos}

-   raro
-   difficile da evitare per i principi costituenti della rete
    -   per applicazioni critiche é utile avere reti dedicate

Possibili attacchi:

1.  `syn flooding`
    -   primo messaggio dell'handshake `TCP` senza che questo sia poi portato a termine
2.  `ICMP echo request`
    -   distibuted, _zombie_ e _reflectors_
    -   _smurf attack_
        -   `echo` request con payload consistente
            -   possibilitá pensata per testing di rete, `echo` in broadcast
            -   ora non piú possibile
3.  `relay SMTP`
    -   flooding tramite server mail
    -   possibili configurazioni server per evitare questi attacchi


## Firewall {#firewall}

-   vulnerabilitá locali di una macchina possono permettere il controllo della rete intera
-   un `PC` compromesso in `LAN` permette attacchi diretti alla rete locale
-   il `Firewall` si interpone tra `LAN` e `WAN` come unico punto di accesso
    -   servizi di
        -   filtro (direzione, servizio, utente)
        -   log (traffico, utenti)
        -   allarme
    -   incluso nel _router_, `screening router`
        -   scarta i pacchetti sospetti
        -   non notifica
    -   `dual homed gateway`
        -   tra `LAN` e _router_
        -   il router si occupa di routing
        -   spesso comunque tutte le funzioni sono concentrate in un unico dispositivo
        -   dispositivi specializzati: _firewall appliance_
    -   `screened host gateway`
        -   fisicamente i pacchetti non sono forzati attraverso il `FW`
        -   si forza il passaggio a livello logico `IP`

Spesso in sicurezza, e anche per questi dispositivi, si parla di _High Availability_

-   piú `FW` possono servire in parallelo per garantire la funzionalitá in caso di guasti
-   Internet \\(\rightarrow\\) Router \\(\rightarrow\\) Switch \\(\rightarrow\\) FW | FW \\(\rightarrow\\) Switch \\(\rightarrow\\) `LAN`

Una `DMZ` é una cosiddetta

-   _DeMilitarized Zone_
-   server che devono poter comunicare con l'esterno senza interferenze dall'`FW`


### Package Filter {#package-filter}

-   livello 3 e parzialmente 4
    -   `IP` e `TCP/UDP`
-   protegge in base alla direzione
    -   interfaccia in/out
    -   `IP` mittente e destinatario
    -   porta sorgente e destinazione
-   la _frammentazione IP_ puó essere usata per passare attraverso un `FW`
    -   piccoli frammenti 24-28 Byte, senza header `TCP`
-   da bloccare il _source routing_
    -   permette al mittente di decidere l'instradamento
    -   permette `IP` spoofing con `TCP` su `WAN`
-   `ACL` - Access Control List
    -   omonimo con sistema _Windows_, diversi
    -   lista di regole di accesso


### Sofware Firewall {#sofware-firewall}

-   livello 5
    -   applicativo e di trasporto `TCP/UDP`
-   piú semplice attraverso un `proxy-FW`
    -   va configurato un _proxy_ per ogni servizio da attivare
    -   non é trasparente
    -   piú lento
    -   sicuro, sofisticato
-   mascheramento degli indirizzi tramite `NAT`
    -   megli il `NAPT`
        -   unico indirizzo pubblico
        -   indirizzi tradotti assieme alle porte
    -   puó anche effettuare _load balancing_
        -   round robin, evita attacchi di carico
-   `WAF` - Web Application `FW`
    -   _reverse proxy_
    -   esamina il payload applicativo
    -   solo se sicura apre la connessione al nostro server web e inoltra


## VPN {#vpn}

Standard: `IPsec`

-   permette collegamento a rete privata virtualmente
    -   lavorare da remoto con la stessa sicurezza che si ha all'interno della `LAN`
-   traffico _virtualmente interno_ passa su internet e va protetto


### IPsec {#ipsec}

`IP` level security

-   livello 3
-   `RFC 1825`
-   layer che si va a inserire sopra quello `IP`
    -   header annidato all'interno dell'header `IP`
    -   `PDU` cifrata/autenticata assieme a info per decifrazione
    -   l'header `IP` non viene modificato
        -   i router non si accorgono del cambiamento
-   protezione da modifica e intercettazioni
-   cifratura ai capi della comunicazione tra le `LAN`
-   ovviamento non protegge da vulnerabilitá interne

Due modalitá di funzionamento:

1.  transport
2.  tunnel

E tecniche

1.  `AH`
2.  `ESP`

Queste tecniche sono annidabili

-   prima applicando `AH` e poi `ESP`


#### Transport {#transport}

-   software `VPN` sui calcolatori comunicanti
-   protegge da spoofing/sniffing si rete locale
-   non é trasparente, necessaria configurazione
-   unico metodo per una postazione mobile
    -   sono possibili soluzioni miste


#### Tunnel {#tunnel}

-   cifratura/auth da parte di un agente esterno _terminatore_
    -   spesso incluso nel router e `FW`
    -   i pacchetti escono dal _tunnel_ decriptati
-   <span class="underline">non</span> protegge da spoofing/sniffing su rete locale
-   nasconde gli indirizzi
    -   sono solamento noti gli `IP` dei _terminatori_
-   trasparente
-   veloce, efficiente


#### Authentication Header {#authentication-header}

`AH`

-   garantisce integritá
-   posizionato tra `header IP` e `PDU`
-   formato
    -   Next Header
        -   8B
        -   protocollo superiore
    -   Length
        -   8B
    -   Reserved
        -   16B
    -   `SPI`
        -   32B
        -   Security Parameter Index
        -   parametri (entrambi indici di una tabella interna condivisa)
            -   tipo di algoritmo
            -   chiave simmetrica
    -   Data
        -   \\(N\times\\) 32B
        -   dati di autenticazione `MAC`
        -   questo `MAC` coper da `header IP` in poi
            -   ignora campi variabili `TTP` e `checksum` impostandoli a 0


#### Encapsulating Security Payload {#encapsulating-security-payload}

`ESP`

-   posizionato dopo `header IP` e incapsula il `PDU` cifrato
-   formato in modalitá _Transport_
    -   `SPI`
        -   non cifrato
    -   `PDU`, Next Header, autenticazione
        -   cifrati
-   formato in modalitá _Tunnel_
    -   `SPI`
        -   non cifrato
    -   `header IP` incapsulato
        -   cifrato
        -   header originale nascosto dal terminatore `VPN`
        -   funzione di offuscamento del traffico
    -   `PDU`, `NH`, auth
        -   cifrati


#### Anti-Replay {#anti-replay}

-   individua ripetizione pacchetti
    -   non é possibile escludere che non creino problemi a livello applicativo
-   pacchetti `IPsec` numerati con un _sequence number_ 16bit
-   tecnica a _sliding window_ con \\(W\\) bit
    -   implementazione con un _bit vector_
    -   \\(N\\) ultimo _sn_ ricevuto
    -   finestra da \\(N-W\\) a \\(N+1\\)
        -   _sn_ ricevuto a sinistra della finestra, non posso decidere
        -   _sn_ ricevuto a destra, sicuramente nuovo
        -   _sn_ all'interno il vettore indica se é stato ricevuto o no


## Web Security {#web-security}


## Blockchain {#blockchain}

[^fn:1]: Exclusive Or

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