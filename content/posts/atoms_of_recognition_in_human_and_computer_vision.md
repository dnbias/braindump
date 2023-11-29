+++
title = "Atoms of recognition in human and computer vision"
author = ["Daniel Biasiotto"]
date = 2023-01-08T11:05:00+01:00
tags = ["paper"]
draft = false
+++

-   Source: <http://dx.doi.org/10.1073/pnas.1513198113>
-   Author: [Shimon Ullman]({{< relref "shimon_ullman.md" >}}), Assif, Fetaya, Harari
-   Related: [Convolutional Neural Network]({{< relref "convolutional_neural_network.md" >}}), [Neural Network]({{< relref "20210606215832-neural_network.md" >}}), [Computer Vision]({{< relref "computer_vision.md" >}})


## Claim {#claim}

Introducing and using minimal recognizable images shows that the human visual system uses features and processes that are not used by current models and that are critical for recognition.


## Notes {#notes}

> A `MIRC` is an image patch that can be reliably recognized by human observers and which is minimal in that further reduction in either size or resolution makes the patch unrecognizable.

-   **minimal recognizable images**
    -   a minimal change in the image can have drastic effect on the recognition
        -   this identifies crucial features
        -   _phase transition_ phenomenon
-   **Mi**nimal **r**ecognizable **c**onfigurations (`MIRCs`)
    -   the task is computationally difficult as each one is non-redundant
        -   requires effective use of available information

-   training on full-object images
    -   AP 0.07 &plusmn; 0.10
-   training on `MIRC`
    -   AP 0.74 &plusmn; 0.21

-   results indicate the human visual system uses features and processes that current models do not
    -   the sharp drop in recognition at the `MIRC` level indicate similar visual representations in humans
        -   the transition occurs for the same images
    -   feed-forward or top-down processes (currently missing from the `FF` models)?
