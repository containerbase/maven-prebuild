FROM ghcr.io/containerbase/base:14.20.2@sha256:6c9e427202975b565ea50f450b66c74ddbef0d2952b7b8dfa6b9b0dacf622215

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
