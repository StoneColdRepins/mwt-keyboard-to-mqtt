

# mwt-keyboard-to-mqtt 

A service that makes usb keyboard devies available on the network for IoT use.

This project was cloned from "IoT Barcode Scanner" 
Thank you so much to xengineering on the code that has been developed.

I need it to detect device connects and disconnects without breaking the loop control and run as a permanent MQTT service with status handling

This is on of my first attempts to code in python so if you see glarinf error let me know as i hacked this code together

Fell free to pull and adjust to your requirements



## Usage

1. Installation
    ```
        sudo pip3 install paho-mqtt evdev
        git clone https://github.com/stonecoldrepins/mwt-keyboard-to-mqtt.git
        cd mwt-keyboard-to-mqtt
        sudo make install

        python3 evdev-list.py
    ```
2. Configure ```/etc/mwt_keyboard_to_mqtt/config.json```
3. Run 
    ```
        sudo systemctl enable --now mwt-keyboard-to-mqtt.target
        sudo systemctl start --now mwt-keyboard-to-mqtt.target
        sudo systemctl status --now mwt-keyboard-to-mqtt.target
        sudo systemctl stop --now mwt-keyboard-to-mqtt.target
        sudo systemctl disable --now mwt-keyboard-to-mqtt.target

        sudo systemctl enable mwt-keyboard-to-mqtt-device-handler.service
        sudo systemctl start mwt-keyboard-to-mqtt-device-handler.service
        sudo systemctl status mwt-keyboard-to-mqtt-device-handler.service
        sudo systemctl stop mwt-keyboard-to-mqtt-device-handler.service
        sudo systemctl disable mwt-keyboard-to-mqtt-device-handler.service

        sudo systemctl status --now mwt-keyboard-to-mqtt.target
        sudo systemctl status mwt-keyboard-to-mqtt-device-handler.service
    ```
5. Listen to MQTT output (e.g. with ```mosquitto_sub -h localhost -t "mwts.co.za/mwt_keyboard_to_mqtt"```)




## Milestones




## Dependencies

- ```python-paho-mqtt```
- ```python-evdev```


## Links

- [cloned from xengineering/iot-barcode-scanner ](https://github.com/xengineering/iot-barcode-scanner)
