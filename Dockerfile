FROM ghcr.io/containerbase/base:13.0.3@sha256:3ffe63dfd008190001138e1f046566e0394a1c6daeb810cfef3895be0873a89b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
