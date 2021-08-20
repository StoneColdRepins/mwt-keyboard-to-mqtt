PKGNAME=mwt_keyboard_to_mqtt
PREFIX=/usr
INSTALL=install
INSTALL_PROGRAM=$(INSTALL) -m 755
INSTALL_DATA=$(INSTALL) -m 644

bindir=$(DESTDIR)$(PREFIX)/bin
sharedir=$(DESTDIR)$(PREFIX)/share
confdir=$(DESTDIR)/etc/$(PKGNAME)
libdir=$(DESTDIR)$(PREFIX)/lib/python3/dist-packages/$(PKGNAME)
systemddir=$(DESTDIR)/lib/systemd/system

.PHONY: install uninstall

install:

	# install executables
	mkdir -p $(bindir)
	$(INSTALL_PROGRAM) mwt_keyboard_to_mqtt_device_handler $(bindir)/

	# install library / package
	mkdir -p $(libdir)/
	$(INSTALL_DATA) mwt_keyboard_to_mqtt/__init__.py $(libdir)/__init__.py
	$(INSTALL_DATA) mwt_keyboard_to_mqtt/config.py $(libdir)/config.py
	$(INSTALL_DATA) mwt_keyboard_to_mqtt/mqtt.py $(libdir)/mqtt.py
	$(INSTALL_DATA) mwt_keyboard_to_mqtt/static.py $(libdir)/static.py

	# install config file
	mkdir -p $(confdir)/
	$(INSTALL_DATA) config.json $(confdir)/config.json

	# install systemd unit files
	$(INSTALL_DATA) systemd/mwt-keyboard-to-mqtt-device-handler.service $(systemddir)/
	systemctl enable mwt-keyboard-to-mqtt-device-handler.service
	$(INSTALL_DATA) systemd/mwt-keyboard-to-mqtt.target $(systemddir)/
	systemctl daemon-reload
	systemctl start mwt-keyboard-to-mqtt-device-handler.service

	# install executables
	mkdir -p $(sharedir)/licenses/
	$(INSTALL_DATA) LICENSE $(sharedir)/licenses/$(PKGNAME)
	
uninstall:

	# uninstall executables
	rm -f $(bindir)/mwt_keyboard_to_mqtt_handler
	
	# uninstall library / package
	rm -f $(libdir)/__init__.py
	rm -f $(libdir)/config.py
	rm -f $(libdir)/mqtt.py
	rm -f $(libdir)/static.py

	# uninstall systemd unit files
	systemctl disable mwt-keyboard-to-mqtt-device-handler.service
	rm -f $(systemddir)/mwt-keyboard-to-mqtt-device-handler.service
	systemctl disable mwt-keyboard-to-mqtt.target
	rm -f $(systemddir)/mwt-keyboard-to-mqtt.target
	systemctl daemon-reload

	# uninstall executables
	rm -f $(sharedir)/licenses/$(PKGNAME)
	

