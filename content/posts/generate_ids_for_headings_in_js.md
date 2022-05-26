+++
title = "Generate IDs for headings in JS"
author = ["Daniel Biasiotto"]
date = 2022-05-13T18:58:00+02:00
tags = ["til"]
draft = false
+++

Source: <https://css-tricks.com/on-adding-ids-to-headers/>

```javascript
// Adjust this for targetting the headers important to have IDs
const $headers = $(".article-content > h2");

$headers.each((i, el) => {
  const $el = $(el);

  // Probably a flexbox layout style page
  if ($el.has("a").length != 0) {
    return;
  }

  let idToLink = "";

  if ($el.attr("id") === undefined) {
    // give it ID
    idToLink = "header-id-" + i;
    $el.attr("id", idToLink);
  } else {
    // already has ID
    idToLink = $el.attr("id");
  }
});
```