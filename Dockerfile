FROM ghcr.io/containerbase/base:14.25.1@sha256:d726ebe68a17efc4b0232453dade0f4b74c973ae438164336fc1b9894914e819

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
