+++
title = "Sharing Video and Audio between Machines"
date = 2022-07-08T23:05:00+02:00
tags = ["til", "sysadmin"]
draft = false
+++

Wanted to use laptop as second monitor for my main linux machine.
Possible solutions:

-   [Barrier](https://github.com/debauchee/barrier).

Managed to get it working with some tinkering.

-   needed to create the file `TrustedServers.txt` on the client:

<!--listend-->

```bash
scp Local.txt dnbias@sky:TrustedServers.txt
```

For this to work the `sshd` on the client (`dnbias@sky`) must be running ofc.

Then, server:

```bash
barriers -f --no-tray --name ray --disable-client-cert-checking -c /home/dnbias/.config/barrier/barrier.conf --address 192.XXX.X.XX:24800
```

client:

```bash
barrierc -f --no-tray --name sky 192.XXX.X.XX:24800
```

-   [x2vnc](http://fredrik.hubbe.net/x2vnc.html)
-   [x2go](https://wiki.archlinux.org/title/X2Go)

For audio see this [issue](https://github.com/debauchee/barrier/issues/281), using `ffmpeg` to stream audio from client to server.
Basically:

```bash
ffmpeg -re -f pulse -ac 2 -i default -f rtp rtp://server:1234
```

`server` is the `barrier` server ip, `pulse` can be substitued by `alsa`.
Copy the `SDP` output on a file on the server-side, then run the following to listen to the stream:

```bash
./ffplay -protocol_whitelist 'rtp,file,udp' .\sdp_file
```

Another alternative is to run

```bash
ssh -X desktop_hostname
```

from the slave/client, then you can run apps running on the server and displayed on the client.
