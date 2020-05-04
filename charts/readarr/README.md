readarr
=======
Book, Magazine, Comics Ebook and Audiobook Manager and Automation

Current chart version is `0.0.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"hotio/readarr"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readarr.booksHostPath | string | `"/books"` |  |
| readarr.configHostPath | string | `"/config/readarr"` |  |
| readarr.debug | string | `"yes"` |  |
| readarr.downloadsHostPath | string | `"/downloads"` |  |
| readarr.pgid | int | `1000` |  |
| readarr.port | int | `8787` |  |
| readarr.puid | int | `1000` |  |
| readarr.tz | string | `"Etc/UTC"` |  |
| readarr.umask | string | `"002"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
