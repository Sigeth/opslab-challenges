#!/bin/sh
# Reference solution (teachers only).
set -eu
cd "$HOME"
chmod 0700 .ssh
chmod 0600 .ssh/id_ed25519
chmod 0600 app/.env
chmod 0755 bin/backup.sh
sed -i '/hunter2/d' .bash_history
