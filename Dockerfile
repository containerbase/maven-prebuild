FROM ghcr.io/containerbase/base:14.31.0@sha256:cff8880b751e44856ab0bbd37e1a83e4d8139e0a1849609b6f9f86e3e75123f0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
