local kube = import "lib/kube.libsonnet";

{
  readarr_statefulset: kube.StatefulSet("readarr") {
    spec+: {
      template+: {
        spec+: {
          containers_+: {
            readarr: kube.Container("readarr") {
              image: "hotio/readarr:unstable",
              resources: { requests: { cpu: "100m", memory: "256Mi" } },
              env_+: {
                PUID: "1000",
                PGID: "1000",
                TZ: "America/Los_Angeles"
              },
              ports_+: { http: { containerPort: 8787 } },
              volumeMounts_+: {
                config: { mountPath: "/config" },
                downloads: { mountPath: "/downloads"},
                books: { mountPath: "/books" },
              },
          }},
          volumes_+: {
            config: { hostPath: { path: "/data/docker/jsonnetreadarr" } },
            downloads: { hostPath: { path: "/data/downloads" } },
            books: { hostPath: { path: "/data/paperbooks" } },
  }}}}},

  readarr_service: kube.Service("readarr") {
    target_pod: $.readarr_statefulset.spec.template,
  },
}
