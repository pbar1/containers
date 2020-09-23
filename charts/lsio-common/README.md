# lsio-common

![Version: 0.0.0](https://img.shields.io/badge/Version-0.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: preview](https://img.shields.io/badge/AppVersion-preview-informational?style=flat-square)

Smart PVR for newsgroup and bittorrent users

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| environment | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| hostPaths | object | `{}` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"linuxserver/lsio-common"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| lsioCommon.pgid | int | `1000` |  |
| lsioCommon.puid | int | `1000` |  |
| lsioCommon.tz | string | `"America/Los_Angeles"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.containerPort | int | `8080` |  |
| service.nodePort | int | `30080` |  |
| service.port | int | `80` |  |
| service.portName | string | `"http"` |  |
| service.protocol | string | `"TCP"` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
