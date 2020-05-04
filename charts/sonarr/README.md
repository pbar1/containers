sonarr
======
Smart PVR for newsgroup and bittorrent users

Current chart version is `0.0.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"linuxserver/sonarr"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| sonarr.config.hostPath | string | `"/config/sonarr"` |  |
| sonarr.downloads.hostPath | string | `"/downloads"` |  |
| sonarr.pgid | int | `1000` |  |
| sonarr.port | int | `8989` |  |
| sonarr.puid | int | `1000` |  |
| sonarr.tv.hostPath | string | `"/tv"` |  |
| sonarr.tz | string | `"Etc/UTC"` |  |
| tolerations | list | `[]` |  |
