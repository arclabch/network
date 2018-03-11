# network
# See LICENSE file for copyright and license details.

include config.mk

all:
	@echo "Usage:	make install"
	@echo "		make update"
	@echo "		make uninstall"

install:
	@echo "Installing executable file to ${DESTDIR}${PREFIX}/bin"
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@sed "s/VERSION/${VERSION}/g" <network >${DESTDIR}${PREFIX}/bin/network
	@chmod 755 ${DESTDIR}${PREFIX}/bin/network
	@echo "Installing configuration file to /etc/networks.conf"
	@mkdir -p ${DESTDIR}/etc
	@cp -f networks.conf /etc/networks.conf
	@chmod 640 /etc/networks.conf
	@chown root:wheel /etc/networks.conf
	@echo "Installing manual pages to ${DESTDIR}${MANPREFIX}"
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man5
	@cp -f network.1 ${DESTDIR}${MANPREFIX}/man1/network.1
	@cp -f networks.conf.5 ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/network.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@echo "Installation complete. Now adapt /etc/networks.conf to your needs."

update:
	@echo "Updating executable file to ${DESTDIR}${PREFIX}/bin"
	@sed "s/VERSION/${VERSION}/g" <network >${DESTDIR}${PREFIX}/bin/network
	@echo "Updating manual pages to ${DESTDIR}${MANPREFIX}"
	@cp -f network.1 ${DESTDIR}${MANPREFIX}/man1/network.1
	@cp -f networks.conf.5 ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/network.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@echo "Update complete."
	@echo "WARNING: the configuration syntax might have changed, don't"
	@echo "forget to review the sample networks.conf in this directory."

uninstall:
	@echo "Removing executable file from ${DESTDIR}${PREFIX}/bin"
	@rm -f ${DESTDIR}${PREFIX}/bin/network
	@echo "Removing manual pages from ${DESTDIR}${MANPREFIX}"
	@rm -f ${DESTDIR}${MANPREFIX}/man1/network.1
	@rm -f ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@echo "Please manually remove /etc/networks.conf."

.PHONY: all install uninstall
