# Leaky home directory

You inherit the account of a developer who left in a hurry. Their home directory works, but it is careless: other users of the machine can read secrets and change what runs.

Lock it down without deleting anything the application needs:

- **SSH key:** the private key `~/.ssh/id_ed25519` and the `~/.ssh` directory must be private.
- **Application secrets:** `~/app/.env` holds the database password and an API token. Only you may access it.
- **Scripts:** `~/bin/backup.sh` runs every night with your rights. Nobody else may modify anything in `~/bin`.
- **Shell history:** the database password was typed on the command line and ended up in `~/.bash_history`. Remove it, and keep the rest of the history.

Useful commands: `ls -la`, `stat`, `chmod`, `find ~ -perm -o+r`, `grep`, `sed`.

Press **Check my work** whenever you want: each task is checked from outside your machine.
