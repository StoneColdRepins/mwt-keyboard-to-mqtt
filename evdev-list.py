import evdev

def main():
    try:
        print("")
        print("evdev-list : list devices")
        print("")
        print(f" {'Path'.ljust(20)}  {'phys'.ljust(35)}  {'name'.ljust(50)}  ")
        print(f" {'-'.ljust(20,'-')}----{'-'.ljust(35,'-')}--{'-'.ljust(50,'-')}--")
        devices = [evdev.InputDevice(path) for path in evdev.list_devices()]
        for device in devices:
            print(f" {device.path.ljust(20)}  {device.phys.ljust(35)}  {device.name.ljust(50)}  ")
        print("")
    except:
        pass

if __name__ == "__main__":
    main()