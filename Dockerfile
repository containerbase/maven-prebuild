FROM ghcr.io/containerbase/base:12.0.3@sha256:066de862aa5ca7d33756255ad41afcaf965c6cc51c5cdb65b20d6d389580e01e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
