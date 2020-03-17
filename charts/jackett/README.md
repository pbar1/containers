jackett
======
Smart PVR for newsgroup and bittorrent users

Current chart version is `0.0.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/jackett"` |  |
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
| jackett.config.hostPath | string | `"/config/jackett"` |  |
| jackett.downloads.hostPath | string | `"/downloads"` |  |
| jackett.pgid | int | `1000` |  |
| jackett.port | int | `9117` |  |
| jackett.puid | int | `1000` |  |
| jackett.tv.hostPath | string | `"/tv"` |  |
| jackett.tz | string | `"Etc/UTC"` |  |
| tolerations | list | `[]` |  |
