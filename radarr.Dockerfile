FROM ghcr.io/hotio/radarr:nightly AS app
FROM ghcr.io/pbar1/arr-base:latest

COPY --from=app --chown=user:users /app/bin /app

ENTRYPOINT ["/app/Radarr"]
CMD ["-nobrowser", "-data=/config"]