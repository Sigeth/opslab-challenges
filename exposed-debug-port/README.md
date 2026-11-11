# exposed debug port

A beginner **containers** challenge for [opslab](https://github.com/Sigeth) (working name): a web container leaks a database dump and runs a forgotten debug server. The student closes both leaks while keeping the site up.

- Runtime: one `pod` machine built from `images/web` (busybox only, unprivileged user `student`)
- Checks: `port` and `http`, probed from the network (black-box)
- Solution: `solution/solve.sh` (for teachers and `opslab challenge test`)

```sh
opslab challenge lint exposed-debug-port
opslab challenge manifest exposed-debug-port | kubectl apply -f -   # install on a dev platform
```

## License

[MIT](../LICENSE)
