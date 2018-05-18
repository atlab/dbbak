
ROOTUSER?=root
ROOTGROUP?=root

default:
	@echo "usage: make install"

install:
	@echo "installing dbbak..."
	@[ ! -f "/etc/dbbak.cfg" ] \
	&& install -o $(ROOTUSER) -g $(ROOTGROUP) -m 640 \
		dbbak.cfg.in /etc/dbbak.cfg \
	|| ( \
		echo "note: merge /etc/dbbak.cfg.upgrade if needed!"; \
		install -o $(ROOTUSER) -g $(ROOTGROUP) -m 644 \
			dbbak.cfg.in /etc/dbbak.cfg.upgrade \
	)
	@install -o $(ROOTUSER) -g $(ROOTGROUP) -m 755 \
		dbbak /usr/local/bin/dbbak
	@install -o $(ROOTUSER) -g $(ROOTGROUP) -m 755 \
		dbbak.cron /usr/local/bin/dbbak.cron
	@echo "done."
