

"""Module to read the Configuration File for the Service"""


import sys
import json

from mwt_keyboard_to_mqtt.static import CONFIG_PATH


def get_config():
    """Read Config File and return it as Python Object"""

    try:
        with open(CONFIG_PATH, "r") as config_file:
            text = config_file.read()
    except FileNotFoundError:
        print("Config file does not exist.")
        sys.exit(1)

    data = json.loads(text)

    return data
