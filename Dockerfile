FROM ghcr.io/containerbase/base:13.18.0@sha256:2e5be16694c33e809a99fbce699a2560683589e890d0ff0a9a0b533d204af510

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
