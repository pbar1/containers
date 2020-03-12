helm-package:
	@helm package charts/sonarr  --destination=docs
	@helm package charts/radarr  --destination=docs
	@helm package charts/bazarr  --destination=docs
	@helm package charts/duckdns --destination=docs
	@helm package charts/plex    --destination=docs

helm-index: helm-package
	@helm repo index docs --url=https://pbar1.github.io/containers/
