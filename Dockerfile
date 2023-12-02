FROM ghcr.io/containerbase/base:9.26.2@sha256:6141ff30c1246c281db65043be438a77e4ced6e6f880a6ee3e4d3eade61bdcf0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
