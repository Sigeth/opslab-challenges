# opslab challenges

The official challenges of [opslab](https://github.com/Sigeth) (working name), a self-hosted platform of hands-on DevOps security challenges.

| Challenge | Category | Difficulty | Machines |
|---|---|---|---|
| [leaky-home](leaky-home) | Linux hardening | easy | 1 `pod` |
| [exposed-debug-port](exposed-debug-port) | Containers | easy | 1 `pod` |

## Layout

Every directory holding a `challenge.yaml` is one challenge package, with its own version (`metadata.version`), released and installed independently:

```
<challenge>/
  challenge.yaml          manifest: machines, access, tasks and their checks
  instructions/en.md      what the student reads
  images/<machine>/       Dockerfile of each machine image
  setup/                  scripts run once when an instance starts
  solution/               reference solution (teachers and tests only)
```

To add a challenge, copy [opslab-challenge-template](https://github.com/Sigeth/opslab-challenge-template) into a new directory. Its README is the author guide. Machine images follow the same rules here: a `student` user and group (1000:1000), and only the tools the tasks need.

## Development

```sh
opslab challenge lint leaky-home
opslab challenge images leaky-home                       # images built from images/<machine>/
opslab challenge manifest leaky-home | kubectl apply -f -   # install on a dev platform (unsigned)
```

CI lints every challenge. In the opslab workspace, `make dev-challenges` (or Tilt) builds the images and installs every challenge on the dev cluster.

## License

[MIT](LICENSE)
