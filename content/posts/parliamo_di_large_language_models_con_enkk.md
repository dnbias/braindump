+++
title = "Parliamo di Large Language Models con Enkk"
author = ["Daniel Biasiotto"]
date = 2023-12-21T06:16:00+01:00
tags = ["video", "compsci", "ai", "llm"]
draft = false
+++

-   Source: <https://www.youtube.com/watch?v=zNLEdfZlcQI>
-   Channel: Datapizza
-   Related: [AI]({{< relref "20210606005210-artificial_intelligence.md" >}}), [LLM]({{< relref "llm.md" >}}), [Gemini]({{< relref "gemini.md" >}})


## Notes {#notes}

-   data leakage from the test-sets into LLM training
    -   this skews the benchmarks
-   Gemini
    -   benchmarks w/ `MMLU`
        -   multiple choice tests are entirely different from human interaction and the way these models are used
        -   _uncertainty-routed chain-of-thought_
        -   `CoT@32`
            -   the question is asked N times and the majority wins
    -   chain-of-thought
        -   ask the model to generate more text, steps
        -   the steps are sharper and the output gets more accurate
        -   could be N-shot or Zero-shot
-   leader-board benchmark
    -   users vote for winner in an anonymous match between models for a prompt
    -   elo system
-   what are these systems for:
    -   **supervised data transformation**
