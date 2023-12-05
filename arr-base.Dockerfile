LABEL org.opencontainers.image.source https://github.com/pbar1/containers
FROM alpine:latest

RUN apk add --no-cache tzdata icu-libs sqlite-libs

RUN adduser -D -s /sbin/nologin -G users -u 1000 user && mkdir /config && chown -R user:users /config
USER user