#!/usr/bin/env bash
POLYBAR_SHELL=$(which bash)

until pgrep -x i3 >/dev/null; do
    sleep 0.5
done

# Terminate already running bar instances
pkill -x -9 polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.5; done

for bar in $(polybar -m|cut -d: -f1); do
    echo "Launching bar for output ${bar}"
    SHELL=$POLYBAR_SHELL polybar -r -q $bar &
done

if ! pgrep -x polybar >/dev/null; then
    echo "No configured bar found, launching default bar"
    SHELL=$POLYBAR_SHELL polybar -r -q default
fi

echo "Bars launched..."
