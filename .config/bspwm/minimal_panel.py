#!/bin/python3
import alsaaudio
import pyudev
import time

# decided to make this script event based in an effort to provide realtime
# updates but not waste battery/cycles polling for new information every 5
# seconds

def get_volume():
    master = alsaaudio.Mixer()
    if master.getmute()[0]:
        return "MM"
    return master.getvolume()[0]

def print_panel(bat):
    # look in /sys/class/power_supply/BAT0/ for more information
    #bat['POWER_SUPPLY_STATUS']          # 'Charging' or 'Discharging'
    #bat['POWER_SUPPLY_CAPACITY_LEVEL']  # 'Normal', other states maybe?
    #bat['POWER_SUPPLY_CAPACITY']        # battery level percentage
    print(
        "%{r}" + "bat: {}% | vol: {}% | {} ".format(
            bat['POWER_SUPPLY_CAPACITY'],
            get_volume(),
            time.strftime('%a %B %d  %H:%M'),
        ), flush=True
    )

def main():
    ctx = pyudev.Context()

    monitor = pyudev.Monitor.from_netlink(ctx)
    monitor.filter_by('power_supply')
    
    while True:
        sysfs_battery = pyudev.Devices.from_name(ctx, 'power_supply', 'BAT0')
        print_panel(sysfs_battery)
        time.sleep(3)

if __name__ == '__main__':
    main()
