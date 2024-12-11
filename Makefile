NAME = tzyfetch
INSTALL_PATH = /usr/local/bin

all:
	@echo Supported commands: \'make install\' or \'make uninstall\'.

install:
	install -m 755 $(NAME).sh $(INSTALL_PATH)/$(NAME)

uninstall:
	rm -f $(INSTALL_PATH)/tzyfetch

.PHONY: all install uninstall
.SILENT: all install uninstall