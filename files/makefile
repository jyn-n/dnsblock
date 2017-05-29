DESTDIR ?= /
name = dnsblock

install:
	mkdir -p $(DESTDIR)etc/$(name)
	install -m 0644 blocklist $(DESTDIR)etc/$(name)
	install -m 0644 dnsmasq $(DESTDIR)etc/$(name)

check:

.PHONY: install check
