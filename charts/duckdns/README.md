duckdns
=======
Free service which will point DNS to an IP of your choice

Current chart version is `0.0.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| duckdns.pgid | int | `1000` |  |
| duckdns.puid | int | `1000` |  |
| duckdns.subdomains | string | `"subdomain1,subdomain2"` |  |
| duckdns.tokenSecret | string | `"ducksdns-token"` |  |
| duckdns.tz | string | `"Etc/UTC"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"linuxserver/duckdns"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
