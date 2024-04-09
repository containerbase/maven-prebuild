FROM ghcr.io/containerbase/base:10.3.13@sha256:07057011001be8149ffc113f364d88a5b8e768a08562f73d9f65e4b72c56d105

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
