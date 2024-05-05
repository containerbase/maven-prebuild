FROM ghcr.io/containerbase/base:10.6.1@sha256:9f302797b4cce825693829d5c3435ffee9fc340e4e3356ff82347c476d039732

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
