network
=======

`network` is a simple command line network manager for OpenBSD.

It can scan available wireless networks, join configured ones (including wired networks), manage OpenVPN connections and put the system in "airplane" mode by bringing down network interfaces.

It is also capable of setting custom DHCP hostnames and link layer addresses (MAC addresses) per network, for the privacy-minded.

By design, `network` doesn't automatically connect to known networks. You have to manually issue the connection command when you want to join a network.

See the man page for more information.

`network` is initially based on `wireless` (https://github.com/overrider/wireless) but was completely rewritten to add more functionalities.
