FROM ghcr.io/containerbase/base:13.2.0@sha256:d1cdd6fd12da540119884af0c2e52447e046aad06f1f552439c297f1cd9b0a1e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
