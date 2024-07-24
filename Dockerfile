FROM ghcr.io/containerbase/base:10.17.0@sha256:1f89af8600a4142a619c326a6e64b0d8d822233e355ce494e43fc6208b55c68c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
