+++
title = "Italian Projective Dependency Parser"
author = ["Daniel Biasiotto"]
date = 2024-06-06T19:59:00+02:00
tags = ["python", "ai", "project", "university"]
draft = false
+++

-   Related: [Parsing English in 500 Lines of Python]({{< relref "parsing_english_in_500_lines_of_python.md" >}}), [NLP]({{< relref "nlp.md" >}}), [TLN]({{< relref "tecnologie_del_linguaggio_naturale.md" >}})
-   Repo: <https://github.com/dnbias/dependency-parser-it>
-   ISDT: <https://github.com/UniversalDependencies/UD_Italian-ISDT>
    -   used commit `5bb0bf3`

Run with:

```bash
python parser.py model_dir wsj_train.dep wsj_train.pos wsj_test.dep
```

Obtain `wsj_train.dep`[^fn:1]:

```bash
for f in $1/*.mrg; do
    echo $f
    grep -v CODE $f > "$f.2"
    out="$f.dep"
    java -mx800m -cp "$scriptdir/*:" edu.stanford.nlp.trees.EnglishGrammaticalStructure \
-treeFile "$f.2" -basic -makeCopulaHead -conllx > $out
done
```

Convert to `conll-x` format[^fn:2]:

```bash
perl conllu_to_conllx.pl < file.conllu > file.conll
```

[^fn:1]: <https://explosion.ai/blog/parsing-english-in-python>
[^fn:2]: <https://github.com/UniversalDependencies/tools>
