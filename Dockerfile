FROM ghcr.io/containerbase/base:13.8.21@sha256:87983746e27b482fd24cbe759f86314d1895e910a6d33e78b8ca319dbbd67c04

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
