#!/bin/sh
# Runs once when the instance starts, as the student user (UID 1000): leave
# secrets lying around with careless permissions.
set -eu
cd "$HOME"
mkdir -p .ssh app bin

cat > .ssh/id_ed25519 <<'KEY'
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBvcHNsYWItdHJhaW5pbmcta2V5LW5vdC1hLXJlYWwtc2VjcmV0AAAAAAAA
-----END OPENSSH PRIVATE KEY-----
KEY
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG9wc2xhYi10cmFpbmluZw dev@laptop" > .ssh/id_ed25519.pub
chmod 0644 .ssh/id_ed25519 .ssh/id_ed25519.pub
chmod 0755 .ssh

printf 'DB_HOST=db.internal\nDB_USER=shop\nDB_PASSWORD=hunter2\nAPI_TOKEN=tok_live_51f0c2a9\n' > app/.env
chmod 0644 app/.env

cat > bin/backup.sh <<'SCRIPT'
#!/bin/sh
# Nightly backup of the application, run from cron.
tar czf "/tmp/app-$(date +%F).tgz" "$HOME/app"
SCRIPT
chmod 0777 bin/backup.sh

printf 'ls -la\ncd app\nmysql -h db.internal -u shop -phunter2 shop\nexport DB_PASSWORD=hunter2\n./deploy.sh\n' > .bash_history
chmod 0600 .bash_history
