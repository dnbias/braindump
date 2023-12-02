+++
title = "Performance Analysis - Simulations and Models"
author = ["Daniel Biasiotto"]
date = 2022-09-22T00:00:00+02:00
tags = ["university", "master", "simulation"]
draft = false
+++

Taught by Gianfranco Balbo, Gaeta

-   Lawrence M. Leemis, Stephen K. Park, _Discrete Event Simulation: a first course_, Pearson - Prentice Hall
-   Denning, Buzen, _[The Operational Analysis of Queueing Network Models]({{< relref "the_operational_analysis_of_queueing_network_models.md" >}})_, ACM Computing Surveys, 1978


## Systems {#systems}

This course focuses on systems that are:

-   stochastic
-   dynamic
-   discrete-event


## Introduction {#introduction}


### Discrete-event simulation {#discrete-event-simulation}

-   purpuse, modeling - simulating - analyzing systems
-   way, computation and mathematical techniques
-   experiments on the model

A **model** is a conceptual framework describing a system
The simulations are going to use **Montecarlo**-based techniques[^fn:1]

Model Development (typically done iteratively):

1.  Goals and objectives
2.  Build a _conceptual model_
3.  Convert into a _specification model_
4.  Convert into a _computational model_
5.  Verify
6.  Validate


### Formalisms {#formalisms}

-   **Queueing Networks**
    -   concurrency
    -   congestion
-   **Stochastic Petri Nets**
    -   concurrency
    -   congestion
    -   sychronization

Queues can use different _disciplines_ or algorithms to regulate the job handled by the server

-   `FIFO`
-   `LIFO`
-   `SIRO`, serve in random order
-   using some kind of priority, usually `SJF`

Basic assumptions on queues:

-   `FIFO`
-   _non-preemptive_
    -   once initiated, service will continue until completion
-   _conservative_
    -   _server_ stays idle if there is one or more jobs in the service node

For a job \\(i\\)

-   arrival time \\(a\_{i]\\)
-   delay \\(d\_{i]\\)
-   service begins at time \\(b\_{i] = a\_{i] + d\_{i]\\)
-   service time \\(s\_{i}\\)
-   wait time \\(w\_{i} = d\_{i} + s\_{i]\\)
-   departure time \\(c\_{i] = a\_{i} + w\_{i}\\)
-   interarrival time \\(\tau\_{i} = a\_{i} - a\_{i-1}\\)
-   idle time \\(e\_{i} = a\_{i} - c\_{j-1}\\)
    -   \\(0\\) if job arrives whle the server is busy

In general:
\\[B = \sum\_{i=1}^{n} s\_{i}\\]
\\[E = \sum\_{i=1}^{n} e\_{i}\\]

Observing these informations we can distinguish:

-   **job-averaged statistics**
    -   average interarrival time

\\[\overline \tau = \frac{1}{n}\sum^{n}\_{i=1}\tau\_{i}=\frac{a\_{n}}{n}\\]

-   input rate \\(\theta = \frac{1}{\overline \tau}\\)
-   average service time

\\[\overline s = \frac{1}{n}\sum^{n}\_{i=1} s\_{i}=\frac{B}{n}\\]

-   service rate \\(\mu = \frac{1}{\overline s}\\)
    -   maximum throughput, in the case that the server was never idle
-   total simulation time \\(T = c\_{n} - c\_{0}\\)
-   throughput \\[X = \frac{n}{T}\\]
-   utilization \\[U = \frac{B}{T}\\]

<!--listend-->

-   **time-averaged statistics** are defined by the area under a curve (integration)
    -   defined 3 functions
        -   \\(n(t)\\), number of jobs in the service node at time \\(t\\)
        -   \\(q(t)\\), number of jobs in the queue at time \\(t\\)
        -   \\(y(t)\\), number of jobs in service at time \\(t\\)
        -   \\(n(t) = q(t) + y(t)\\)
    -   \\[\overline n = \frac{1}{T} \int\_{0}^{T} n(t) dt\\]
    -   \\[\overline q = \frac{1}{T} \int\_{0}^{T} q(t) dt\\]
    -   \\[\overline y = \frac{1}{T} \int\_{0}^{T} y(t) dt\\]
        -   also the _server utilization_ (probability, in the limit)
        -   \\[\overline y = \frac{\sum\_{i=1}^{n} s\_{j}}{c\_{n}} = \frac{B}{c\_{n}} = \frac{c\_{}\_{n}- E}{c\_{n}}\\]
    -   _traffic intensity_, input rate to service rate ratio
        -   \\[\rho = \frac{1/\overline \tau}{1/\overline s} = \frac{c\_{n}B}{a\_{n} c\_{n}} = \bigg (\frac{c\_{n}}{a\_{n}}\bigg )\overline y\\]

