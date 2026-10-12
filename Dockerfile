FROM ghcr.io/containerbase/base:14.32.0@sha256:f2704aa1a5c1bd5bf73658ec8b3ce4ec76b36f87a3e6593dcf6b52439e35765e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
