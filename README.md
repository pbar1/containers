# containers

My automated container image builds. Generally, they'll adhere to a few loose
guidelines.

- Rootless
- $USER = user
- $GROUP = users
- $UID = 1000
- $GID = 100

New images are built via GitHub Actions daily at 08:00 UTC.
