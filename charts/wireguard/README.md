# wireguard

![Version: 0.0.0](https://img.shields.io/badge/Version-0.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Simple yet fast and modern VPN that utilizes state-of-the-art cryptography.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"linuxserver/wireguard"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| securityContext.capabilities.add[1] | string | `"SYS_MODULE"` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
| wireguard.configHostPath | string | `"/config/wireguard"` |  |
| wireguard.internalSubnet | string | `"10.13.13.0"` |  |
| wireguard.modulesHostPath | string | `"/lib/modules"` |  |
| wireguard.peerDns | string | `"auto"` |  |
| wireguard.peers | int | `1` |  |
| wireguard.pgid | int | `1000` |  |
| wireguard.port | int | `51820` |  |
| wireguard.puid | int | `1000` |  |
| wireguard.serverPort | int | `51820` |  |
| wireguard.serverUrl | string | `"auto"` |  |
| wireguard.tz | string | `"Etc/UTC"` |  |
