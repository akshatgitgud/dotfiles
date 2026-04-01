#!/bin/bash

#!/bin/bash

# Get WiFi list (clean)
wifi_list=$(nmcli -t -f IN-USE,SSID,SECURITY dev wifi list | sed '/^$/d')

# Show in rofi
chosen=$(echo "$wifi_list" | rofi -dmenu -p "WiFi")

# Extract SSID
ssid=$(echo "$chosen" | cut -d':' -f2)

# If nothing selected → exit
[ -z "$ssid" ] && exit

# Check if secured
security=$(echo "$chosen" | cut -d':' -f3)

# Connect
if [ "$security" = "--" ] || [ -z "$security" ]; then
    nmcli dev wifi connect "$ssid"
else
    password=$(rofi -dmenu -password -p "Password")
    [ -z "$password" ] && exit
    nmcli dev wifi connect "$ssid" password "$password"
fi