> A **Trace File** is a log of all the arrival and service times.


## Discrete-Event Simulation {#discrete-event-simulation}

The general structure of the simulator is made of different _handlers_:

<div class="code">

void initialize() {
    clock = 0;
    halt = false;
    nsys = 0;
    Busy = 0;
    Area_n = 0;

arrival_t = GetArrival(fp);
service_t = GetService(fp);

event_notice = get_new_node();
event_notice-&gt;event.type = ARRIVAL;
event_notice-&gt;event.occur_time = arrival_t;
event_notice-&gt;event.service_time = service_t;
schedule(event_notice); // scheduling the first event

    event_notice = get_new_node();
    event_notice-&gt;event.type = END;
    event_notice-&gt;event.occur_time = End_time;
    schedule(event_notice);
}

</div>

In the engine we call the **handlers**, these are best kept as small and fast as possible.
It is better to create different variants of the events with simple handles than have fewer but more complex handlers.

<div class="code">

void engine(void) {
    int event_type;
    double oldclock, delta;
    nodePointer new_event;

new_event = event_pop();

oldclock = clock;
clock = new_event-&gt;event.occur_time;
delta = clock - oldclock;

// nsys &gt; 0, somebody was in the queue
if (nsys &gt; 0) {
    Busy = Busy + delta;
    Area_n = Area_n + nsys \* delta;
}

    // transition
    event_type = new_event-&gt;event.type;
    switch(event_type) {
        case ARRIVAL : arrival(new_event);
            break;
        case DEPARTURE : departure(new_event);
            break;
        case END : end(new_event);
    }
}

</div>

<div class="code">

void arrival(struct node\* node_event) {
    struct node\* next_job;

nsys++;
if (nsys == 1) { _/ Nobody was in queue
    node_event-&gt;event.type = DEPARTURE;
    node_event-&gt;event.occur_time = clock + node_event-&gt;event.service_time;
    schedule(node_event);
    /_ the engine popped the event

    //  arrival puts it back as a departure
} else {
    enqueue(node_event);
}
arrival_t = GetArrival(fp);
service_t = GetService(fp);

    next_job = get_new_node();
    next_job-&gt;event.type = ARRIVAL;
    next_job-&gt;event.occur_time = arrival_t;
    next_job-&gt;event.service_time = service_t;
    schedule(next_job);
}

</div>

<div class="code">

void departure(struct node\* node_event) {
    double waiting_time;
    struct node\* next_job;

    nsys--;
    if (nsys &gt; 0) {
        next_job = dequeue();
        next_job-&gt;event.type = DEPARTURE;
        next_job-&gt;event.occur_time = clock + next_job-&gt;event.service_time;
        schedule(next_job);
    }
    return_node(node_event);
}

</div>

<div class="code">

void End(struct node\* node_event) {
    halt = true;
    return_node(node_event);
}

</div>


### Memory Management {#memory-management}

To have an efficient memory management it is important not to use `GC`, instead it's better to reuse as many chunks of memory as possible. That is because the memory manager operation are very time-intensive.
This can be done by having an `available-list` of chunks where we can take and place back chunks, interrogating the memory manager as little as possible.


## Tandem Network {#tandem-network}

A network made of two queues each with its output connected to the others input.
The `Event Notice` follows the life of a single job, in this structure the clients/jobs are continuously passing from one queue to another. This means there is no need for an `Available Queue` anymore as the number of notices is not gonna change during the simulation.
The basic assumption of the **clock** is that it is always cabable of the time granularity needed to distinguish between events that occur "at the same time".

-   so, while events pass from one queue to another in 0 time, the clock is able to distinguish and establish which event (departure from one | arrivale to the other) is happening first


## Operational Analysis {#operational-analysis}

See [Denning78/Notes]({{< relref "the_operational_analysis_of_queueing_network_models.md#notes" >}}).


### Bottleneck {#bottleneck}


### State Transition Balance {#state-transition-balance}

**State** of the system can be represented by the number of waiting customers.

-   \\[C(m,n)\\] is the number of times the system moves from state \\(m\\) to state \\(n\\)

The **Balance Equation** holds for all states, but the first and the last one
\\[\sum\_{k} C(k,n) = \sum\_{m}C(n,m)\\]

-   the first has one more exits than entries
-   the last has one more entries than exits

To simplify the state graph we organize them in a chain

-   **One-Step Behavior**


### Convolution Method {#convolution-method}


#### Load Independent Stations {#load-independent-stations}

_service time of each station is independent to the number of clients in queue_

-   **Utilization Law**

