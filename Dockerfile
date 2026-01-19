FROM ghcr.io/containerbase/base:13.26.6@sha256:eabf9c3256c8782947269d9b78694d7ed3fee1f73d8ee1e9412532c8657d0d31

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
