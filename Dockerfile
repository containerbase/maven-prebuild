FROM ghcr.io/containerbase/base:11.11.28@sha256:3c833f29d6501127d3f81c6a6fc3103bb986e171168c5be476a7b4babcd54849

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
