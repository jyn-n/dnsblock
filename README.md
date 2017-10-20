# dnsblock

Dnsblock provides a list of advertising, shocking, tracking and otherwise harmful sites that may be brought to your computer via your distro's package manager. When used with dnsmasq, dnsblock does not interfere in any way with your local dns setup such as hosts file.

## Installation

### Arch Linux
 #### AUR
* install from the [AUR](https://aur.archlinux.org/packages/dnsblock-git/) 

#### From PKGBUILD
* `git clone https://github.com/jyn-n/dnsblock.git`
* `cd dnsblock/package` 
* `makepkg`
* Install the package using `pacman`


### Other Distros

* `git clone https://github.com/jyn-n/dnsblock.git`
* `cd dnsblock/files`
*  `make install`

## Usage

* install
* point dnsmasq to /etc/dnsblock/dnsmasq or use /etc/dnsblock/blocklist in any way you like

## Update Blocklists

To update the blocklist manually:
* `cd dnsblock/files`
* `make update`

## current list of blocklists included

* http://someonewhocares.org/hosts/zero/hosts
* http://pgl.yoyo.org/as/serverlist.php?mimetype=plaintext
* https://raw.githubusercontent.com/azet12/KADhosts/master/KADhosts.txt
* https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/hosts

