#!/bin/zsh
setopt BASH_REMATCH
bluetooth_info=$(bluetoothctl info)

bctl_regex='Battery Percentage:.*\(([0-9]{0,3})\)'

if [[ $bluetooth_info =~ $bctl_regex ]]; then

echo "${BASH_REMATCH[2]}%"

else
echo ""
fi

