FROM ghcr.io/hotio/prowlarr:nightly AS app
FROM ghcr.io/pbar1/arr-base:latest

COPY --from=app --chown=user:users /app/bin /app

ENTRYPOINT ["/app/Prowlarr"]
CMD ["-nobrowser", "-data=/config"]

LABEL org.opencontainers.image.source https://github.com/pbar1/containers