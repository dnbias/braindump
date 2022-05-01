+++
title = "Effective Editing"
author = ["Daniel Biasiotto"]
draft = false
+++

[Emacs]({{< relref "20200530210833-emacs.md" >}})

-   [Source](https://masteringemacs.org/article/effective-editing-movement)


## Fundamental Movement Keys {#fundamental-movement-keys}

-   `C-n`
-   `C-p`
-   `C-f`
-   `C-b`

Insert newline at the end of the buffer:

<div class="code">

(setq next-line-add-newlines t)

</div>


## Extended Movement {#extended-movement}


### Word {#word}

Same as _Fundamental_ but prefix `M-`


### Paragraph {#paragraph}

-   `M-e`
-   `M-a`


### Sentence {#sentence}


### Scrolling {#scrolling}

-   `C-v` - down
-   `M-v` - up


### Buffer {#buffer}

These leave a mark, jump to the mark with `C-u C-SPC` (on marks see [Fixing the mark commands]({{< relref "20211014140914-fixing_the_mark_commands.md" >}}))


## Advanced Movement {#advanced-movement}


### s-Expression {#s-expression}

Or Balanced-Expression

-   `C-M-f`
-   `C-M-b`


### ISearch {#isearch}

-   `C-s`
-   `C-s C-s`
    -   repeats last query
-   `M-s w`
    -   fuzzy finds matches
-   `M-m`
-   back to indentation


### Defun {#defun}

-   `C-M-a`
-   `C-M-e`