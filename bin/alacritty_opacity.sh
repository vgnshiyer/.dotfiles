#!/bin/bash

CONFIG_PATH="$HOME/.config/alacritty/alacritty.toml"
STEP=0.05
MIN_OPACITY=0.10
MAX_OPACITY=1.00

if [ ! -f "$CONFIG_PATH" ]; then
    echo "Configuration file not found at $CONFIG_PATH"
    exit 1
fi

current_opacity=$(grep 'opacity' "$CONFIG_PATH" | awk -F '= ' '{print $2}' | tr -d ' ')
new_opacity=$current_opacity

if [ "$1" == "up" ]; then
    new_opacity=$(echo "$current_opacity + $STEP" | bc)
elif [ "$1" == "down" ]; then
    new_opacity=$(echo "$current_opacity - $STEP" | bc)
else
    echo "Invalid argument. Use 'up' or 'down'."
    exit 1
fi

if (( $(echo "$new_opacity > $MAX_OPACITY" | bc -l) )); then
    new_opacity=$MAX_OPACITY
elif (( $(echo "$new_opacity < $MIN_OPACITY" | bc -l) )); then
    new_opacity=$MIN_OPACITY
fi

formatted_opacity=$(printf "%.2f" "$new_opacity")
sed -i "" "s/opacity = $current_opacity/opacity = $formatted_opacity/" "$CONFIG_PATH"

echo "Opacity updated to $formatted_opacity"

