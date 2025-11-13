FROM ghcr.io/containerbase/base:13.24.3@sha256:72b10305f0d7ac3eb4208d622d5ca9338c8184a312e28dbd7bdf91de79a21e10

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
