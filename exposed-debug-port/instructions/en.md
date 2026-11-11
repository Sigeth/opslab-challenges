# Exposed debug port

The `web` container runs the shop's site with busybox `httpd` on port **8080**. An audit found two leaks:

- the document root contains a database dump, `backup.sql`, that anyone can download;
- a debug server started during development still listens on port **9090** and serves the application's environment, passwords included.

Close both leaks. The home page on port 8080 must keep working: customers are using it.

Try the site from your terminal with `wget -qO- http://localhost:8080/`. Useful commands: `ps`, `netstat -tlnp`, `kill`, `ls /tmp/www`.

The checks connect to your container **from the network**, like a real visitor would.
