FROM ghcr.io/containerbase/base:14.14.1@sha256:ff5cec29c82fc83836115c9aff12456ed170cccf80d0b69c7c14834a2972fca3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
