FROM appropriate/curl as kubectl
WORKDIR /workdir
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.2/bin/linux/amd64/kubectl && \
    chmod +x kubectl

FROM vault:1.3.2 as vault

FROM k8s.gcr.io/busybox
RUN mkdir -p /usr/local/bin
COPY --from=kubectl /workdir/kubectl /usr/local/bin
COPY --from=vault /bin/vault /usr/local/bin
ENTRYPOINT ["kubectl"]
