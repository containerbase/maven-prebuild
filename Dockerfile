FROM ghcr.io/containerbase/base:10.6.15@sha256:4ca97d64f58f3dd66d467a8e0a17378dc2d2a9a3325e835dfd098a3d5c0315e3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
