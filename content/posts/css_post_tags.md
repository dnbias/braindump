+++
title = "CSS Post Tags"
author = ["Daniel Biasiotto"]
date = 2022-05-02T03:59:00+02:00
draft = false
+++

```css
.tags a {
    display: inline-block;
    height: 24px;
    line-height: 24px;
    position: relative;
    margin: 0 16px 8px 0;
    padding: 0 10px 0 12px;
    background: #777;
    -webkit-border-bottom-right-radius: 3px;
    border-bottom-right-radius: 3px;
    -webkit-border-top-right-radius: 3px;
    border-top-right-radius: 3px;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
    box-shadow: 0 1px 2px rgba(0,0,0,0.2);
    color: #fff;
    font-size: 12px;
    font-family: "Lucida Grande","Lucida Sans Unicode",Verdana,sans-serif;
    text-decoration: none;
    text-shadow: 0 1px 2px rgba(0,0,0,0.2);
    font-weight: bold;
}

.tags a:before {
    content: "";
    position: absolute;
    top:0;
    left: -12px;
    width: 0;
    height: 0;
    border-color: transparent #3243A5 transparent transparent;
    border-style: solid;
    border-width: 12px 12px 12px 0;
    }

.tags a:after {
    content: "";
    position: absolute;
    top: 10px;
    left: 1px;
    float: left;
    width: 5px;
    height: 5px;
    -webkit-border-radius: 50%;
    border-radius: 50%;
    background: #fff;
    -webkit-box-shadow: -1px -1px 2px rgba(0,0,0,0.4);
    box-shadow: -1px -1px 2px rgba(0,0,0,0.4);
    }
```
