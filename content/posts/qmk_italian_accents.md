+++
title = "QMK Italian accents"
author = ["Daniel Biasiotto"]
date = 2022-05-27T00:40:00+02:00
tags = ["til"]
draft = false
+++

See [this keymap](https://github.com/umbacos/qmk_firmware/blob/master/keyboards/planck/keymaps/umbacos2x2u/keymap.c), in particular:

```text
[_ACCENT] = LAYOUT_planck_2x2u(
    _______, IT_EURO, IT_AT, IT_EACC, _______, _______, _______, IT_UACC, IT_IACC, IT_OACC, _______, _______,  \
    _______, IT_AACC, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,   \
    KC_LSFT, _______, _______, _______, _______, _______, _______, _______, IT_SCLN, IT_COLN, _______, _______,   \
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______ \
),
```