\\[\overline n\_{m} (n) = U\_{m}(n)[1+\overline n\_{m} (n-1)]\\]

\\[\overline w\_{m}(n) = S\_{m}[1+\overline n\_{m}(n-1)]\\]


#### Mean Value Analysis {#mean-value-analysis}

see **Arrival Theorem** (Sevcik-Mitrani)

-   in single server stations with **Poisson input process** arriving customers see the system as they were _external observers_ not involved in its operation

Then we group the recurrent expression for the \\(i\text{-th}\\) station

\\[\overline n\_{i}(n) = S\_{i}[1+\overline n\_{}\_{i} (n-1)]\\]
\\[U\_{i}(n) = X\_{i}(n) S\_{i}\\]
\\[\overline n\_{i} (n) = U\_{i}(n)[1+\overline n\_{i} (n-1)]\\]

In a system where we identified the station \\(ref\\) as the reference for the computation of the \\(V\_{i}\\)

\\[Y\_{ref}(n) = S\_{ref} + \sum\_{i=1,i\neq ref}^{M} V\_{i} \overline w\_{i} (n)\\]

For the \\(i\text{-th}\\) station the list of derivation is:

\begin{align\*}
\overline w\_{i} (n) &= S\_{i} [1 + \overline n\_{i}(n-1)]\\\\
X\_{ref}(n) &= \frac{n}{\sum^{M}\_{j=1} [V\_{j} \oveline w\_{j}(n)]}\\\\
X\_{i}(n) &= V\_{i} X\_{ref}(n)\\\\
U\_{i}(n) &= X\_{i}(n)S\_{i}\\\\
\overline n\_{i}(n) &= U\_{i}(n)[1 + \overline n\_{i} (n-1)]
\end{align\*}

Very simple from a computational point of view

-   just loop \\(M\\) times
-   number of multiplications by the order of the number of the stations

With a **Delay station** the algorithm has to be modified

\begin{align\*}
\overline w\_{i}(n) =
\begin{cases}
Z\_{i}  \quad &\text{Delay Station}\\\\
S\_{i}[1 + \overline n\_{i}(n-1)] \quad &\text{Load Independent Station}
\end{cases}
\end{align\*}

\begin{align\*}
\overline n\_{i}(n) =
\begin{cases}
Z\_{i} X\_{i}(n) \quad &\text{Delay Station}\\\\
U\_{i}(n)[1 + \overline n\_{i}(n-1)] \quad &\text{Load Independent Station}
\end{cases}
\end{align\*}

\begin{align\*}
U\_{i}(n) =
\begin{cases}
\frac{\overline n\_{}\_{i}(n)}{n}\quad &\text{Delay Station}\\\\
X\_{i}(n)S\_{i} \quad &\text{Load Independent Station}
\end{cases}
\end{align\*}


### BCMP Theorem {#bcmp-theorem}

**Baskett, Chandy, Muntz, Palacios**


## Random Values {#random-values}


### Generation {#generation}


#### Distributions {#distributions}

<!--list-separator-->

-  Pareto Type 1

    \begin{align\*}
    F\_x (x) =
    \begin{cases}
    1- \big(\frac{\beta}{x}\big)^\alpha \quad x \ge \beta \\\\
    0 \quad x < \beta
    \end{cases}
    f(x) = \frac{\alpha \beta^\alpha}{x^{\alpha+1}}
    E[x] =
    \begin{cases}
    \infty \quad \alpha \le 1\\\\
    \frac{\alpha \beta}{\alpha - 1} \quad \alpha > 1 \\\\
    \end{cases}
    \end{align\*}


#### Acceptance-Rejection {#acceptance-rejection}

Generates random variates

-   usually continuous
-   for distribution whose `IDF` cannot be easily computed

Generate 2 randoms for \\(x\\) and \\(y\\)

-   these individuate a point
-   a point inside the area of the density function is a _hit_

This is a _brute-force_ approach

-   doesn't matter the shape of the function
-   efficiency can be really low
    -   lots of point can be useless
-   efficiency depends on how well the \\(c g(x)\\) approximates \\(f(x)\\)

<!--listend-->

```c
do {
    u = Random();
    x = g_inverse(u);
    v = Random();
} while (c * g(x) * v > f(x)); // rejection criteria
return x;
```


#### Composition {#composition}

-   usually continuous random variates
-   distribution can be computed as weighted sum of elementary distributions


#### Cox Theorem {#cox-theorem}

Any distribution can be represented in this manner

-   has to have a `Rational Laplace Transform`
-   it is an approximation still

With a _schema_ with \\(n\\) negative exponentials added up at each step with a probability \\(\alpha\\), else the result is returned.

[^fn:1]: Computational algorithms using repeated random sampling to obtain results
