FROM ghcr.io/containerbase/base:13.8.59@sha256:12a5ba995def0a5bf62eed579335897b8757b52f75e8d77d4c3c46e358770124

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
