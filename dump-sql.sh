#!/bin/sh -eu

hour="$(date +%H)"

echo "$hour" > last-hour

pg_dumpall -U postgres | xz > "dump-$hour.sql.xz"
ln -sf "dump-$hour.sql.xz" dump.sql.xz
