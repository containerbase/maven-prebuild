FROM ghcr.io/containerbase/base:13.0.7@sha256:a5dff667bb43c80408b4ca70800642511a491c219485e3207fc04811763f542e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
