#!/bin/sh
# Runs once when the instance starts, as UID 1000: a web server whose
# document root holds a database dump, and a forgotten debug server.
set -eu
mkdir -p /tmp/www /tmp/debug

cat > /tmp/www/index.html <<'HTML'
<!doctype html>
<title>Shop</title>
<h1>Welcome to the shop</h1>
<p>Everything must go.</p>
HTML
cat > /tmp/www/backup.sql <<'SQL'
CREATE TABLE users (id int, name text, password text);
INSERT INTO users VALUES (1, 'admin', 'Sup3rS3cret!');
SQL
printf 'DEBUG=true\nDB_PASSWORD=Sup3rS3cret!\nSESSION_KEY=8f14e45fceea167a\n' > /tmp/debug/env

# busybox httpd daemonizes: the servers keep running after setup.
httpd -p 8080 -h /tmp/www
httpd -p 9090 -h /tmp/debug
