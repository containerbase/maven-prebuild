FROM ghcr.io/containerbase/base:13.13.1@sha256:97595d32fc856428104bb281fb68ff168a4d52018ed80fc75fb9cb498a4afa60

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
