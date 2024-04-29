FROM ghcr.io/containerbase/base:10.5.2@sha256:97f4e4abced8f5a63b57557c84039e512616273845128a32d3aca95321627a5e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
