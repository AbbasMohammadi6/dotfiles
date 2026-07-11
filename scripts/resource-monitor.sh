#!/usr/bin/env bash

# Resource monitor: warns via notify-send when RAM or CPU cross thresholds.

RAM_THRESHOLD=85      # percent
CPU_THRESHOLD=85      # percent
INTERVAL=5            # seconds between checks
COOLDOWN=60           # seconds before re-notifying for the same resource

last_ram_notify=0
last_cpu_notify=0

now() { date +%s; }

get_ram_usage() {
    read -r total used < <(free | awk '/^Mem:/ {print $2, $3}')
    (( total == 0 )) && { echo 0; return; }
    echo $(( used * 100 / total ))
}

get_cpu_usage() {
    read -r _ u1 n1 s1 i1 w1 x1 y1 _ < /proc/stat
    local idle1=$(( i1 + w1 ))
    local total1=$(( u1 + n1 + s1 + i1 + w1 + x1 + y1 ))

    sleep 1

    read -r _ u2 n2 s2 i2 w2 x2 y2 _ < /proc/stat
    local idle2=$(( i2 + w2 ))
    local total2=$(( u2 + n2 + s2 + i2 + w2 + x2 + y2 ))

    local dtotal=$(( total2 - total1 ))
    local didle=$(( idle2 - idle1 ))

    (( dtotal == 0 )) && { echo 0; return; }
    echo $(( (dtotal - didle) * 100 / dtotal ))
}

while true; do
    ram=$(get_ram_usage)
    cpu=$(get_cpu_usage)
    t=$(now)

    if (( ram >= RAM_THRESHOLD )) && (( t - last_ram_notify >= COOLDOWN )); then
        notify-send -u critical "High RAM usage" "RAM at ${ram}%"
        last_ram_notify=$t
    fi

    if (( cpu >= CPU_THRESHOLD )) && (( t - last_cpu_notify >= COOLDOWN )); then
        notify-send -u critical "High CPU usage" "CPU at ${cpu}%"
        last_cpu_notify=$t
    fi

    sleep "$INTERVAL"
done
