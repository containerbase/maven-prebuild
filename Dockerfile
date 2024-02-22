FROM ghcr.io/containerbase/base:10.1.3@sha256:956a9b8b629a75fc6b6b4105adaf919d8e4cf0e260eb04bdef970f352c3fce57

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
