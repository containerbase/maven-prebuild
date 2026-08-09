FROM ghcr.io/containerbase/base:14.13.19@sha256:61bb7837974628d06a52ba1a9fcb5b09e2e6f64f5744946084ab60a9a7b24d2e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
