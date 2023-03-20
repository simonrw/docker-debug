FROM alpine:latest

LABEL org.opencontainers.image.authors="s.r.walker101@gmail.com"

RUN apk --no-cache add \
    curl \
    iproute2 \
    bind-tools \
    jq \
    py3-boto3

# install fx
ENV FX_VERSION=24.0.0
ENV FX_URL=https://github.com/antonmedv/fx/releases/download/$FX_VERSION/fx_linux_amd64
RUN curl -Lo /usr/local/bin/fx $FX_URL && \
    chmod +x /usr/local/bin/fx
