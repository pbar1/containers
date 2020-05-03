helm-docs:
	@bash scripts/helm-docs.sh charts/sonarr
	@bash scripts/helm-docs.sh charts/radarr
	@bash scripts/helm-docs.sh charts/bazarr
	@bash scripts/helm-docs.sh charts/jackett
	@bash scripts/helm-docs.sh charts/duckdns
	@bash scripts/helm-docs.sh charts/plex
	@bash scripts/helm-docs.sh charts/transmission

helm-package: helm-docs
	@helm package charts/sonarr       --destination=docs
	@helm package charts/radarr       --destination=docs
	@helm package charts/bazarr       --destination=docs
	@helm package charts/jackett      --destination=docs
	@helm package charts/duckdns      --destination=docs
	@helm package charts/plex         --destination=docs
	@helm package charts/transmission --destination=docs

helm-index: helm-package
	@helm repo index docs --url=https://pbar1.github.io/containers/
