FROM ghcr.io/containerbase/base:10.6.16@sha256:dc8294bd9b74c0208efed8887f42971b52e537c45d5317eab5b1f3d59f13f5e6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
