+++
title = "Compilers: Principles Techniques and Tools"
author = ["Aho", "Lam", "Sethi", "Ullman"]
draft = false
+++

A Compiler reads a program in a Source Language and translates it in a target language
![](~/Pictures/screenshots/compiler.png)

-   Compiler
    translates
-   Linker
    resolves external mamory addresses
-   Loader
    puts together object files into memory


## Compiler {#compiler}

{{< figure src="~/Pictures/screenshots/compilerProcess.png" >}}


### Analysis {#analysis}


#### Lexical analysis | Scanning {#lexical-analysis-scanning}

The `Lexer` groups character, the `Lexical Analyzer` outputs Tokens for each Lexem. The token are then used by the `Syntax Analyzer` to get information from the `symbol-table`

<!--list-separator-->

-  Lexemes

    Meaningful groups of characters

<!--list-separator-->

-  Tokens

    &lt;token-name,attribute-value&gt;


### Synthesis {#synthesis}
