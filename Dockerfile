FROM ghcr.io/containerbase/base:13.23.11@sha256:6ab6a08763ab0539e85e33fc4684235d98d8cd958ab5cd1b90e41ad9b76d6a44

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
