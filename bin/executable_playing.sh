#!/bin/bash
SLEEP=15
while true; do
    for layout in t a A; do
        ~/bin/playing.py --layout ${layout}
        sleep $SLEEP
    done
done
