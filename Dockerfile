FROM ghcr.io/containerbase/base:10.5.1@sha256:f8312bb7daa53d6a6c825af1dc753a772060a6053c078e0c4164382858476ae3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
