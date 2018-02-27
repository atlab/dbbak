
default:
	@echo "usage: make install"

install:
	@echo "installing dbbak..."
	@[ ! -f "/etc/dbbak.cfg" ] \
	&& install -o root -g root -m 640 dbbak.cfg.in /etc/dbbak.cfg \
	|| ( \
		echo "note: merge /etc/dbbak.cfg.upgrade if needed!"; \
		install -o root -g root -m 644 dbbak.cfg.in /etc/dbbak.cfg.upgrade \
	)
	@install -o root -g root -m 755 dbbak /usr/local/bin/dbbak
	@install -o root -g root -m 755 dbbak.cron /usr/local/bin/dbbak.cron
	@echo "done."
