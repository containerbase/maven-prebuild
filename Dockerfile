FROM ghcr.io/containerbase/base:10.3.5@sha256:128b55dcf0b623339e5184df7d92bae4c7b5eb8e8dc955e797ed3c3ea2a6f8a4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
