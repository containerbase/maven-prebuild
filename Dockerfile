FROM ghcr.io/containerbase/base:13.24.0@sha256:92a9bc4a65e23c0ad813a651138f4b4610daa8bddd25767c71877262f60ec7b4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
