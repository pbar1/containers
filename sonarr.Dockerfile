FROM ghcr.io/hotio/sonarr:nightly AS app
FROM ghcr.io/pbar1/arr-base:latest

COPY --from=app --chown=user:users /app/bin /app

ENTRYPOINT ["/app/Sonarr"]
CMD ["-nobrowser", "-data=/config"]