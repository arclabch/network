# network
# See LICENSE file for copyright and license details.

include config.mk

all: info

info:
	@echo "Nothing to build!"
	@echo "Just type \"make install\" as root."
	@echo "To uninstall, \"make uninstall\" as root."

install:
	@echo "Installing executable file to ${DESTDIR}${PREFIX}/bin"
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@sed "s/VERSION/${VERSION}/g" <network >${DESTDIR}${PREFIX}/bin/network
	@chmod 755 ${DESTDIR}${PREFIX}/bin/network
	@echo "Installing configuration file to /etc/networks.conf.sample"
	@mkdir -p ${DESTDIR}/etc
	@cp -f networks.conf /etc/networks.conf.sample
	@chmod 775 /etc/networks.conf.sample
	@chown root:wheel /etc/networks.conf.sample
	@echo "Installing manual pages to ${DESTDIR}${MANPREFIX}"
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man5
	@cp -f network.1 ${DESTDIR}${MANPREFIX}/man1/network.1
	@cp -f networks.conf.5 ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/network.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@echo "Installation complete. Now create /etc/networks.conf to your needs."

uninstall:
	@echo "Removing executable file from ${DESTDIR}${PREFIX}/bin"
	@rm -f ${DESTDIR}${PREFIX}/bin/network
	@echo "Removing manual pages from ${DESTDIR}${MANPREFIX}"
	@rm -f ${DESTDIR}${MANPREFIX}/man1/network.1
	@rm -f ${DESTDIR}${MANPREFIX}/man5/networks.conf.5
	@echo "Please manually remove /etc/networks.conf."

.PHONY: all info install uninstall
