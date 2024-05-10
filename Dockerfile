FROM ghcr.io/containerbase/base:10.6.9@sha256:f7dd659c07e2f733f442f66f78bec2192c42a8ff85db58b8ee249aa1d8e3a5d8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
