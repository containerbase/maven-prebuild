FROM ghcr.io/containerbase/base:13.12.0@sha256:32b21d8fd7e3b984e57bbb42c50bb9dcb025a6a045e8a661e9717d69a8be0ffd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
