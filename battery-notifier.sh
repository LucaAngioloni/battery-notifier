#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

icon_path="$MY_PATH/battery.png"

umask 077  # umask so that the tmp file created will only have rw permissions for only the user

# where the tmp file is saved
tmp_dir='/tmp/battery-notifier'
pwr_file="$tmp_dir/pwr_file"

mkdir -p "$tmp_dir"  # create tmp folder if it doesn't exist

new_pwr=$(pmset -g batt | grep -o "...%" | tr -d % | tr -d "\t")  # get the battery percentage status right now
status_pwr=$(pmset -g batt | grep -o "[A-z]*;" | tr -d ";" | tr -d "\n" | awk '{$1=$1};1')  # get the battery charging status (charging|discharging)

# if the tmp file exists read the contents, otherwise use new reading
if [ -e "$pwr_file" ]
then
    old_pwr=$(cat "$pwr_file")
else
    old_pwr="$new_pwr"
fi

echo $new_pwr > "$pwr_file"  # update tmp file with new battery percentage

# if the battery is charging and we just passed the 80% send notification.
if [ "$status_pwr" = "charging" ] && [ $(($new_pwr+0)) -ge 80 ] && [ $(($old_pwr+0)) -lt 80 ]
then
    terminal-notifier -title "Battery Status" -message "Battery sufficiently charged (80%)" -appIcon "$icon_path" -group "battery_pwr"
fi

# if the battery is charging and we just passed the 90% send notification.
if [ "$status_pwr" = "charging" ] && [ $(($new_pwr+0)) -ge 90 ] && [ $(($old_pwr+0)) -lt 90 ]
then
    terminal-notifier -title "Battery Status" -message "Battery sufficiently charged (90%)" -appIcon "$icon_path" -group "battery_pwr"
fi

# if the battery is charging and we just reached 100% send notification.
if [ "$status_pwr" = "charging" ] && [ $(($new_pwr+0)) -ge 100 ] && [ $(($old_pwr+0)) -lt 100 ]
then
    terminal-notifier -title "Battery Status" -message "Battery fully charged (100%)" -appIcon "$icon_path" -group "battery_pwr"
fi