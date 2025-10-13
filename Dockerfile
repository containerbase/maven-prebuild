FROM ghcr.io/containerbase/base:13.22.0@sha256:038763807dc75b7edad3b17a228af8a265af2bbb7b32b369d0bd37989e870551

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
