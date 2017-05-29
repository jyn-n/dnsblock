DESTDIR ?= /

CAT ?= cat
RM ?= rm -f
SH ?= sh

name = dnsblock
hosts = someonewhocares

all: dnsmasq

install: blocklist dnsmasq
	mkdir -p $(DESTDIR)etc/$(name)
	install -m 0644 blocklist $(DESTDIR)etc/$(name)
	install -m 0644 dnsmasq $(DESTDIR)etc/$(name)

check:

dnsmasq: blocklist
	$(SH) make_dnsmasq.sh $@ $<

blocklist: $(foreach f,$(hosts),$f.blocklist)
	$(CAT) $< > $@

%.blocklist: %.dl
	$(SH) make_list.sh $@ $<

%.dl:
	$(SH) update_dl_file.sh $@

clean:
	$(RM) $(foreach f,$(hosts),$f.blocklist $f.dl)
	$(RM) blocklist
	$(RM) dnsmasq

.PHONY: install check clean
.PRECIOUS: %.dl
