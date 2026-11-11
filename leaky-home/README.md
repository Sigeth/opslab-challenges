# leaky home directory

A beginner **Linux hardening** challenge for [opslab](https://github.com/Sigeth) (working name): fix the permissions of an SSH key, an application secrets file and a world-writable script, and clean a password out of the shell history.

- Runtime: one `pod` machine built from `images/box` (Alpine + bash, unprivileged user `student`)
- Checks: `file` (mode, content) and `shell`
- Solution: `solution/solve.sh` (for teachers and `opslab challenge test`)

```sh
opslab challenge lint leaky-home
opslab challenge manifest leaky-home | kubectl apply -f -   # install on a dev platform
```

## License

[MIT](../LICENSE)
