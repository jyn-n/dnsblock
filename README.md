# dnsblock

Dnsblock provides a list of advertising, shocking, tracking and otherwise harmful sites that may be brought to your computer via your distro's package manager.

## installation

### archlinux

* cd package
* makepkg
* install via pacman
* point dnsmasq to /etc/dnsblock/dnsmasq or use /etc/dnsblock/blocklist in any way you like

### other

* cd files
* make install

## usage

* install
* point dnsmasq to /etc/dnsblock/dnsmasq or use /etc/dnsblock/blocklist in any way you like

## update

To update the blocklist manually:
* cd files
* make update

## current list of hosts that provide blocklists for this package:

* http://someonewhocares.org/hosts/zero/hosts
* http://pgl.yoyo.org/as/serverlist.php?mimetype=plaintext

