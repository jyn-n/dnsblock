DESTDIR ?= /

CMDSEP ?= \

CAT ?= cat
RM ?= rm -f
SH ?= sh

name = dnsblock
hosts = someonewhocares yoyo kadhosts badd_boyz sbc steven_black

all: dnsmasq

install: blocklist dnsmasq
	mkdir -p $(DESTDIR)etc/$(name)
	install -m 0644 blocklist $(DESTDIR)etc/$(name)
	install -m 0644 dnsmasq $(DESTDIR)etc/$(name)

check:

dnsmasq: blocklist
	$(SH) make_dnsmasq.sh $@ $<

blocklist: $(foreach f,$(hosts),$f.dl)
	$(CAT) $^ | sort | uniq > $@

%.dl:
	$(SH) update_dl_file.sh $@

%.dl.force:
	$(SH) update_dl_file.sh $(@:.force=)

fetch_lists: $(foreach f,$(hosts),$f.dl.force)

update: fetch_lists all

clean:
	$(RM) $(foreach f,$(hosts),$f.dl)
	$(RM) blocklist
	$(RM) dnsmasq

.PHONY: install check clean %.force update
.PRECIOUS: %.dl
