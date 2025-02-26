FROM ghcr.io/containerbase/base:13.8.3@sha256:81461c7705c65631c5a5b93b0953ca899aa452297856952756baa2b25509047c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
