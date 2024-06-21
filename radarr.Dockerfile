FROM ghcr.io/hotio/radarr:nightly AS app
FROM alpine:latest

RUN apk add --no-cache libintl sqlite-libs icu-libs ffmpeg

RUN adduser -D -s /sbin/nologin -G users -u 1000 user && mkdir /config && chown -R user:users /config
USER user

COPY --from=app --chown=user:users /app/bin /app

ENTRYPOINT ["/app/Radarr"]
CMD ["-nobrowser", "-data=/config"]

LABEL org.opencontainers.image.source https://github.com/pbar1/containers