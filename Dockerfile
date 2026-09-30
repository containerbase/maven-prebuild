FROM ghcr.io/containerbase/base:14.21.0@sha256:7cd631b480d71a93adeb126890ef0823672b724df2662ba8e784284c548db177

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
