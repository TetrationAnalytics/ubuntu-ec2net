DESTDIR ?= /
VERSION = 1.0

.PHONY: dist
dist:
	mkdir -p build/etc/udev/rules.d/
	mkdir -p build/etc/dhcp/dhclient-exit-hooks.d/
	mkdir -p build/etc/network/
	DEST=build make install
	tar -C build -czf dist.tgz .
	fpm -s tar -t deb -n ec2-net-utils -v $(VERSION) --after-install postinstall.sh dist.tgz

.PHONY: modes
modes:
	chmod 644 53-ec2-network-interfaces.rules
	chmod 644 75-persistent-net-generator.rules
	chmod 644 ec2dhcp
	chmod 644 ec2net-functions
	chmod 755 ec2net.hotplug

.PHONY: install
install: modes
	cp -a 53-ec2-network-interfaces.rules $(DEST)/etc/udev/rules.d/
	cp -a 75-persistent-net-generator.rules $(DEST)/etc/udev/rules.d/
	cp -a ec2dhcp $(DEST)/etc/dhcp/dhclient-exit-hooks.d/
	cp -a ec2net-functions $(DEST)/etc/network/
	cp -a ec2net.hotplug $(DEST)/etc/network/

.PHONY: clean
clean:
	rm -rf build/
	rm -f *.deb
