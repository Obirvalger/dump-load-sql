#!/bin/sh -eu

user_services=~/.local/share/systemd/user
system_services=/etc/systemd/system

if basename "$0" | grep -q '^install'; then
    install=1
else
    install=
fi

if [ "${1-}" = --user ]; then
    user=--user
    services="$user_services"
else
    user=
    services="$system_services"
fi

if [ -n "$install" ]; then
    mkdir -p "$services"
    sed "s|\$CURRENT_DIR|$PWD|" < dump-sql.service > "$services/dump-sql.service"
    cp dump-sql.timer -t "$services"
    systemctl $user enable --now dump-sql.timer
else
    systemctl $user disable --now dump-sql.timer ||:
    rm "$services/dump-sql.service" "$services/dump-sql.timer" ||:
fi
