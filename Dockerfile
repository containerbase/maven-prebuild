FROM ghcr.io/containerbase/base:10.6.11@sha256:f794deebb50ecd22a84377f22bd70ef6d9341ffc8cb795114d28da7ae7dee48e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
