+++
title = "Flattening Hierarchical Scheduling"
author = ["Daniel Biasiotto"]
date = 2023-04-19T05:07:00+02:00
tags = ["article"]
draft = false
+++

-   Source:
-   Author: Lackorzynski, Warg, Volp, Hartig
-   Related: [Sistemi Operativi]({{< relref "SO.md" >}}), [Microkernel Based Systems]({{< relref "microkernel_based_systems.md" >}})


## Notes {#notes}

-   the objective is to integrate multiple real-time systems as guests on a single host using `VM`s
-   in literature there are different takes on the matter
    -   _mismatch between embedded-systems requirements and the virtual-machine model is evident in scheduling [...] the integrated nature of embedded systems requires that scheduling priorities of different subsystems must be interleaved. This is at odds with the concept of virtual machines._[<heiser> The Role of Virtualization in Embedded Systems]
    -   some argue bandwidth servers with small and frequently replenished budgets is sufficient
-   the paper argues the root of the dispute lies in limitations in current virtualization technology
    -   a small enhancement of the scheduler in the guest task sets for the host scheduler to integrate these workloads onto a single system by interleaving

-   different types of virtualization
    -   faithful and paravirtualization
        -   first needs hardware properties in the host
        -   second modifies the guest OS

-   the approach of the paper is to attenuate the strict separation for schedulers of different `VM`s
    -   that is the host just provides a budget to guests without any other information
    -   this is done by having the host scheduler allocating budgets as _scheduling contexts_
    -   as the schedulability of the system is validated this is attached to the `vCPU` of the `VM`
-   interrupts are implemented as assignments of `SC` to events by the host
