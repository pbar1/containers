transmission
============
A fast, easy, and free BitTorrent client

Current chart version is `0.0.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/transmission"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| privateInternetAccess.credentialsSecret | string | `""` |  |
| privateInternetAccess.extraSubnets | string | `"0.0.0.0/32"` |  |
| privateInternetAccess.image.name | string | `"qmcgaw/private-internet-access"` |  |
| privateInternetAccess.image.pullPolicy | string | `"IfNotPresent"` |  |
| privateInternetAccess.image.tag | string | `"v2"` |  |
| privateInternetAccess.region | string | `"Switzerland"` |  |
| privateInternetAccess.shadowSocks | string | `"on"` |  |
| privateInternetAccess.shadowSocksPassword | string | `"shadowsocks"` |  |
| privateInternetAccess.shadowSocksPort | int | `8388` |  |
| privateInternetAccess.tinyProxy | string | `"off"` |  |
| privateInternetAccess.tz | string | `"Etc/UTC"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
| transmission.config.hostPath | string | `"/config/transmission"` |  |
| transmission.downloads.hostPath | string | `"/downloads"` |  |
| transmission.pass | string | `"transmission"` |  |
| transmission.pgid | int | `1000` |  |
| transmission.port | int | `9091` |  |
| transmission.proxyPort | int | `8388` |  |
| transmission.puid | int | `1000` |  |
| transmission.torrentPort | int | `51413` |  |
| transmission.tz | string | `"Etc/UTC"` |  |
| transmission.user | string | `"transmission"` |  |
| transmission.webHome | string | `"/kettu/"` |  |
