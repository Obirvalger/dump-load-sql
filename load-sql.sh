#!/bin/sh -eu

secs="$(date +%s)"

systemctl stop postgresql ||:
mv /var/lib/pgsql/data{,.bak"$secs"}
/etc/init.d/postgresql initdb
systemctl start postgresql
xz -d < dump.sql.xz | psql -U postgres
