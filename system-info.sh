#!/bin/bash

OUTPUT="/root/system_info.txt"

{
    echo "===== OS Release Information ====="
    cat /etc/*release 2>/dev/null

    echo -e "\n===== Installed Packages ====="
    if command -v rpm &>/dev/null; then
        rpm -qa
    elif command -v dpkg &>/dev/null; then
        dpkg --list
    fi

    echo -e "\n===== Disk Usage ====="
    df -h

    echo -e "\n===== Memory Usage ====="
    free -h

    echo -e "\n===== Systemd Services ====="
    systemctl list-units --type=service --all 2>/dev/null

} > "$OUTPUT"

chmod 600 "$OUTPUT"
