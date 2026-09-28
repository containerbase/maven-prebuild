FROM ghcr.io/containerbase/base:14.20.1@sha256:e17cf060f30485b8580831e2bcd117a3c818effd7e48ce98c4225a05b45623f0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
