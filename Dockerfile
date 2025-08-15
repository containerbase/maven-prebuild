FROM ghcr.io/containerbase/base:13.9.0@sha256:9666d79615bf7a6ef26a37c2a26b8065edb33a524c78d75955c93b907b8237c7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
