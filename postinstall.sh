#!/bin/sh

chown root:root /etc/udev/rules.d/53-ec2-network-interfaces.rules
chown root:root /etc/udev/rules.d/75-persistent-net-generator.rules
chown root:root /etc/dhcp/dhclient-exit-hooks.d/ec2dhcp
chown root:root /etc/network/ec2net-functions
chown root:root /etc/network/ec2net.hotplug
