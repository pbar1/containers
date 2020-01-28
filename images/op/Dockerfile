FROM 1password/op as build
FROM gcr.io/distroless/base
COPY --from=build /usr/local/bin/op /
ENTRYPOINT ["/op"]
