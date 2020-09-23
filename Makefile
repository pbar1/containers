helm-docs:
	@bash scripts/helm-docs.sh charts/duckdns
	@bash scripts/helm-docs.sh charts/plex
	@bash scripts/helm-docs.sh charts/transmission
	@bash scripts/helm-docs.sh charts/wireguard
	@bash scripts/helm-docs.sh charts/lsio-common

helm-package: helm-docs
	@helm package charts/duckdns      --destination=docs
	@helm package charts/plex         --destination=docs
	@helm package charts/transmission --destination=docs
	@helm package charts/wireguard    --destination=docs
	@helm package charts/lsio-common  --destination=docs

helm-index: helm-package
	@helm repo index docs --url=https://pbar1.github.io/containers/

test-cluster-up:
	@k3d cluster create tec-staging \
		--agents=3 \
		--k3s-server-arg --disable=traefik \
		--k3s-server-arg '--kube-apiserver-arg=service-node-port-range=1-65535'
	@helm repo add fluxcd https://charts.fluxcd.io && helm repo update
	@helm upgrade helm-operator fluxcd/helm-operator \
		--install \
		--atomic \
		--verify \
		--set helm.versions=v3

test-cluster-down:
	@k3d cluster delete tec-staging
