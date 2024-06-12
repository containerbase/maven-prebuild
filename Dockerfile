FROM ghcr.io/containerbase/base:10.11.4@sha256:5276e3fd11f75d8102b2c375a45586c0fd3fcd4be946b9b03464eb38efdb2f91

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
