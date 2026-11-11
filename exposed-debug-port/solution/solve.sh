#!/bin/sh
# Reference solution (teachers only).
set -eu
pkill -f 'httpd -p 9090' || kill "$(netstat -tlnp 2>/dev/null | awk '/:9090 /{split($7, p, "/"); print p[1]}')"
mkdir -p /tmp/private
mv /tmp/www/backup.sql /tmp/private/
