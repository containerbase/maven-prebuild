FROM ghcr.io/containerbase/base:13.20.0@sha256:5c7ebd7c44bcb43fea8e3856cec06683449d4f5eb6fc007ac33a6d13086da078

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
