local kube = import 'lib/kube.libsonnet';

local MyStatefulSet(name, image, port, hostPaths=[], env=[], resources={}) = {
  statefulset: kube.StatefulSet(name) {
    metadata+: { namespace: name },
    spec+: {
      template+: {
        spec+: {
          containers_+: {
            readarr: kube.Container(name) {
              image: image,
              imagePullPolicy: 'Always',
              resources: { requests: { cpu: '100m', memory: '256Mi' } } + resources,
              env_+: { PUID: '1000', PGID: '1000', TZ: 'America/Los_Angeles' } + {
                [e.name]: e.value
                for e in env
              },
              ports_+: (if port != null then { http: { containerPort: port } } else {}),
              volumeMounts_+: {
                [p.name]: { mountPath: p.ctrPath }
                for p in hostPaths
              },
            },
          },
          volumes_+: {
            [p.name]: { hostPath: { path: p.hostPath } }
            for p in hostPaths
          },
        },
      },
    },
  },
  service: kube.Service(name) {
    metadata+: { namespace: name },
    target_pod: $.statefulset.spec.template,
  },
};

local RemoveService = { service:: super.service };

local HostNetwork = {
  statefulset: super.statefulset + { spec+: { template+: { spec+: {
    hostNetwork: true,
  } } } },
};


local AddPiaContainer(name, image, env=[], resources={}) = {
  statefulset: super.statefulset + { spec+: { template+: { spec+: {
    containers_+: {
      name: kube.Container(name) {
        image: image,
        imagePullPolicy: 'Always',
        securityContext: { capabilities: { add: ['NET_ADMIN'] } },
        resources: { requests: { cpu: '100m', memory: '256Mi' } } + resources,
        env_+: {
          TZ: 'America/Los_Angeles',
          TINYPROXY: 'off',
          SHADOWSOCKS: 'on',
          SHADOWSOCKS_PASSWORD: 'shadowsocks',
        } + {
          [e.name]: e.value
          for e in env
        },
        ports_+: {
          'socks-tcp': { containerPort: 8388, protocol: 'TCP' },
          'socks-udp': { containerPort: 8388, protocol: 'UDP' },
        },
      },
    },
  } } } },
};

{
  duckdns: MyStatefulSet('duckdns', 'linuxserver/duckdns', null, [], [
    { name: 'SUBDOMAINS', value: 'rogueport' },
    { name: 'TOKEN', value: 'TODO' },
  ]) + RemoveService,
  plex: MyStatefulSet('plex', 'linuxserver/plex', null, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/plex' },
    { name: 'movies', ctrPath: '/movies', hostPath: '/data/movies' },
    { name: 'tv', ctrPath: '/tv', hostPath: '/data/tvshows' },
  ], [
    { name: 'VERSION', value: 'docker' },
  ], { limits: { cpu: 2, memory: '2Gi' } }) + RemoveService + HostNetwork,
  sonarr: MyStatefulSet('sonarr', 'linuxserver/sonarr', 8989, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/sonarr' },
    { name: 'tv', ctrPath: '/tv', hostPath: '/data/tvshows' },
    { name: 'downloads', ctrPath: '/downloads', hostPath: '/data/downloads' },
  ]),
  radarr: MyStatefulSet('radarr', 'linuxserver/radarr', 7878, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/radarr' },
    { name: 'movies', ctrPath: '/movies', hostPath: '/data/movies' },
    { name: 'downloads', ctrPath: '/downloads', hostPath: '/data/downloads' },
  ]),
  readarr: MyStatefulSet('readarr', 'hotio/readarr:unstable', 8787, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/readarr' },
    { name: 'downloads', ctrPath: '/downloads', hostPath: '/data/downloads' },
    { name: 'books', ctrPath: '/books', hostPath: '/data/paperbooks' },
  ]),
  bazarr: MyStatefulSet('bazarr', 'linuxserver/bazarr', 6767, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/bazarr' },
    { name: 'movies', ctrPath: '/movies', hostPath: '/data/movies' },
    { name: 'tv', ctrPath: '/tv', hostPath: '/data/tvshows' },
  ]),
  jackett: MyStatefulSet('jackett', 'linuxserver/jackett', 9117, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/jackett' },
  ]),
  transmission: MyStatefulSet('transmission', 'linuxserver/transmission', 9091, [
    { name: 'config', ctrPath: '/config', hostPath: '/data/docker/transmission' },
    { name: 'downloads', ctrPath: '/downloads', hostPath: '/data/downloads' },
  ], [
    { name: 'TRANSMISSION_WEB_HOME', value: '/kettu/' },
    { name: 'USER', value: 'TODO' },
    { name: 'PASS', value: 'TODO' },
  ]) + AddPiaContainer('private-internet-access', 'qmcgaw/private-internet-access:v2', [
    { name: 'REGION', value: 'Switzerland' },
    { name: 'USER', value: 'TODO' },
    { name: 'PASSWORD', value: 'TODO' },
    { name: 'EXTRA_SUBNETS', value: '192.168.1.0/24' },
  ]),
}
