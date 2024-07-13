+++
title = "sklearn"
author = ["Daniel Biasiotto"]
date = 2022-10-20T09:35:00+02:00
tags = ["ml", "python"]
draft = false
+++

## Metrics {#metrics}

```python
# print some metrics results
from sklearn.metrics import accuracy_score
from sklearn.metrics import f1_score
acc_score = accuracy_score(iris_y_test, predicted_y_test)
print("Accuracy score: "+ str(acc_score))
f1=f1_score(iris_y_test, predicted_y_test, average='macro')
print("F1 score: "+str(f1))
```

From the [docs](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.f1_score.html):

```text
sklearn.metrics.f1_score(y_true, y_pred, *, labels=None, pos_label=1, average='binary', sample_weight=None, zero_division='warn')
```

> Compute the F1 score, also known as balanced F-score or F-measure.
>
> The F1 score can be interpreted as a harmonic mean of the precision and recall, where an F1 score reaches its best value at 1 and worst score at 0. The relative contribution of precision and recall to the F1 score are equal. The formula for the F1 score is:
>
> F1 = 2 \* (precision \* recall) / (precision + recall)
>
> In the multi-class and multi-label case, this is the average of the F1 score of each class with weighting depending on the average parameter.


## Cross Validation {#cross-validation}

```python
from sklearn.datasets import load_iris
from sklearn.model_selection import cross_val_score # will be used to separate training and test
iris = load_iris()
clf = tree.DecisionTreeClassifier(criterion="entropy",random_state=300,min_samples_leaf=5,class_weight={0:1,1:1,2:1})
clf = clf.fit(iris.data, iris.target)
scores = cross_val_score(clf, iris.data, iris.target, cv=5) # score will be the accuracy
print(scores)
```
