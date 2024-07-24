FROM ghcr.io/containerbase/base:11.0.0@sha256:5560879bc953b77edb6ddf0c214ba41c23883ad82e0e685a394dbb89f3b63d95

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
