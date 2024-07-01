FROM ghcr.io/containerbase/base:10.12.1@sha256:a40f3d9e8d46afb1e4dd200329b5a663b2e796f772748f67d1f53d4fa18e5ff8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
