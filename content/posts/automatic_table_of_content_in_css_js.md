+++
title = "Automatic Table of Content in CSS/JS"
date = 2022-05-13T18:48:00+02:00
tags = ["til"]
draft = false
+++

-   Source: <https://css-tricks.com/automatic-table-of-contents/>

<!--listend-->

```css
.table-of-contents {
  float: right;
  width: 40%;
  background: #eee;
  font-size: 0.8em;
  padding: 1em 2em;
  margin: 0 0 0.5em 0.5em;
}
.table-of-contents ul {
  padding: 0;
}
.table-of-contents li {
  margin: 0 0 0.25em 0;
}
.table-of-contents a {
  text-decoration: none;
}
.table-of-contents a:hover,
.table-of-contents a:active {
  text-decoration: underline;
}
```

```javascript
var ToC =
  "<nav role='navigation' class='table-of-contents'>" +
    "<h2>On this page:</h2>" +
    "<ul>";

var newLine, el, title, link;

$("article h3").each(function() {

  el = $(this);
  title = el.text();
  link = "#" + el.attr("id");

  newLine =
    "<li>" +
      "<a href='" + link + "'>" +
        title +
      "</a>" +
    "</li>";

  ToC += newLine;

});

ToC +=
   "</ul>" +
  "</nav>";

$(".all-questions").prepend(ToC);
```
