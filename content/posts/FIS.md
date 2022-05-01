+++
title = "Fisica"
author = ["Daniel Biasiotto"]
tags = ["university"]
draft = false
+++

## Vettori {#vettori}

Prodotti vettoriali tra i versori degli assi:

\begin{align\*}
\vec{i} \times \vec{j} &= \vec{k} \qquad \vec{j}\times\vec{u}=-\vec{k} \\\\
\vec{j} \times \vec{k} &= \vec{i} \qquad \vec{k}\times\vec{j}=-\vec{i} \\\\
\vec{k} \times \vec{i} &= \vec{j} \qquad \vec{i}\times\vec{k}=-\vec{j} \\\\
\vec{i} \times \vec{i} &= \vec{j}\times\vec{j} = \vec{k}\times\vec{k} = 0
\end{align\*}


## Elettrostatica {#elettrostatica}

\\[k\_0 = 8.99 \cdot 10^9 \frac{Nm^2}{C^2}\\]
\\[ q\_e = -1.6 \cdot 10^{-19}C = -e \\]
\\[ m\_e = 9.11\cdot 10^{-31}kg \\]


### Moto di Cariche {#moto-di-cariche}

\\[
\vec{r} = \vec{r\_0} + \vec{v\_0}t + \frac{1}{2}\vec{a}t^2
\\]
\\[
\vec{v} = \vec{v\_0}+\vec{a}t
\\]

Per un corpo con carica \\(q\\) e massa \\(m\\) in un campo elettrico:
\\[
m\vec{a}=\vec{F}=q\vec{E}\rightarrow \vec{a}=\frac{q\vec{E}}{m}=\frac{q}{m}(E\_x\vec{i}+E\_y\vec{j})
\\]


### Lavoro e Energia {#lavoro-e-energia}

\\[ L\_E = |\vec{F}||\vec{s}| \cos{\theta\_{\vec{F},\vec{s}}} \\]
\\[ |\vec{F}| = |-e\vec{E}|=eE   \\]

\\[ L\_E = \Delta E\_k = \Delta U = q(V\_A - V\_B)\\]
\\[\Delta E\_k = 0 - \frac{1}{2}m\_e v\_0^2  \\]

-   in caso di corpo inizialmente fermo

\\[P\_E = \frac{L\_E}{\Delta t} = - \frac{eEs}{\Delta t}= - \frac{eEv\_0\Delta t}{\Delta t}\\]

-   potenza sviluppata dal campo elettrico
-   negativa nel caso la forza elettrica si opponga al moto


### Legge di Coulomb {#legge-di-coulomb}

\\[k\_e = \frac{1}{4\pi \epsilon}\\]


### Campi elettrici {#campi-elettrici}

\\[E(\vec{r})=k\_e \frac{q}{|\vec{r}-\vec{r\_o}|^2}\vec{u}\\]

-   campo elettrico prodotto in \\(\vec{r}\\) da una carica puntiforme \\(q\\) posta in \\(r\_o\\)

\\[V(\vec{r}) = k\_e \frac{q}{ |\vec{r}-\vec{r\_o}| }+K  \\]

-   potenziale prodotto in \\(\vec{r}\\) da una carica puntiforme \\(q\\) posta in \\(r\_o\\)

\\(\vec{F} = q\_0\vec{E}\\)

-   forza su una particella di carica \\(q\_0\\) posta in un campo elettrico

\\(\vec{p} = q\vec{d}\\)

-   momento di dipolo elettrico


#### Dipolo elettrico {#dipolo-elettrico}

Momento del Dipolo \\(p=qd\\)

<!--list-separator-->

-  Piano Mediano

    Sul piano di direzione del campo elettrico é costante e uguale a quella della congiungente tra i due poli

    -   le componenti \\(y\\) si annullano

    \\[\vec{E} =- k\_e \frac{qa}{(\frac{d^2}{4}+y^2)^{3/2}}\vec{i}\\]

    -   per \\(|y| \gg a\\) vale \\[\vec{E} =-\frac{kp}{|y|^3}\vec{i}\\]

<!--list-separator-->

-  Lungo l'Asse

    \\[\vec{E} = k\_e \frac{2qxd}{x^2 - \frac{d^2}{4}}\vec{i}\\]

    -   per  \\(|x| \gg a\\) vale \\[\vec{E}= \frac{2kp}{|x|^3}\vec{i}\\]


#### Distribuzione Lineare e Uniforme Infinita {#distribuzione-lineare-e-uniforme-infinita}

\\[\vec{E} = 2k\_e\frac{\lambda}{r}\vec{u}\\]


#### Legge di Gauss {#legge-di-gauss}

Vale sempre, é una legge generale del campo elettrico.
\\[
\Phi\_{\vec{\sum}}= \int\_{S} \vec{E} \cdot \vec{n} dS = 4\pi k\_e \sum\_{i\to \infty} Q\_i
\\]
Valgono alcuni casi particolari

<!--list-separator-->

-  Simmetria Sferica di carica

    \\(E = k\_e \frac{Q}{R^2}\\)

<!--list-separator-->

-  Simmetria Assiale

    \\(E= 2k\_e \frac{\lambda}{R}\\)

<!--list-separator-->

-  Simmetria Planare

    \\(E = 2 \pi k\_e \sigma = \frac{\sigma}{2\epsilon\_0}\\)


### Circuiti {#circuiti}


#### Legge di O {#legge-di-o}

\\(V=RI\\)


