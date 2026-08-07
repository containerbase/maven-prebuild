FROM ghcr.io/containerbase/base:14.13.16@sha256:9543fd8aaa71df9cc386517ccd6188b65ba67b7ee249461b224142639f80145c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
