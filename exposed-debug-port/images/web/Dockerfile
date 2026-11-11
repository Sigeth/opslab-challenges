# Image of the "web" machine: busybox alone provides the shell, httpd, netstat,
# ps, kill and wget the challenge needs. No sudo, no package manager.
FROM docker.io/library/busybox:1.37@sha256:a7dbc319b1438115a207e11930dc4bb3e643dcb3ec0bdd694bb36cd8fad289ec
RUN addgroup -g 1000 student \
 && adduser -D -u 1000 -G student -h /home/student -s /bin/sh student
# Run as the unprivileged student user (pod machines always run as 1000:1000).
USER 1000:1000
WORKDIR /home/student
CMD ["sh"]
