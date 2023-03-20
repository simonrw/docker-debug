FROM alpine:latest

LABEL org.opencontainers.image.authors="s.r.walker101@gmail.com"

RUN apk --no-cache add \
    curl \
    iproute2 \
    bind-tools \
    py3-boto3
