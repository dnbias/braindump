+++
title = "Knowledge Discovery & Data Mining"
author = ["Daniel Biasiotto"]
date = 2023-02-27T10:53:00+01:00
tags = ["erasmus", "university", "compsci", "master"]
draft = false
+++

-   [Bike Sharing Dataset]({{< relref "bike_sharing_dataset.md" >}})


## Cycle of Analytics {#cycle-of-analytics}


### Preprocessing {#preprocessing}

-   data transformation
-   data reduction
    -   in **big data** situation it is wise to choose a subset of the data to query.
    -   reduce attributes or data
    -   different strategies
        -   **dimensionality reduction**
        -   **numerosity reduction**
            -   sampling
                -   random selection, performance might suffer because of skew in the data
                -   stratified sampling (cluster)
-   cleaning of data
-   integration of data
    -   **assumption**: the data we have is incomplete
-   data privacy concerns have to be considered

To accomplish this you can use visualizations, ask a domain expert.

**NB** there is no straightforward way to do all this, it takes intelligent thought.

The first goal is to arrive to a **clean and complete dataset**, one that fulfills the requirements.


### Interpretation {#interpretation}

Statistics is not everything, the data experts/domain experts need to interpret the information the `ML` application produces.

From the novelties you extract from the data you take **action** based on them.


### Visualization {#visualization}


### Anonymity {#anonymity}

See [k-Anonymity: A Model for Protecting Privacy]({{< relref "k_anonymity_a_model_for_protecting_privacy.md" >}})

Privacy concerns are important to consider when studying datasets, personal information should not be exposed or even used.

We have to define security classes or accessibility control systems.

-   a matrix \\(M(i,j)\\) which specifies \\(\\{Access, Update, Select\\}\\) for examples
    -   where \\(i\\) is an object (database views) and \\(j\\) is a subject
-   classes can be `Strictly Confidential` &gt; `Confidential` &gt; `Uncritical` and users are assigned one of these

Even sanitized data can still be _critical_ not for its contents per-se but for the possibility of being combined with other sources.

To solve this we can **generalize** the data. To do this we need the data to have some kind of hierarchy, either assumed or defined.

The approach is to use

1.  \\(k\\)-anonymity
    -   generalisation and suppression of data values
    -   find equivalence classes that contain \\(\geq k\\) records
    -   kinds of attributes
        -   _uncritical data_ is not considered when constructing these classes
        -   _non-sensitive data_ or _quasi-identifier_ are to be combined and generalized
        -   _sensitive data_ has to be published
    -   Samarati's approach[<s-approach> Defined in: [k-Anonymous Data Mining: A Survey]({{< relref "k_anonymous_data_mining_a_survey.md" >}})]:
        -   different nodes indicate a combination of levels of generalization in each attribute
        -   starting by the lowest node, the most specific, going up the data is generalized
        -   _height_ is defined to the number of steps in the graph needed to traverse from the bottom to the top
        -   start at level \\[\lfloor\sqrt{\text{height}}\rfloor\\]
2.  \\(l\\)-diversity[<diversity> Defined in: [l-Diversity: Privacy Beyond k-Anonymity]({{< relref "l_diversity_privacy_beyond_k_anonymity.md" >}})]
    -   homogeneity in the sensitive attribute is not desirable as it offers some possible privacy exploits
    -   \\(l\\) number of minimum <span class="underline">different sensitive data values</span> in an _equivalence class_
3.  \\(t\\)-closeness
    -   \\(t\\) measures the how similar the individual class distribution is against the total distribution, again the minimum value
    -   higher is better again
    -   **Earth-Mover distance** is one of the measures used


## Machine Learning {#machine-learning}

-   life cycle of a `ML` systems
-   each cycle brings a different level of bias into the system
    -   historical, in the collected data there can be missing information that is representative of the world today and wasn't in the past
    -   representation
    -   measurement
    -   aggregation
    -   learning
    -   evaluation
    -   deployment


### Association Discovery {#association-discovery}


### Sequential Pattern Mining {#sequential-pattern-mining}


### Classification {#classification}

-   supervised, training data accompanied by labels

2 steps

-   model construction w/ training data
-   model usage for future predictions
    -   **accuracy is estimated**
        -   _accuracy_ based on **test set**
            -   accuracy may be biased be dependencies between an attribute and the label
        -   a test set used to select models is called a **validation set**


#### Support Vector Machines {#support-vector-machines}


#### Decision Trees {#decision-trees}

Induction based approach, usually goes until stop condition is reached, can be a minimum purity, number of levels.
To decide the condition on the split we use criteria like **entropy** from Information Theory.[<entropy> see [Entropy]({{< relref "entropy.md" >}})]


### Clustering {#clustering}

-   unsupervised
