FROM ghcr.io/containerbase/base:14.50.0@sha256:c8289c680c23b4fa45998a53e601f0f2e7ef7693fd0a93c6b24acfb58d972dfd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
