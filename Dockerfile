FROM ghcr.io/containerbase/base:13.12.2@sha256:a5cd10956bb0b0febb4383863e96cce9727832a24c87349ce65e3dedfaa4063e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
