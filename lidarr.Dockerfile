FROM ghcr.io/hotio/lidarr:nightly AS app
FROM ghcr.io/pbar1/arr-base:latest

COPY --from=app --chown=user:users /app/bin /app

ENTRYPOINT ["/app/Lidarr"]
CMD ["-nobrowser", "-data=/config"]