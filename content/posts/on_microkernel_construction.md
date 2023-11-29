+++
title = "On Microkernel Construction"
author = ["Daniel Biasiotto"]
date = 2023-03-12T20:40:00+01:00
tags = ["paper"]
draft = false
+++

-   Source: <https://doi.org/10.1145/224056.224075>
-   Author: [Jochen Liedtke]({{< relref "jochen_liedtke.md" >}})
-   Related: [Microkernel Based Systems]({{< relref "microkernel_based_systems.md" >}})


## Claim {#claim}

The shortcomings of the \\(\mu\\)-kernel are to be attributed mostly to overloading the kernel and/or improper implementations.


## Summary {#summary}

The author finds that the shortcoming in performance measured in microkernels dismiss the entire category without understanding the reason of the issue, whether it was caused by the approach of the \\(\mu\\)-kernel, by the concepts implemented or by the implementation itself. Considering these criticisms the author concludes that most of the performance issues are caused by improper implementations.
The paper defines the basic \\(\mu\\)-kernel concepts, primitives that are to be implemented. These are concepts that if moved outside of the kernel would compromise the functionality of the system.
These concepts are:

-   independence;
-   integrity;
-   mapping virtual to physical pages (_address spaces_), the author proposes three operations for constructing and maintaining address spaces: **grant**, **map**, **flush**;
-   threads and `IPC`, needed for the **grant** and **map** operations and also for abstracting hardware interrupts;
-   `uid`, required for reliable local communications.

With these basic concepts it is possible to implement applications typically included in kernels on top of the \\(\mu\\)-kernel.


## Notes {#notes}

\\(\mu\\)-kernels are costructed on the basic idea that one must implement whatever possible outside of the kernel[<kernel> The kernel is commonly used to denote the part of the `OS` that is mandatory and common to all software.].
Advantages:

-   clear kernel interface enforces a more modular system structure
-   servers can use the mechanisms provided by the `MK` like ony other program, server malfunction is isolated
-   more flexible system, different `API`s, different servers can coexist
