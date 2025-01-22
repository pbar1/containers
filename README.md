# containers

My automated container image builds. Generally, they'll adhere to a few loose
guidelines.

- Rootless
  - User/Group: `user:users`
  - UID/GID: `1000:100`
- Multi-platform
  - linux/amd64
  - linux/arm64

New images are built via GitHub Actions daily at 08:00 UTC and tagged `latest`.

