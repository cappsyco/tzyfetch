PREFIX = /usr

all:
	@echo Supported commands: \'make install\' or \'make uninstall\'.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p tzyfetch.sh $(DESTDIR)$(PREFIX)/bin/tzyfetch
	@chmod +x $(DESTDIR)$(PREFIX)/bin/tzyfetch

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/tzyfetch
