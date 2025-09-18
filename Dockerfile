FROM ghcr.io/containerbase/base:13.13.7@sha256:de3ffa48fc017b3c2c34d60b93f952dc1f19d7ebee2aa5615801d77393d66500

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
