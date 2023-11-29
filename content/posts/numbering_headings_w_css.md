+++
title = "Numbering Headings w/ CSS"
date = 2022-05-02T03:33:00+02:00
draft = false
+++

```css
body {
    counter-reset: h2counter;
}
h1 {
    counter-reset: h2counter;
}
h2 {
    counter-reset: h3counter;
}
h2:before {
    content: counter(h2counter) ".\0000a0\0000a0";
    counter-increment: h2counter;
}
h3:before {
    content: counter(h2counter) "." counter(h3counter) ".\0000a0\0000a0";
    counter-increment: h3counter;
}
```

The odd characters are blanks.
