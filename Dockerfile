FROM ghcr.io/containerbase/base:14.7.0@sha256:72494230cc680301536d1eb01160a16e0adc5fb637c4743865a4511fc04915cc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