#### Condensatori {#condensatori}

\\(C = \frac{q}{V}\\)

-   Capacitá

\\(\frac{1}{C} = \frac{1}{C\_1} + \frac{1}{C\_2}\\)

-   Condensatori in serie

\\(C = C\_1+C\_2\\)

-   Condensatori in parallelo

\\(U\_E = \frac{q^2}{2C} = \frac{1}{2}CV^2 = \frac{1}{2}qV\\)

-   Energia immagazzinata in un condensatore

<!--list-separator-->

-  Condensatore Piano

    \\(C=\varepsilon\_0 \frac{S}{d}\\)

    -   \\[\varepsilon\_0 = \frac{1}{4\pi k\_0} \\]

    \\(E = \frac{\sigma}{\epsilon\_0}\\)
    \\(V=Ed\\)


#### Resistenze {#resistenze}

\\(R\_{eq} = R\_1 + R\_2\\)
\\(\frac{1}{R\_{eq}} = \frac{1}{R\_1} + \frac{1}{R\_2}\\)

\\(P = RI^2\\)

-   potenza assorbita nella resistenza

\\(P=VI\\)

-   potenza erogata da una forza elettromotrice (_f.e.m._)


#### Kirchhoff {#kirchhoff}

\\[\sum\_i I\_i = 0 \\]

-   nodi

\\[\sum\_j f\_j - \sum\_k R\_kI\_k = 0 \\]

-   maglie


#### Circuito RC {#circuito-rc}

\\(q(t) = q\_0 (1-e^{-t/\tau})\\)
\\(i(t)=\frac{dq}{dt} = i\_0e^{-t/\tau}\\)

-   dove \\(\tau = RC\\)


## Magnetismo {#magnetismo}

\\(B=2k\_m\frac{I}{r}\\)

-   modulo del campo magnetico generato da un filo rettilineo di lunghezza infinita percorso da una corrente \\(I\\) in punto a distanza \\(r\\) dal filo

\\(B=4\pi k\_mnI = \mu\_0nI\\)

-   modulo del campo magnetico generato da un solenoide rettilineo ideale

\\[\vec{B}=2k\_m\frac{I\pi R^2}{(R^2+z^2)^{3/2}}\vec{n}\\]

-   Campo generato da una spira circolare percorsa da corrente, lungo l'asse della spira

\\[\vec{B} = \frac{k\_m}{k\_e}\vec{v}\times\vec{E}\\]
\\[\vec{B} = \frac{1}{c^2}\vec{v}\_a \times \vec{E}\_B\\]

-   Campo generato da una carica in moto in un campo elettrico

\\(\vec{F}=q\_0\vec{v}\times \vec{B}\\)

-   forza su una particella carica \\(q\_0\\) in moto in un campo magnetico

\\(\vec{F}=\vec{I}\times\vec{B}l\\)

-   forza su un filo rettilineo di lunghezza \\(l\\) percorso da corrente

\\[F=2k\_m\frac{I\_1I\_2}{d}l\\]

-   modulo della forza fra due fili rettilei paralleli percorsi da corrente

\\(\vec{m}=IS\\)

-   momento di dipolo magnetico di una spira di area \\(S\\)

\\[\Phi\_{\Sigma}(\vec{B})=\int\_\Sigma \vec{B}\cdot \vec{n}dS\\]

-   flusso campo magnetico attraverso una superfice \\(\Sigma\\)

\\(\Phi\_B = \vec{B}\cdot\vec{n}S = BS \cos{\theta}\\)


### Faraday Lenz {#faraday-lenz}

\\[\varepsilon\_i=-\frac{d\Phi\_\Sigma(\vec{B}) }{dt}\\]


### Fili {#fili}

\\[F= \frac{\mu\_0I\_1I\_2l}{2\pi d}\\]

-   repulsiva con correnti nel verso opposto, attrattiva se nello stesso verso


### Induttanza {#induttanza}

\\(\varepsilon = -L \frac{dI}{dt}\\)

-   _f.e.m._ autoindotta

\\(L = 4\pi k\_mn^2lS = \mu\_0 n^2 lS\\)

-   induttanza di solenoide rettilineo

\\(U\_M = \frac{1}{2}LI^2\\)

-   energia immagazzinata in un solenoide

\\(L\_{eq} = L\_1 + L\_2\\)

-   induttanze in serie

\\(\frac{1}{L\_{eq}} = \frac{1}{L\_1} + \frac{1}{L\_2}\\)

-   induttanze in parallelo

Forza elettromotrice autoindotta:

\begin{align\*}
\vec{F}\_B &= (I\_0 + I\_{\text{ind}})LB\_I\vec{u} \\\\
&= \frac{\varepsilon - B\_ILv}{R}LB\_I\vec{u}
\end{align\*}


### Circuito LR {#circuito-lr}

\\(I=I\_0(1-e^{-t/\tau})\\)

-   corrente dopo chiusura con \\(\tau = \frac{L}{R}\\)

\\(I=I\_0 e^{-t/\tau}\\)


### Circuito LC {#circuito-lc}

\\(q = q\_0 \cos{(\omega\_0t + \emptyset)}\\)

-   dove \\(\omega\_0 = \frac{1}{\sqrt{LC}}\\)


### Circuito RLC {#circuito-rlc}

\\(Z = \sqrt{R^2 + (\omega L - \frac{1}{\omega C})^2}\\)

-   impedenza in presenza di una _f.e.m._ alternata con pulsazione \\(\omega\\)