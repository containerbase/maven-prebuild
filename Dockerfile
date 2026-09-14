FROM ghcr.io/containerbase/base:14.15.0@sha256:558d3c79e6d804763a333454c3597eb0524fd45fe02e900c0a8d14cf726b393b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
