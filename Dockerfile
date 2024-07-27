FROM ghcr.io/containerbase/base:11.1.2@sha256:2a81ece6b085eed6f5faaf8be4a6d696c977ee82d22258cc6629751ea821687e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
