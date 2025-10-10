FROM ghcr.io/containerbase/base:13.20.2@sha256:bb8a3dc2b1b64ef81c43ae60b321091b51f36a93d88ab4cedefd8eedf998c9d5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
