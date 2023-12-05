FROM alpine:latest

LABEL org.opencontainers.image.authors="s.r.walker101@gmail.com"

RUN apk --no-cache add \
    aws-cli \
    bind-tools \
    curl \
    iproute2 \
    jq \
    nmap \
    openssl \
    py3-boto3 \
    tini

# install fx
ENV FX_VERSION=24.0.0
ENV FX_URL=https://github.com/antonmedv/fx/releases/download/$FX_VERSION/fx_linux_amd64
RUN curl -Lo /usr/local/bin/fx $FX_URL && \
    chmod +x /usr/local/bin/fx

# install cert-info
ENV CERT_INFO_VERSION=0.1.1
# TODO: arch specific
ENV CERT_INFO_URL=https://github.com/simonrw/cert-info/releases/download/v$CERT_INFO_VERSION/cert-info_${CERT_INFO_VERSION}_linux_amd64.tar.gz
ENV CERT_INFO_TARBALL_NAME=/tmp/cert-info_${CERT_INFO_VERSION}_linux_amd64.tar.gz
RUN curl -Lo ${CERT_INFO_TARBALL_NAME} ${CERT_INFO_URL} && \
    tar -C /tmp -x -f ${CERT_INFO_TARBALL_NAME} && \
    mv /tmp/cert-info /usr/local/bin/cert-info && \
    chmod +x /usr/local/bin/cert-info && \
    rm ${CERT_INFO_TARBALL_NAME}

ENTRYPOINT ["/sbin/tini", "--"]
