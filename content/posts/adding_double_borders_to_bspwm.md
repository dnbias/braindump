+++
title = "Adding double borders to bspwm"
author = ["Daniel Biasiotto"]
date = 2022-05-12T20:30:00+02:00
tags = ["til"]
draft = false
+++

This snippet adds double borders to bspwm's windows

```bash
#!/bin/sh
#
#   double borders
#
#. "${HOME}/.cache/wal/colors.sh"
outer='0x201515'   # outer
inner1='0xFDB057'  # focused
inner2='0xBA430C'  # normal

targets() {
	case $1 in
		focused) bspc query -N -n .local.focused.\!fullscreen;;
		normal)  bspc query -N -n .local.\!focused.\!fullscreen;;
		active) bspc query -N -n .active.\!focused.\!fullscreen
	esac
}

draw() { chwb2 -I "$i" -O "$o" -i "2" -o "10" $@ 2> /dev/null; }

# initial draw, and then subscribe to events
{ echo; bspc subscribe node_geometry node_focus; } |
	while read -r _; do
		i=$inner1 o=$outer draw "$(targets focused)"
		i=$inner2 o=$outer draw "$(targets  normal)"
		i=$inner2 o=$outer draw "$(targets  active)"
	done
```

Just add this to a file `borders` and make it executable with
`$ chmod +x borders`

Call it in `bspwmrc` with
`./borders &`
