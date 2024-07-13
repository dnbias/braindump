+++
title = "From Python to Numpy"
author = ["Daniel Biasiotto"]
date = 2022-10-12T05:48:00+02:00
tags = ["book", "compsci", "python", "numpy", "ml"]
draft = false
+++

[Nicholas P. Rougier]({{< relref "nicholas_p_rougier.md" >}}), _From Python To Numpy_[^fn:1], 2017


## Introduction {#introduction}

<div class="source">

def random_walk_faster(n=1000):
    from itertools import accumulate

steps = random.choices([-1,+1], k=n)
return [0]+list(accumulate(steps))

walk = random_walk_faster(1000)

</div>

`accumulate([1,2,3,4,5]) --> 1 3 6 10 15`[^fn:2]

Without using loops and instead vectorizing the problem we get a 85% increase in performance.

<div class="source">

&gt;&gt;&gt; from tools import timeit
&gt;&gt;&gt; timeit("random_walk_faster(n=10000)", globals())
10 loops, best of 3: 2.21 msec per loop

</div>

Translating in `numpy` we get:

<div class="source">

def random_walk_fastest(n=1000):

steps = np.random.choice([-1,+1], n)
return np.cumsum(steps)

walk = random_walk_fastest(1000)

</div>

<div class="source">

&gt;&gt;&gt; from tools import timeit
&gt;&gt;&gt; timeit("random_walk_fastest(n=10000)", globals())
1000 loops, best of 3: 14 usec per loop

</div>


### Readability vs Speed {#readability-vs-speed}

The tradeoff for the massive speedups using `numpy` is often the readabily of the code: **comment your code!**

-   future-self will thank you


## Anatomy of an array {#anatomy-of-an-array}


## Code vectorization {#code-vectorization}


## Problem vectorization {#problem-vectorization}


## Custom vectorization {#custom-vectorization}


## Beyond Numpy {#beyond-numpy}

[^fn:1]: <https://www.labri.fr/perso/nrougier/from-python-to-numpy/>
[^fn:2]: <https://docs.python.org/3.6/library/itertools.html?highlight=accumulate#itertools.accumulate>
